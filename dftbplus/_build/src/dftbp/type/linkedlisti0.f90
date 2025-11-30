# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlist.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90" 2

!> Linked list for single integers
module dftbp_type_linkedlisti0
  implicit none

  private


# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  public :: TListInt
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  public :: init, destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  public :: append, len, find, hasElement, isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  public :: get, set, asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  type :: TNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end type TNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  type :: TListInt
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    private
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: length
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    logical :: tUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pLast
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: iCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    logical :: tInitialized = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end type TListInt
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  interface asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    module procedure TListInt_asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end interface asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
contains
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Initializes the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list The list to initialize.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_init(list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%length = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%tUnishaped = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    nullify(list%pFirst)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    nullify(list%pLast)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%iCache = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    nullify(list%pCache)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%tInitialized = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_init
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Destructs the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list The list to destruct.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_destruct(list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCur, pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (.not. list%tInitialized) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      return
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      pNext => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      deallocate(pCur)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      pCur => pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%tInitialized = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_destruct
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Appends an element to the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list  The list to extend.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param data The data to add.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_append(list, data)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    !! List contains already elements -> append to the end otherwise as first
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (associated(list%pLast)) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      allocate(list%pLast%pNext)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      list%pLast => list%pLast%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      allocate(list%pFirst)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      list%pLast => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%length = list%length + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    !! initialize node
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    nullify(list%pLast%pNext)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    ! WORKAROUND: GFortran 7.1 crashes on automatic allocation
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    !list%pLast%data = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%pLast%data = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_append
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Returns the length(nr. of elements) of the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list The list to get the length of.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @return     Nr. of elements in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  integer function TListInt_len(list) result(len)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    len = list%length
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end function TListInt_len
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Returns the index of an element in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param data The data to look for.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @return      Index of the element or zero if not found
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  function TListInt_find(list, data) result(ind)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: ind
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    ii = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      if (pCur%data == data) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
        exit
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      pCur => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      ii = ii + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (associated(pCur)) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      ind = ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      list%iCache = ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      list%pCache => pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      ind = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    endif
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end function TListInt_find
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Check if given element is in the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list   The list object
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param data  Element to look for
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @return       True if element had been found, false otherwise
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  logical function TListInt_hasElement(list, data) result(hasElement)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (find(list, data) == 0) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      hasElement = .false.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      hasElement = .true.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end function TListInt_hasElement
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Fills a variable with the speciefied element of the list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param data The variable to put the element in.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_get(list, data, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(out) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    data = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_get
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Fills a speciefied element of the list with a variable
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param data The variable to put the element in.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param index Index of the element (0 < index < length of the list)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_set(list, data, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur => getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur%data = data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_set
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Checks if list contains members with equal shaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @return     True, if elements have equals shaped, False otherwise.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  logical function TListInt_isUnishaped(list) result(isUnishaped)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    isUnishaped = list%tUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end function TListInt_isUnishaped
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Returns the list as an array of elements.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list The list to get the elements from.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param val  Array which will be filled with the elements of the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @note
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*   The passed array has to have the rank of the list elements + 1.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*   According to Fortran traditions, the last index of the array addresses
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*   the list elements, the indexes before address the elements inside
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*   the list elements.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @note Only unishaped lists can be converted to array!
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @assert Array has the shape(:, :, :, ..., :, <length of the list>)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*         and the dimensions before the last one are compatible with the
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!*         shape of the elements in the list.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  subroutine TListInt_asArray(list, val)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(in) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, dimension(:), intent(out) :: val
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: pCur
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: lenVal
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: ii
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    lenVal = size(val, dim=size(shape(val)))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    pCur => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    ii = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    do while(associated(pCur))
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      val(ii) = pCur%data
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      ii = ii + 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      pCur => pCur%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (ii <= lenVal) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      val(ii:lenVal) = 0
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  end subroutine TListInt_asArray
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* Returns a pointer to a node with a given index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param list  The list object.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param pNode Pointer to set to the wanted node.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  !!* @param index Index of the wanted node.
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
  function getNode(list, index)
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TNode), pointer :: getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    type(TListInt), intent(inout) :: list
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer, intent(in) :: index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    integer :: ii, iStart
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (list%iCache == index) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      getNode => list%pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      return
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    if (list%iCache > 0 .and. list%iCache < index) then
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      iStart = list%iCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      getNode => list%pCache
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    else
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      iStart = 1
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      getNode => list%pFirst
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end if
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    do ii = iStart + 1, index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
      getNode => getNode%pNext
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    end do
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%pCache => getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
    list%iCache = index
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"
   end function getNode
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/linkedlisti0.F90"

end module dftbp_type_linkedlisti0
