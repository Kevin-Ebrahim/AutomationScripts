# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/api/mm/hsdapi.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/api/mm/hsdapi.F90" 2

!> Proviedes access to HSD manipulation functions
module dftbp_hsdapi
  use dftbp_extlibs_xmlf90, only : fnode, fNodeList
  use dftbp_io_hsdparser, only : dumpHsd
  use dftbp_io_hsdutils, only : getChild, getChildren, getChildValue, setChild, setChildValue
  implicit none
  private

  public :: fnode, fnodeList
  public :: getChild, getChildren, setChild, getChildValue, setChildValue
  public :: dumpHsd

end module dftbp_hsdapi
