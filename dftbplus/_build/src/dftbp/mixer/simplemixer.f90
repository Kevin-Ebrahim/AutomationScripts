# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90" 2
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"

!> Simple mixer for mixing charges
module dftbp_mixer_simplemixer
  use dftbp_common_accuracy, only : dp
  use dftbp_mixer_mixer, only : TMixerCmplx, TMixerReal
  implicit none


  private
  public :: TSimpleMixerInp
  public :: TSimpleMixerReal, TSimpleMixerReal_init
  public :: TSimpleMixerCmplx, TSimpleMixerCmplx_init

  type :: TSimpleMixerInp
    !> Mixing parameter
    real(dp) :: mixParam = 0.0_dp
  end type TSimpleMixerInp

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"
  !> Contains data for a simple mixer
  type, extends (TMixerCmplx) :: TSimpleMixerCmplx
    private
    !> Mixing parameter
    real(dp) :: mixParam

  contains
    procedure :: reset => TSimpleMixerCmplx_reset
    procedure :: mix1D => TSimpleMixerCmplx_mix
  end type TSimpleMixerCmplx
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"
  !> Contains data for a simple mixer
  type, extends (TMixerReal) :: TSimpleMixerReal
    private
    !> Mixing parameter
    real(dp) :: mixParam

  contains
    procedure :: reset => TSimpleMixerReal_reset
    procedure :: mix1D => TSimpleMixerReal_mix
  end type TSimpleMixerReal
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"


contains

# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"

  !> Initializes a simple mixer.
  subroutine TSimpleMixerCmplx_init(this, mixerInp)

    !> Simple mixer instance on exit
    type(TSimpleMixerCmplx), intent(out) :: this

    !> TSimpleMixerInp input data struct
    type(TSimpleMixerInp), intent(in) :: mixerInp

    this%mixParam = mixerInp%mixParam

  end subroutine TSimpleMixerCmplx_init


  !> Resets the mixer.
  subroutine TSimpleMixerCmplx_reset(this, nElem)

    !> Simple mixer instance
    class(TSimpleMixerCmplx), intent(inout) :: this

    !> Length of the vectors to mix
    integer, intent(in) :: nElem



    continue

  end subroutine TSimpleMixerCmplx_reset


  !> Does the actual mixing.
  subroutine TSimpleMixerCmplx_mix(this, qInpResult, qDiff)

    !> SimpleMixer instance
    class(TSimpleMixerCmplx), intent(inout) :: this

    !> Input charge on entry, mixed charge on exit
    complex(dp), intent(inout) :: qInpResult(:)

    !> Charge difference
    complex(dp), intent(in) :: qDiff(:)



    qInpResult(:) = qInpResult + this%mixParam * qDiff

  end subroutine TSimpleMixerCmplx_mix
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"

  !> Initializes a simple mixer.
  subroutine TSimpleMixerReal_init(this, mixerInp)

    !> Simple mixer instance on exit
    type(TSimpleMixerReal), intent(out) :: this

    !> TSimpleMixerInp input data struct
    type(TSimpleMixerInp), intent(in) :: mixerInp

    this%mixParam = mixerInp%mixParam

  end subroutine TSimpleMixerReal_init


  !> Resets the mixer.
  subroutine TSimpleMixerReal_reset(this, nElem)

    !> Simple mixer instance
    class(TSimpleMixerReal), intent(inout) :: this

    !> Length of the vectors to mix
    integer, intent(in) :: nElem



    continue

  end subroutine TSimpleMixerReal_reset


  !> Does the actual mixing.
  subroutine TSimpleMixerReal_mix(this, qInpResult, qDiff)

    !> SimpleMixer instance
    class(TSimpleMixerReal), intent(inout) :: this

    !> Input charge on entry, mixed charge on exit
    real(dp), intent(inout) :: qInpResult(:)

    !> Charge difference
    real(dp), intent(in) :: qDiff(:)



    qInpResult(:) = qInpResult + this%mixParam * qDiff

  end subroutine TSimpleMixerReal_mix
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/simplemixer.F90"

end module dftbp_mixer_simplemixer
