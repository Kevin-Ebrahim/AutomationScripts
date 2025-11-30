# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90" 2

# 11 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

!> Interface to libPoisson routines
!>
!> NOTE: THIS MODULE IS NOT MULTI-INSTANCE SAFE
!>
module dftbp_extlibs_poisson
  use dftbp_common_accuracy, only : dp
  use dftbp_common_constants, only : pi
  use dftbp_common_environment, only : globalTimers, TEnvironment
  use dftbp_common_globalenv, only : stdOut
  use dftbp_io_message, only : error
  use dftbp_type_commontypes, only : TOrbitals
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"
  use dftbp_extlibs_mpifx, only : mpifx_barrier, mpifx_bcast
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"
# 41 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"
  implicit none

  private
  public :: withPoisson
  public :: TPoissonInfo, TPoissonStructure
  public :: TPoissonInput, TPoisson, TPoisson_init

  logical, parameter :: withPoisson = .false.


# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

  type :: TPoisson
  end type TPoisson

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


# 131 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

  type :: TPoissonStructure
  end type TPoissonStructure

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


# 236 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

  type :: TPoissonInfo
  end type TPoissonInfo

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


# 271 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

  type :: TPoissonInput
  end type TPoissonInput

# 276 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


# 284 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


contains

# 334 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

  subroutine TPoisson_init()
  end subroutine TPoisson_init

# 339 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Private routines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 918 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/poisson.F90"

end module dftbp_extlibs_poisson
