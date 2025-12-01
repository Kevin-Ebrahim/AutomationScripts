!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!


!> Implements various wrapped data types for use in creating ragged multi-dimensional arrays.
module dftbp_type_wrappedintr
  use dftbp_common_accuracy, only : dp
  implicit none

  private

  public :: TWrappedLogical1


  public :: TWrappedLogical2


  public :: TWrappedInt1


  public :: TWrappedInt2


  public :: TWrappedReal1


  public :: TWrappedReal2


  public :: TWrappedCmplx1


  public :: TWrappedCmplx2



  !> 1 dimensional logical
  type :: TWrappedLogical1
    logical, allocatable :: data(:)
  end type TWrappedLogical1


  !> 2 dimensional logical
  type :: TWrappedLogical2
    logical, allocatable :: data(:,:)
  end type TWrappedLogical2


  !> 1 dimensional integer
  type :: TWrappedInt1
    integer, allocatable :: data(:)
  end type TWrappedInt1


  !> 2 dimensional integer
  type :: TWrappedInt2
    integer, allocatable :: data(:,:)
  end type TWrappedInt2


  !> 1 dimensional real
  type :: TWrappedReal1
    real(dp), allocatable :: data(:)
  end type TWrappedReal1


  !> 2 dimensional real
  type :: TWrappedReal2
    real(dp), allocatable :: data(:,:)
  end type TWrappedReal2


  !> 1 dimensional complex
  type :: TWrappedCmplx1
    complex(dp), allocatable :: data(:)
  end type TWrappedCmplx1


  !> 2 dimensional complex
  type :: TWrappedCmplx2
    complex(dp), allocatable :: data(:,:)
  end type TWrappedCmplx2


end module dftbp_type_wrappedintr
