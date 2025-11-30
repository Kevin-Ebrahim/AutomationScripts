# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/scalapackfx.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/scalapackfx.F90" 2

!> Exports scalapackfx functionality if compiled with scalapack support, otherwise empty.
module dftbp_extlibs_scalapackfx
# 13 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/scalapackfx.F90"
  use libscalapackfx_module, only : blacsfx_gemr2d, blacsfx_gsum, blacsgrid, blocklist, CSRC_,&
      & DLEN_, linecomm, M_, MB_, N_, NB_, pblasfx_pgemm, pblasfx_phemm, pblasfx_psymm,&
      & pblasfx_psymv, pblasfx_ptran, pblasfx_ptranc, RSRC_, scalafx_addg2l, scalafx_addl2g,&
      & scalafx_cpg2l, scalafx_cpl2g, scalafx_getdescriptor, scalafx_getlocalshape,&
      & scalafx_indxl2g, scalafx_infog2l, scalafx_islocal, scalafx_pgetrf, scalafx_phegv,&
      & scalafx_phegvd, scalafx_phegvr, scalafx_pposv, scalafx_ppotrf, scalafx_ppotri,&
      & scalafx_psygv, scalafx_psygvd, scalafx_psygvr, size
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/scalapackfx.F90"
  implicit none
  public

end module dftbp_extlibs_scalapackfx
