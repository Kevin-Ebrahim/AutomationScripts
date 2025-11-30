# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90" 2

!> Exports the entities used from the ChIMES calculator library
module dftbp_extlibs_chimes
# 15 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"
  implicit none

  private
  public :: withChimes
  public :: TChimesCalc, TChimesCalc_init


  !> Whether the code was built with ChIMES support
  logical, parameter :: withChimes = .false.


# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"

  !> Dummy placeholder type
  type :: TChimesCalc
  end type TChimesCalc

# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"

contains

# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"

  subroutine TChimesCalc_init()
  end subroutine TChimesCalc_init

# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/chimes.F90"

end module dftbp_extlibs_chimes
