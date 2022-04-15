#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[]; // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;
extern unsigned char cow_reference_count[];

void tvinit(void)
{
  int i;

  for (i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE << 3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void idtinit(void)
{
  lidt(idt, sizeof(idt));
}

// PAGEBREAK: 41
void trap(struct trapframe *tf)
{
  if (tf->trapno == T_SYSCALL)
  {
    if (myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if (myproc()->killed)
      exit();
    return;
  }

  switch (tf->trapno)
  {
  case T_PGFLT:
    // cprintf("PAGE FAULT TRAO\n");
    /*
      HEAP TOP = myproc()->sz
      GUARD PAGE = page in between dynamic alloc and static alloc

    */
    if (0)
    {
    }
    char *mem;
    pde_t *pgdir = myproc()->pgdir;
    uint va = PGROUNDDOWN(rcr2());
    if (va >= KERNBASE)
    {
      cprintf("tried to alloc heap in kernel addr space\n");
      myproc()->killed = 1;
      break;
    }
    if (va >= myproc()->sz)
    {
      cprintf("Trying to access out of bounds\n");
      myproc()->killed = 1;
      break;
    }
    uint pte = *(walkpgdir(pgdir, (void *)va, 1));
    if (!(pte & PTE_U) && (pte & PTE_P))
    {
      myproc()->killed = 1;
      break;
    }
    if ((pte != 0 && pte & PTE_P) && !(pte & PTE_W))
    {
      uint index = PTE_ADDR(pte) / PGSIZE;
      if (cow_reference_count[index] > 0)
      {
        cow_reference_count[index]--;
        mem = kalloc();
        if (mem == 0)
        {
          cprintf("page fault, COW fail: out of memory\n");
          myproc()->killed = 1;
          break;
        }
        memmove(mem, (void *)P2V(PTE_ADDR(pte)), PGSIZE);
        *(walkpgdir(pgdir, (void *)va, 1)) = V2P(mem) | PTE_P | PTE_U | PTE_W;
        lcr3(V2P(pgdir));
        break;
      }
      else
      {
        pte |= PTE_W;
        lcr3(V2P(pgdir));
        break;
      }
    }

    else if (!(pte & PTE_P) || (walkpgdir(pgdir, (void *)va, 1) == 0))
    {
      mem = kalloc();
      memset(mem, 0, PGSIZE);
      if (mappages(pgdir, (char *)va, PGSIZE, V2P(mem), (PTE_U | PTE_W)) < 0)
      {
        cprintf("page fault fix failed in manpage: out of memory\n");
        kfree(mem);
        break;
      }
      break;
    }
    break;

  case T_IRQ0 + IRQ_TIMER:
    if (cpuid() == 0)
    {
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE + 1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;

  // PAGEBREAK: 13
  default:
    if (myproc() == 0 || (tf->cs & 3) == 0)
    {
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if (myproc() && myproc()->state == RUNNING &&
      tf->trapno == T_IRQ0 + IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
    exit();
}
