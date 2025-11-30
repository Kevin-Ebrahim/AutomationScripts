# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90" 2
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90"
module dftbp_mixer_factory
  use dftbp_io_message, only : error
  use dftbp_mixer_andersonmixer, only : TAndersonMixerCmplx, TAndersonMixerCmplx_init,&
      & TAndersonMixerInp, TAndersonMixerReal, TAndersonMixerReal_init
  use dftbp_mixer_broydenmixer, only : TBroydenMixerCmplx, TBroydenMixerCmplx_init,&
      & TBroydenMixerInp, TBroydenMixerReal, TBroydenMixerReal_init
  use dftbp_mixer_diismixer, only : TDiisMixerCmplx, TDiisMixerCmplx_init, TDiisMixerInp,&
      & TDiisMixerReal, TDiisMixerReal_init
  use dftbp_mixer_mixer, only : TMixerCmplx, TMixerReal
  use dftbp_mixer_simplemixer, only : TSimpleMixerCmplx, TSimpleMixerCmplx_init, TSimpleMixerInp,&
      & TSimpleMixerReal, TSimpleMixerReal_init

  implicit none
  private
  public :: TMixerInput, TMixerFactoryReal, TMixerFactoryCmplx


  type :: TMixerInput
    type(TAndersonMixerInp), allocatable :: andersonMixerInp
    type(TBroydenMixerInp), allocatable :: broydenMixerInp
    type(TDiisMixerInp), allocatable :: diisMixerInp
    type(TSimpleMixerInp), allocatable :: simpleMixerInp
  end type TMixerInput


contains

# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90"
  subroutine TMixerFactoryReal(chrgMixerReal, mixerInp)
    !> The resulting allocated and initialised mixer
    class(TMixerReal), allocatable, intent(out) :: chrgMixerReal

    !> Mixer Input data structure, containing one of the specific mixer inputs
    type(TMixerInput), intent(in) :: mixerInp

    type(TAndersonMixerReal), allocatable :: andersonMixerReal
    type(TBroydenMixerReal), allocatable :: broydenMixerReal
    type(TDiisMixerReal), allocatable :: diisMixerReal
    type(TSimpleMixerReal), allocatable :: simpleMixerReal

    if (allocated(mixerInp%andersonMixerInp)) then
      allocate(andersonMixerReal)
      call TAndersonMixerReal_init(andersonMixerReal, mixerInp%andersonMixerInp)
      call move_alloc(andersonMixerReal, chrgMixerReal)
    else if (allocated(mixerInp%broydenMixerInp)) then
      allocate(broydenMixerReal)
      call TBroydenMixerReal_init(broydenMixerReal, mixerInp%broydenMixerInp)
      call move_alloc(broydenMixerReal, chrgMixerReal)
    else if (allocated(mixerInp%diisMixerInp)) then
      allocate(diisMixerReal)
      call TDiisMixerReal_init(diisMixerReal, mixerInp%diisMixerInp)
      call move_alloc(diisMixerReal, chrgMixerReal)
    else if (allocated(mixerInp%simpleMixerInp)) then
      allocate(simpleMixerReal)
      call TSimpleMixerReal_init(simpleMixerReal, mixerInp%simpleMixerInp)
      call move_alloc(simpleMixerReal, chrgMixerReal)
    else
      call error("TMixerFactoryReal : No mixer input provided")
    end if
  end subroutine TMixerFactoryReal
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90"
  subroutine TMixerFactoryCmplx(chrgMixerCmplx, mixerInp)
    !> The resulting allocated and initialised mixer
    class(TMixerCmplx), allocatable, intent(out) :: chrgMixerCmplx

    !> Mixer Input data structure, containing one of the specific mixer inputs
    type(TMixerInput), intent(in) :: mixerInp

    type(TAndersonMixerCmplx), allocatable :: andersonMixerCmplx
    type(TBroydenMixerCmplx), allocatable :: broydenMixerCmplx
    type(TDiisMixerCmplx), allocatable :: diisMixerCmplx
    type(TSimpleMixerCmplx), allocatable :: simpleMixerCmplx

    if (allocated(mixerInp%andersonMixerInp)) then
      allocate(andersonMixerCmplx)
      call TAndersonMixerCmplx_init(andersonMixerCmplx, mixerInp%andersonMixerInp)
      call move_alloc(andersonMixerCmplx, chrgMixerCmplx)
    else if (allocated(mixerInp%broydenMixerInp)) then
      allocate(broydenMixerCmplx)
      call TBroydenMixerCmplx_init(broydenMixerCmplx, mixerInp%broydenMixerInp)
      call move_alloc(broydenMixerCmplx, chrgMixerCmplx)
    else if (allocated(mixerInp%diisMixerInp)) then
      allocate(diisMixerCmplx)
      call TDiisMixerCmplx_init(diisMixerCmplx, mixerInp%diisMixerInp)
      call move_alloc(diisMixerCmplx, chrgMixerCmplx)
    else if (allocated(mixerInp%simpleMixerInp)) then
      allocate(simpleMixerCmplx)
      call TSimpleMixerCmplx_init(simpleMixerCmplx, mixerInp%simpleMixerInp)
      call move_alloc(simpleMixerCmplx, chrgMixerCmplx)
    else
      call error("TMixerFactoryCmplx : No mixer input provided")
    end if
  end subroutine TMixerFactoryCmplx
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/factory.F90"

end module dftbp_mixer_factory
