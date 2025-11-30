# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/magma.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/magma.F90" 2

!> MAGMA GPU interface library
module dftbp_extlibs_magma
  use, intrinsic :: iso_c_binding, only : c_int
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/magma.F90"
  implicit none

  private
  public :: withGpu
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/magma.F90"

  !> Whether code was built with GPU support
  logical, parameter :: withGpu = .false.

# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/magma.F90"

end module dftbp_extlibs_magma
