# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/release.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/release.F90" 2

!> Release of code constants and types
module dftbp_common_release
  implicit none

  public

  !> Release name of the code
  character(len=*), parameter :: releaseName = 'development version (commit: af0a66b2, base: 24.1)'

  !> Year of release
  integer, parameter :: releaseYear = 2025

  !> Mapping between input version and parser version
  type :: TVersionMap
    !> Named version of parser input
    character(10) :: inputVersion
    !> Corresponding numerical version of parser input
    integer :: parserVersion
  end type TVersionMap

end module dftbp_common_release
