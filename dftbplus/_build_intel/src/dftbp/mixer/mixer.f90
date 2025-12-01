!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!


!> Defines an abstract mixer as a base class, specifying the common interface for the
!> desired actual mixer and providing shared methods to flatten 6D and 3D data to 1D.
module dftbp_mixer_mixer
  use dftbp_common_accuracy, only : dp
  implicit none

  private
  public :: TMixerReal, TMixerCmplx

  type, abstract :: TMixerCmplx
    contains
      procedure(IResetCmplx), deferred :: reset

      !> The mixing implementation
      procedure(IMix1DCmplx), deferred :: mix1D

      !> Flatten 6d and 3d mixing to 1d
      procedure :: mix3D => TMixerCmplx_mix3D
      procedure :: mix6D => TMixerCmplx_mix6D

      generic :: mix => mix1D, mix3D, mix6D
  end type TMixerCmplx

  abstract interface

    subroutine IResetCmplx(this, nElem)
      import :: TMixerCmplx
      class(TMixerCmplx), intent(inout) :: this
      integer, intent(in) :: nElem
    end subroutine IResetCmplx

    subroutine IMix1DCmplx(this, qInpResult, qDiff)
      import :: TMixerCmplx, dp
      class(TMixerCmplx), intent(inout) :: this
      complex(dp), intent(inout) :: qInpResult(:)
      complex(dp), intent(in) :: qDiff(:)
    end subroutine IMix1DCmplx

  end interface
  type, abstract :: TMixerReal
    contains
      procedure(IResetReal), deferred :: reset

      !> The mixing implementation
      procedure(IMix1DReal), deferred :: mix1D

      !> Flatten 6d and 3d mixing to 1d
      procedure :: mix3D => TMixerReal_mix3D
      procedure :: mix6D => TMixerReal_mix6D

      generic :: mix => mix1D, mix3D, mix6D
  end type TMixerReal

  abstract interface

    subroutine IResetReal(this, nElem)
      import :: TMixerReal
      class(TMixerReal), intent(inout) :: this
      integer, intent(in) :: nElem
    end subroutine IResetReal

    subroutine IMix1DReal(this, qInpResult, qDiff)
      import :: TMixerReal, dp
      class(TMixerReal), intent(inout) :: this
      real(dp), intent(inout) :: qInpResult(:)
      real(dp), intent(in) :: qDiff(:)
    end subroutine IMix1DReal

  end interface

contains

  !> Mixes two 3D matrices.
  subroutine TMixerCmplx_mix3D(this, qInpResSqr, qDiffSqr)

    !> Mixer instance
    class(TMixerCmplx), intent(inout) :: this

    !> Input vector on entry, result vector on exit
    complex(dp), intent(inout), contiguous, target :: qInpResSqr(:,:,:)

    !> Difference between input and output vectors (measure of lack of convergence)
    complex(dp), intent(in), contiguous, target :: qDiffSqr(:,:,:)

    !! Difference between input and output vectors (1D pointer)
    complex(dp), pointer :: qDiff(:)

    !! Input vector on entry, result vector on exit (1D pointer)
    complex(dp), pointer :: qInpRes(:)

    qDiff(1:size(qDiffSqr)) => qDiffSqr
    qInpRes(1:size(qInpResSqr)) => qInpResSqr

    call this%mix1D(qInpRes, qDiff)

  end subroutine TMixerCmplx_mix3D


  !> Mixes two 6D matrices.
  subroutine TMixerCmplx_mix6D(this, qInpResSqr, qDiffSqr)

    !> Mixer instance
    class(TMixerCmplx), intent(inout) :: this

    !> Input vector on entry, result vector on exit
    complex(dp), intent(inout), contiguous, target :: qInpResSqr(:,:,:,:,:,:)

    !> Difference between input and output vectors (measure of lack of convergence)
    complex(dp), intent(in), contiguous, target :: qDiffSqr(:,:,:,:,:,:)

    !!Difference between input and output vectors (1D pointer)
    complex(dp), pointer :: qDiff(:)

    !! Input vector on entry, result vector on exit (1D pointer)
    complex(dp), pointer :: qInpRes(:)

    qDiff(1:size(qDiffSqr)) => qDiffSqr
    qInpRes(1:size(qInpResSqr)) => qInpResSqr

    call this%mix1D(qInpRes, qDiff)

  end subroutine TMixerCmplx_mix6D
  !> Mixes two 3D matrices.
  subroutine TMixerReal_mix3D(this, qInpResSqr, qDiffSqr)

    !> Mixer instance
    class(TMixerReal), intent(inout) :: this

    !> Input vector on entry, result vector on exit
    real(dp), intent(inout), contiguous, target :: qInpResSqr(:,:,:)

    !> Difference between input and output vectors (measure of lack of convergence)
    real(dp), intent(in), contiguous, target :: qDiffSqr(:,:,:)

    !! Difference between input and output vectors (1D pointer)
    real(dp), pointer :: qDiff(:)

    !! Input vector on entry, result vector on exit (1D pointer)
    real(dp), pointer :: qInpRes(:)

    qDiff(1:size(qDiffSqr)) => qDiffSqr
    qInpRes(1:size(qInpResSqr)) => qInpResSqr

    call this%mix1D(qInpRes, qDiff)

  end subroutine TMixerReal_mix3D


  !> Mixes two 6D matrices.
  subroutine TMixerReal_mix6D(this, qInpResSqr, qDiffSqr)

    !> Mixer instance
    class(TMixerReal), intent(inout) :: this

    !> Input vector on entry, result vector on exit
    real(dp), intent(inout), contiguous, target :: qInpResSqr(:,:,:,:,:,:)

    !> Difference between input and output vectors (measure of lack of convergence)
    real(dp), intent(in), contiguous, target :: qDiffSqr(:,:,:,:,:,:)

    !!Difference between input and output vectors (1D pointer)
    real(dp), pointer :: qDiff(:)

    !! Input vector on entry, result vector on exit (1D pointer)
    real(dp), pointer :: qInpRes(:)

    qDiff(1:size(qDiffSqr)) => qDiffSqr
    qInpRes(1:size(qInpResSqr)) => qInpResSqr

    call this%mix1D(qInpRes, qDiff)

  end subroutine TMixerReal_mix6D


end module dftbp_mixer_mixer
