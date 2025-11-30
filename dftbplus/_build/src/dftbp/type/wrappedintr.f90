# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

!> Implements various wrapped data types for use in creating ragged multi-dimensional arrays.
module dftbp_type_wrappedintr
  use dftbp_common_accuracy, only : dp
  implicit none

  private
# 18 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedLogical1

# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedLogical2

# 23 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 18 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedInt1

# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedInt2

# 23 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 18 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedReal1

# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedReal2

# 23 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 18 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedCmplx1

# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  public :: TWrappedCmplx2

# 23 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 1 dimensional logical
  type :: TWrappedLogical1
    logical, allocatable :: data(:)
  end type TWrappedLogical1

# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 2 dimensional logical
  type :: TWrappedLogical2
    logical, allocatable :: data(:,:)
  end type TWrappedLogical2

# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 1 dimensional integer
  type :: TWrappedInt1
    integer, allocatable :: data(:)
  end type TWrappedInt1

# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 2 dimensional integer
  type :: TWrappedInt2
    integer, allocatable :: data(:,:)
  end type TWrappedInt2

# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 1 dimensional real
  type :: TWrappedReal1
    real(dp), allocatable :: data(:)
  end type TWrappedReal1

# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 2 dimensional real
  type :: TWrappedReal2
    real(dp), allocatable :: data(:,:)
  end type TWrappedReal2

# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 1 dimensional complex
  type :: TWrappedCmplx1
    complex(dp), allocatable :: data(:)
  end type TWrappedCmplx1

# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

  !> 2 dimensional complex
  type :: TWrappedCmplx2
    complex(dp), allocatable :: data(:,:)
  end type TWrappedCmplx2

# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/wrappedintr.F90"

end module dftbp_type_wrappedintr
