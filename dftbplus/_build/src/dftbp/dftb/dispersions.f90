# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dispersions.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dispersions.F90" 2

!> Offers everything which is publicly available when dealing with dispersions.
!!
module dftbp_dftb_dispersions
  use dftbp_dftb_dispdftd4, only : init, TDispDftD4, TDispDftD4Inp
  use dftbp_dftb_dispiface, only : TDispersionIface
  use dftbp_dftb_dispslaterkirkw, only : dispslakirk_init, TDispSlaKirk, TDispSlaKirkInp
  use dftbp_dftb_dispuff, only : dispuff_init, TDispUFF, TDispUffInp
  use dftbp_dftb_dispuffdata, only : getuffvalues
  use dftbp_dftb_simpledftd3, only : init, TSimpleDftD3, TSimpleDftD3Input
# 22 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dispersions.F90"
  use dftbp_extlibs_sdftd3, only : TSDFTD3Input
  implicit none

  public

  !> Types of dispersion model
  type :: TDispersionInp

    !> Based on universal force-field
    type(TDispUffInp), allocatable :: uff

    !> Slater-Kirkwood
    type(TDispSlaKirkInp), allocatable :: slakirk

    !> D3 dispersion model
    type(TSDFTD3Input), allocatable :: dftd3

    !> Simple D3 dispersion model.
    type(TSimpleDftD3Input), allocatable :: sdftd3

    !> D4 dispersion model.
    type(TDispDftD4Inp), allocatable :: dftd4

# 49 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dispersions.F90"

  end type TDispersionInp

end module dftbp_dftb_dispersions
