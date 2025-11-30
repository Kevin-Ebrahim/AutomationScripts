# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90" 2

!> Linked list for real vectors
module dftbp_type_linkedlistr1
  use dftbp_common_accuracy, only : dp
  implicit none

  private


# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: TListRealR1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: init, destruct
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: append, len, find, hasElement, isUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: get, set, asArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: elemShape, intoArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  public :: asVector
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  type :: TNode
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), allocatable :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end type TNode
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  type :: TListRealR1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    private
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: length
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: elemShape(1)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    logical :: tUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pLast
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: iCache
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCache
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    logical :: tInitialized = .false.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end type TListRealR1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface init
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_init
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface init
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface destruct
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_destruct
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface destruct
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface append
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_append
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface append
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface len
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_len
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface len
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface find
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_find
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface find
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface hasElement
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_hasElement
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface hasElement
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface isUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_isUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface isUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface get
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_get
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface get
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface set
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_set
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface set
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface asArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_asArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface asArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface intoArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_intoArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface intoArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface elemShape
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_elemShape
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface elemShape
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  interface asVector
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    module procedure TListRealR1_asVector
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end interface asVector
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
contains
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Initializes the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list to initialize.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_init(list)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%length = 0
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%elemShape(:) = 0
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%tUnishaped = .true.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    nullify(list%pFirst)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    nullify(list%pLast)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%iCache = 0
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    nullify(list%pCache)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%tInitialized = .true.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_init
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Destructs the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list to destruct.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_destruct(list)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur, pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (.not. list%tInitialized) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      return
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    do while(associated(pCur))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pNext => pCur%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      deallocate(pCur)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pCur => pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end do
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%tInitialized = .false.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_destruct
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Appends an element to the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list to extend.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data The data to add.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_append(list, data)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(in) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    !! List contains already elements -> append to the end otherwise as first
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (associated(list%pLast)) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      allocate(list%pLast%pNext)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      list%pLast => list%pLast%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      if (list%tUnishaped .and. (.not. all(shape(data) == list%elemShape))) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
        list%tUnishaped = .false.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    else
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      allocate(list%pFirst)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      list%pLast => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      list%elemShape(:) = shape(data)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%length = list%length + 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    !! initialize node
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    nullify(list%pLast%pNext)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    ! WORKAROUND: GFortran 7.1 crashes on automatic allocation
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    !list%pLast%data = data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    ! WORKAROUND: GFortran 5.3 can not cope with source allocation
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    !allocate(list%pLast%data, source=data)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    allocate(list%pLast%data(size(data, dim=1)))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%pLast%data(:) = data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_append
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Returns the length(nr. of elements) of the list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list to get the length of.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @return     Nr. of elements in the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  integer function TListRealR1_len(list) result(len)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(in) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    len = list%length
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end function TListRealR1_len
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Returns the index of an element in the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data The data to look for.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @return      Index of the element or zero if not found
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  function TListRealR1_find(list, data) result(ind)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: ind
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(in) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: ii
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    ii = 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    do while(associated(pCur))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      if (all(shape(pCur%data) == shape(data))) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
        if (all(pCur%data == data)) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
          exit
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
        end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pCur => pCur%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      ii = ii + 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end do
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (associated(pCur)) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      ind = ii
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      list%iCache = ii
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      list%pCache => pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    else
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      ind = 0
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    endif
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end function TListRealR1_find
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Check if given element is in the list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list   The list object
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data  Element to look for
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @return       True if element had been found, false otherwise
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  logical function TListRealR1_hasElement(list, data) result(hasElement)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(in) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (find(list, data) == 0) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      hasElement = .false.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    else
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      hasElement = .true.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end function TListRealR1_hasElement
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Fills a variable with the speciefied element of the list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data The variable to put the element in.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_get(list, data, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), allocatable, intent(out) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(in) :: index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => getNode(list, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    data = pCur%data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_get
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Fills a speciefied element of the list with a variable
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data The variable to put the element in.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_set(list, data, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(in) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(in) :: index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => getNode(list, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur%data = data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_set
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Checks if list contains members with equal shaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @return     True, if elements have equals shaped, False otherwise.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  logical function TListRealR1_isUnishaped(list) result(isUnishaped)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(in) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    isUnishaped = list%tUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end function TListRealR1_isUnishaped
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Returns the list as an array of elements.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list to get the elements from.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param val  Array which will be filled with the elements of the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @note
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   The passed array has to have the rank of the list elements + 1.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   According to Fortran traditions, the last index of the array addresses
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   the list elements, the indexes before address the elements inside
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   the list elements.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @note Only unishaped lists can be converted to array!
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @assert Array has the shape(:, :, :, ..., :, <length of the list>)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*         and the dimensions before the last one are compatible with the
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*         shape of the elements in the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_asArray(list, val)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(in) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:,:), intent(out) :: val
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: lenVal
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: ii
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    lenVal = size(val, dim=size(shape(val)))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    ii = 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    do while(associated(pCur))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      val(:, ii) = pCur%data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      ii = ii + 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pCur => pCur%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end do
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (ii <= lenVal) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      val(:, ii:lenVal) = 0.0_dp
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_asArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Get the shape of the elements in the list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list     The list object
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param valshape contains the shape at return
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_elemShape(list, valshape, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(out) :: valshape(:)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(in) :: index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (list%tUnishaped) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      valshape(:) = list%elemShape
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    else
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pCur => getNode(list, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      valshape(:) = shape(pCur%data)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_elemShape
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Fills a variable with the speciefied element of the list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param data The variable to put the element in.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param nElem number of elements returned in data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_intoArray(list, data, nElem, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(inout) :: data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(out) :: nElem
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(in) :: index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => getNode(list, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    nElem = size(pCur%data, dim=1)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    data(:nElem) = pCur%data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_intoArray
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Returns the list as a vector (rank 1 array).
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list The list to get the elements from.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param val  Array which will be filled with the elements of the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @note
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   The passed array has to have the rank of the list elements + 1.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   According to Fortran traditions, the last index of the array addresses
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   the list elements, the indexes before address the elements inside
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*   the list elements.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @note Only unishaped lists can be converted to array!
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @assert Array has the shape(:, :, :, ..., :, <length of the list>)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*         and the dimensions before the last one are compatible with the
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!*         shape of the elements in the list.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  subroutine TListRealR1_asVector(list, val)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(in) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    real(dp), dimension(:), intent(out) :: val
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: pCur
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: lenVal, lenElem
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: ii
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    lenVal = size(val)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    lenElem = product(list%elemShape)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    pCur => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    ii = 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    do while(associated(pCur))
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      val(ii : ii + lenElem - 1) = pCur%data
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      ii = ii + lenElem
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      pCur => pCur%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end do
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (ii <= lenVal) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      val(ii:) = 0.0_dp
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  end subroutine TListRealR1_asVector
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* Returns a pointer to a node with a given index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param list  The list object.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param pNode Pointer to set to the wanted node.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  !!* @param index Index of the wanted node.
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
  function getNode(list, index)
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TNode), pointer :: getNode
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    type(TListRealR1), intent(inout) :: list
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer, intent(in) :: index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    integer :: ii, iStart
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (list%iCache == index) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      getNode => list%pCache
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      return
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    if (list%iCache > 0 .and. list%iCache < index) then
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      iStart = list%iCache
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      getNode => list%pCache
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    else
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      iStart = 1
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      getNode => list%pFirst
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end if
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    do ii = iStart + 1, index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
      getNode => getNode%pNext
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    end do
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%pCache => getNode
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
    list%iCache = index
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"
   end function getNode
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

# 22 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlistr1.F90"

end module dftbp_type_linkedlistr1
