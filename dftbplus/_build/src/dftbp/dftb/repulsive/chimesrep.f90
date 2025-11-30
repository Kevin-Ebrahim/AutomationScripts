# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90" 2

!> Implements a repulsive correction using the ChIMES force field
module dftbp_dftb_repulsive_chimesrep
  use dftbp_common_accuracy, only : dp
  use dftbp_common_constants, only : AA__Bohr, Bohr__AA, kcal_mol__Hartree
  use dftbp_dftb_periodic, only : TNeighbourList
  use dftbp_dftb_repulsive_repulsive, only : TRepulsive
  use dftbp_extlibs_chimes, only : TChimesCalc, TChimesCalc_init
  implicit none

  private
  public :: TChimesRepInp, TChimesRep, TChimesRep_init


# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90"

  type :: TChimesRepInp
  end type TChimesRepInp

  type :: TChimesRep
  end type TChimesRep

# 74 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90"


contains

# 283 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90"

  !> Dummy initializer in case code was compiled without ChIMES
  subroutine TChimesRep_init()
  end subroutine TChimesRep_init

# 289 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/repulsive/chimesrep.F90"


end module dftbp_dftb_repulsive_chimesrep
