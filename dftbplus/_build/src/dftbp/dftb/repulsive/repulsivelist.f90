# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/allocatablelist.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/allocatablelist.fypp"
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/allocatablelist.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90" 2

!> Implements interface for the repulsive (force-field like) potential
module dftbp_dftb_repulsive_repulsivelist
  use dftbp_dftb_repulsive_repulsive, only : TRepulsive
  implicit none


# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
real, parameter :: TRepulsiveList_scalingFactor = 1.5
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
integer, parameter :: TRepulsiveList_minSlots = 4
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Container for an allocatable item
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
type :: TRepulsiveListItem
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  private
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsive), allocatable :: item
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end type TRepulsiveListItem
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Defines a list of allocatables of a specific type.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> The list stores allocatable items. All items transfered to the list via the push() method
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> and not removed via the pop() method will be deallocated if the list goes out of scope.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
type :: TRepulsiveList
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  private
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  ! Needs to be a pointer (instead of allocatable) to ensure, that we can safely point to
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  ! the individal items in the view() call.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  type(TRepulsiveListItem), pointer :: items(:) => null()
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: nItem = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: minSlots = TRepulsiveList_minSlots
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  real :: scalingFactor = TRepulsiveList_scalingFactor
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
contains
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  procedure :: push => TRepulsiveList_push
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  procedure :: pop => TRepulsiveList_pop
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  procedure :: view => TRepulsiveList_view
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  procedure :: size => TRepulsiveList_size
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  final :: TRepulsiveList_final
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end type TRepulsiveList
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"


contains


# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Initializes the list with explicit prealloc size.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> The initialization is optional and only needed, if you wish to override the preallocated
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> list size.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
subroutine TRepulsiveList_init(this, minSlots, scalingFactor)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Instance
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  type(TRepulsiveList), intent(out) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Minimal number of empty slots to create at startup or when resizing the internal storage
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> (default TRepulsiveList_minElements).
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer, optional, intent(in) :: minSlots
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Growth scaling factor to use when enlarging or shrinking the list
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  real, optional, intent(in) :: scalingFactor
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (present(minSlots)) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    this%minSlots = minSlots
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (present(scalingFactor)) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    this%scalingFactor = scalingFactor
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  allocate(this%items(this%minSlots))
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end subroutine TRepulsiveList_init
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Pushes an item to the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> The list takes ownership of the allocatable object.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
subroutine TRepulsiveList_push(this, item, pos)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Instance.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsiveList), intent(inout) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Item to push, unallocated on exit.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsive), allocatable, intent(inout) :: item
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> The item will be pushed at the specified position. Possible values: from 1 to size() + 1,
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> or from -size() to 0. The original element at this position and all following ones are
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> shifted by one position. Default: size() + 1, the pushed element will be the last one.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer, optional, intent(in) :: pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  type(TRepulsiveListItem), pointer :: buffer(:)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: pos_, ii
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (.not. associated(this%items)) call TRepulsiveList_init(this)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (present(pos)) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  else
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = this%nItem + 1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (this%nItem == size(this%items)) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    allocate(buffer(max(nint(real(this%nItem) * this%scalingFactor), this%nItem + this%minSlots)))
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    do ii = 1, this%nItem
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
      call move_alloc(this%items(ii)%item, buffer(ii)%item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    end do
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    deallocate(this%items)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    this%items => buffer
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (pos_ == 0) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = this%nItem + 1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  else if (pos_ < 0) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = this%nItem + 1 + pos_
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  do ii = this%nItem, pos_, -1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    call move_alloc(this%items(ii)%item, this%items(ii + 1)%item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end do
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  call move_alloc(item, this%items(pos_)%item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  this%nItem = this%nItem + 1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end subroutine TRepulsiveList_push
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Pops an element from the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> The list releases the ownership of the item.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
subroutine TRepulsiveList_pop(this, item, pos)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Instance.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsiveList), intent(inout) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Item which was popped from the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsive), allocatable, intent(out) :: item
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> The item will be poped from the specified position. Possible values: from 1 to size(),
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> or from -size() to -1. The original elements following this position will be shifted backwards
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> by one position. Default: size(this), the last element is popped from the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer, optional, intent(in) :: pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: newSize, pos_, ii
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  type(TRepulsiveListItem), pointer :: buffer(:)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (present(pos)) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  else
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = this%nItem
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (pos_ < 0) pos_ = this%nItem + 1 + pos_
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  call move_alloc(this%items(pos_)%item, item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  do ii = pos_, this%nItem - 1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    call move_alloc(this%items(ii + 1)%item, this%items(ii)%item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end do
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  this%nItem = this%nItem - 1
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  newSize = nint(size(this%items) / this%scalingFactor)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (newSize > this%nItem + this%minSlots) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    allocate(buffer(newSize))
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    do ii = 1, this%nItem
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
      call move_alloc(this%items(ii)%item, buffer(ii)%item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    end do
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    deallocate(this%items)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    this%items => buffer
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end subroutine TRepulsiveList_pop
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Gives a view to a given item in the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> NOTE: The list keeps the ownership of the object.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> This routine may only be called, if at least one element had already been pushed to the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!>
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
subroutine TRepulsiveList_view(this, pos, item)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Instance
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsiveList), intent(in) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> The view is returned for the specified position. Possible values: from 1 to size(),
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> or from -size() to -1.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer, intent(in) :: pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Pointer to the item at the given position. Do not deallocate it!
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsive), pointer, intent(out) :: item
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: pos_
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (pos < 0) then
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = this%nItem + 1 + pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  else
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
    pos_ = pos
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  end if
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  item => this%items(pos_)%item
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end subroutine TRepulsiveList_view
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Returns the size of the list
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
function TRepulsiveList_size(this) result(nItem)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Instance
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  class(TRepulsiveList), intent(in) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  !> Nr. of elements in the list.
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  integer :: nItem
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  nItem = this%nItem
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end function TRepulsiveList_size
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
!> Finalizer
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
subroutine TRepulsiveList_final(this)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  type(TRepulsiveList), intent(inout) :: this
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
  if (associated(this%items)) deallocate(this%items)
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"
end subroutine TRepulsiveList_final
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/repulsivelist.F90"


end module dftbp_dftb_repulsive_repulsivelist
