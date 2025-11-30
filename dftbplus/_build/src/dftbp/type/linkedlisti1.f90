# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90" 2

!> Linked list for single real vectors
module dftbp_type_linkedlisti1
  implicit none

  private


# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: TListIntR1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: init, destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: append, len, find, hasElement, isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: get, set, asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: elemShape, intoArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  public :: asVector
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  type :: TNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), allocatable :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end type TNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  type :: TListIntR1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    private
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: length
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: elemShape(1)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    logical :: tUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pLast
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: iCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    logical :: tInitialized = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end type TListIntR1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface intoArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_intoArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface intoArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface elemShape
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_elemShape
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface elemShape
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  interface asVector
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    module procedure TListIntR1_asVector
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end interface asVector
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
contains
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Initializes the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list to initialize.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_init(list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%length = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%elemShape(:) = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%tUnishaped = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    nullify(list%pFirst)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    nullify(list%pLast)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%iCache = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    nullify(list%pCache)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%tInitialized = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Destructs the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list to destruct.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_destruct(list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur, pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (.not. list%tInitialized) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      return
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pNext => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      deallocate(pCur)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pCur => pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%tInitialized = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Appends an element to the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list to extend.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data The data to add.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_append(list, data)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    !! List contains already elements -> append to the end otherwise as first
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (associated(list%pLast)) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      allocate(list%pLast%pNext)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      list%pLast => list%pLast%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      if (list%tUnishaped .and. (.not. all(shape(data) == list%elemShape))) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
        list%tUnishaped = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      allocate(list%pFirst)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      list%pLast => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      list%elemShape(:) = shape(data)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%length = list%length + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    !! initialize node
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    nullify(list%pLast%pNext)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    ! WORKAROUND: GFortran 7.1 crashes on automatic allocation
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    !list%pLast%data = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    ! WORKAROUND: GFortran 5.3 can not cope with source allocation
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    !allocate(list%pLast%data, source=data)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    allocate(list%pLast%data(size(data, dim=1)))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%pLast%data(:) = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Returns the length(nr. of elements) of the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list to get the length of.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @return     Nr. of elements in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  integer function TListIntR1_len(list) result(len)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    len = list%length
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end function TListIntR1_len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Returns the index of an element in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data The data to look for.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @return      Index of the element or zero if not found
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  function TListIntR1_find(list, data) result(ind)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: ind
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    ii = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      if (all(shape(pCur%data) == shape(data))) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
        if (all(pCur%data == data)) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
          exit
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
        end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pCur => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      ii = ii + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (associated(pCur)) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      ind = ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      list%iCache = ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      list%pCache => pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      ind = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    endif
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end function TListIntR1_find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Check if given element is in the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list   The list object
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data  Element to look for
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @return       True if element had been found, false otherwise
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  logical function TListIntR1_hasElement(list, data) result(hasElement)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (find(list, data) == 0) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      hasElement = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      hasElement = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end function TListIntR1_hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Fills a variable with the speciefied element of the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data The variable to put the element in.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_get(list, data, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), allocatable, intent(out) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    data = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Fills a speciefied element of the list with a variable
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data The variable to put the element in.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_set(list, data, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur%data = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Checks if list contains members with equal shaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @return     True, if elements have equals shaped, False otherwise.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  logical function TListIntR1_isUnishaped(list) result(isUnishaped)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    isUnishaped = list%tUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end function TListIntR1_isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Returns the list as an array of elements.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list to get the elements from.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param val  Array which will be filled with the elements of the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @note
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   The passed array has to have the rank of the list elements + 1.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   According to Fortran traditions, the last index of the array addresses
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   the list elements, the indexes before address the elements inside
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   the list elements.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @note Only unishaped lists can be converted to array!
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @assert Array has the shape(:, :, :, ..., :, <length of the list>)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*         and the dimensions before the last one are compatible with the
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*         shape of the elements in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_asArray(list, val)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:,:), intent(out) :: val
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: lenVal
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    lenVal = size(val, dim=size(shape(val)))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    ii = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      val(:, ii) = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      ii = ii + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pCur => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (ii <= lenVal) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      val(:, ii:lenVal) = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Get the shape of the elements in the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list     The list object
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param valshape contains the shape at return
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_elemShape(list, valshape, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(out) :: valshape(:)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (list%tUnishaped) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      valshape(:) = list%elemShape
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      valshape(:) = shape(pCur%data)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_elemShape
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Fills a variable with the speciefied element of the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param data The variable to put the element in.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param nElem number of elements returned in data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_intoArray(list, data, nElem, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(inout) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(out) :: nElem
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    nElem = size(pCur%data, dim=1)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    data(:nElem) = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_intoArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Returns the list as a vector (rank 1 array).
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list The list to get the elements from.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param val  Array which will be filled with the elements of the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @note
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   The passed array has to have the rank of the list elements + 1.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   According to Fortran traditions, the last index of the array addresses
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   the list elements, the indexes before address the elements inside
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*   the list elements.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @note Only unishaped lists can be converted to array!
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @assert Array has the shape(:, :, :, ..., :, <length of the list>)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*         and the dimensions before the last one are compatible with the
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!*         shape of the elements in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  subroutine TListIntR1_asVector(list, val)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, dimension(:), intent(out) :: val
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: lenVal, lenElem
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    lenVal = size(val)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    lenElem = product(list%elemShape)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    ii = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      val(ii : ii + lenElem - 1) = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      ii = ii + lenElem
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      pCur => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (ii <= lenVal) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      val(ii:) = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  end subroutine TListIntR1_asVector
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* Returns a pointer to a node with a given index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param pNode Pointer to set to the wanted node.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  !!* @param index Index of the wanted node.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
  function getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TNode), pointer :: getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    type(TListIntR1), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    integer :: ii, iStart
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (list%iCache == index) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      getNode => list%pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      return
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    if (list%iCache > 0 .and. list%iCache < index) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      iStart = list%iCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      getNode => list%pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      iStart = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      getNode => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    do ii = iStart + 1, index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
      getNode => getNode%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%pCache => getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
    list%iCache = index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"
   end function getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti1.F90"

end module dftbp_type_linkedlisti1
