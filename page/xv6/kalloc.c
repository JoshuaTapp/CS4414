// Physical memory allocator, intended to allocate
// memory for user processes, kernel stacks, page table pages,
// and pipe buffers. Allocates 4096-byte pages.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "spinlock.h"
unsigned char cow_reference_count[PHYSTOP / PGSIZE];


#define for_each(node, list) for(struct run* node = list; node != 0; node = node->next)

void freerange(void *vstart, void *vend);
extern char end[]; // first address after kernel loaded from ELF file
                   // defined by the kernel linker script in kernel.ld

struct run {
  struct run *next;
};

struct {
  struct spinlock lock;
  int use_lock;
  struct run *freelist;
} kmem;

// Initialization happens in two phases.
// 1. main() calls kinit1() while still using entrypgdir to place just
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
  char *p;
  if (vend < vstart) panic("freerange");
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
    kfree(p);
}
//PAGEBREAK: 21
// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");

  if(kmem.use_lock)
    acquire(&kmem.lock);
  
  uint size = V2P((void*)v)/PGSIZE;
  
  if(cow_reference_count[size] != 0)
     cow_reference_count[size]--;

  if(cow_reference_count[size] == 0){

  // Fill with junk to catch dangling refs.
    memset(v, 1, PGSIZE);

    r = (struct run*)v;
    r->next = kmem.freelist;
    kmem.freelist = r;
  }

  if(kmem.use_lock)
    release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = kmem.freelist;

  uint index = V2P((void*) r)/PGSIZE;

  if(r)
  {
    kmem.freelist = r->next;
    cow_reference_count[index] = 1;
  }
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}

int
pagefree(void* v)
{
  struct run *r;

  //if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
  //  panic("kfree");
  int result = 0;

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  for_each(n , kmem.freelist)
  {
    if(n == r) result = 1;
  }
   if(kmem.use_lock)
    release(&kmem.lock);

  return result;
}

void refincrement(uint pa){
  if(kmem.use_lock)
    acquire(&kmem.lock);

  uint index = pa / PGSIZE;
  cow_reference_count[index]++;

  if(kmem.use_lock)
    release(&kmem.lock);
}
