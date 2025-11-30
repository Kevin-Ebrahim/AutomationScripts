# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90" 2

# 12 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

!> Implements various routines to append elements to an array by copying and reallocation.
module dftbp_common_matrixappend
  use dftbp_common_accuracy, only : dp
  implicit none

  private
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  public :: appendToArray1d_logical
  public :: appendToArray2d_logical

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  public :: appendToArray1d_int
  public :: appendToArray2d_int

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  public :: appendToArray1d_real
  public :: appendToArray2d_real

# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  public :: appendToArray1d_cmplx
  public :: appendToArray2d_cmplx

# 25 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

contains

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  !> Appends data to one-dimensional, logical-valued array.
  subroutine appendToArray1d_logical(array, data)

    !> Array to extend
    logical, intent(inout), allocatable :: array(:)

    !> Data to add
    logical, intent(in) :: data

    ! Temporary storage
    logical, allocatable :: tmp(:)

    ! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then
      nElem = size(array)
      allocate(tmp(nElem + 1))
      tmp(1:nElem) = array
      tmp(nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(1))
      array(1) = data
    end if

  end subroutine appendToArray1d_logical


  !> Appends data to two-dimensional, logical-valued array.
  subroutine appendToArray2d_logical(array, data)

    !> Array to extend
    logical, intent(inout), allocatable :: array(:,:)

    !> Data to add
    logical, intent(in) :: data(:)

    !! Temporary storage
    logical, allocatable :: tmp(:,:)

    !! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then

      nElem = size(array, dim=2)
      allocate(tmp(size(array, dim=1), nElem + 1))
      tmp(:, :nElem) = array
      tmp(:, nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(size(data, dim=1), 1))
      array(:, 1) = data
    end if

  end subroutine appendToArray2d_logical

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  !> Appends data to one-dimensional, integer-valued array.
  subroutine appendToArray1d_int(array, data)

    !> Array to extend
    integer, intent(inout), allocatable :: array(:)

    !> Data to add
    integer, intent(in) :: data

    ! Temporary storage
    integer, allocatable :: tmp(:)

    ! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then
      nElem = size(array)
      allocate(tmp(nElem + 1))
      tmp(1:nElem) = array
      tmp(nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(1))
      array(1) = data
    end if

  end subroutine appendToArray1d_int


  !> Appends data to two-dimensional, integer-valued array.
  subroutine appendToArray2d_int(array, data)

    !> Array to extend
    integer, intent(inout), allocatable :: array(:,:)

    !> Data to add
    integer, intent(in) :: data(:)

    !! Temporary storage
    integer, allocatable :: tmp(:,:)

    !! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then

      nElem = size(array, dim=2)
      allocate(tmp(size(array, dim=1), nElem + 1))
      tmp(:, :nElem) = array
      tmp(:, nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(size(data, dim=1), 1))
      array(:, 1) = data
    end if

  end subroutine appendToArray2d_int

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  !> Appends data to one-dimensional, real-valued array.
  subroutine appendToArray1d_real(array, data)

    !> Array to extend
    real(dp), intent(inout), allocatable :: array(:)

    !> Data to add
    real(dp), intent(in) :: data

    ! Temporary storage
    real(dp), allocatable :: tmp(:)

    ! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then
      nElem = size(array)
      allocate(tmp(nElem + 1))
      tmp(1:nElem) = array
      tmp(nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(1))
      array(1) = data
    end if

  end subroutine appendToArray1d_real


  !> Appends data to two-dimensional, real-valued array.
  subroutine appendToArray2d_real(array, data)

    !> Array to extend
    real(dp), intent(inout), allocatable :: array(:,:)

    !> Data to add
    real(dp), intent(in) :: data(:)

    !! Temporary storage
    real(dp), allocatable :: tmp(:,:)

    !! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then

      nElem = size(array, dim=2)
      allocate(tmp(size(array, dim=1), nElem + 1))
      tmp(:, :nElem) = array
      tmp(:, nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(size(data, dim=1), 1))
      array(:, 1) = data
    end if

  end subroutine appendToArray2d_real

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

  !> Appends data to one-dimensional, complex-valued array.
  subroutine appendToArray1d_cmplx(array, data)

    !> Array to extend
    complex(dp), intent(inout), allocatable :: array(:)

    !> Data to add
    complex(dp), intent(in) :: data

    ! Temporary storage
    complex(dp), allocatable :: tmp(:)

    ! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then
      nElem = size(array)
      allocate(tmp(nElem + 1))
      tmp(1:nElem) = array
      tmp(nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(1))
      array(1) = data
    end if

  end subroutine appendToArray1d_cmplx


  !> Appends data to two-dimensional, complex-valued array.
  subroutine appendToArray2d_cmplx(array, data)

    !> Array to extend
    complex(dp), intent(inout), allocatable :: array(:,:)

    !> Data to add
    complex(dp), intent(in) :: data(:)

    !! Temporary storage
    complex(dp), allocatable :: tmp(:,:)

    !! Original number of entries in array
    integer :: nElem

    if (allocated(array)) then

      nElem = size(array, dim=2)
      allocate(tmp(size(array, dim=1), nElem + 1))
      tmp(:, :nElem) = array
      tmp(:, nElem + 1) = data
      deallocate(array)
      call move_alloc(tmp, array)
    else
      allocate(array(size(data, dim=1), 1))
      array(:, 1) = data
    end if

  end subroutine appendToArray2d_cmplx

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/matrixappend.F90"

end module dftbp_common_matrixappend
