# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/erfcalc.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/erfcalc.F90" 2

!> Implementing the special functions erf(x), erfc(x) and exp(x*x) * erfc(x).
!>
!> The special functions erf(x), erfc(x) and exp(x * x) * erfc(x) are
!> implemented using the appropriate routine in NETLIB/SPECFUNC. The routines
!> have been converted to Fortran 2003. They can handle single and double
!> precision calls.
!>
!> Compared to iforts built in erf routine, the max. deviation is 4e-16 for
!> the double precision implementation.
module dftbp_math_erfcalc

  !> wp: working precision, sp: real single, dp: real double
  use dftbp_common_accuracy, only : wp => dp, dp => rdp, sp => rsp
  implicit none

  private
# 236 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/erfcalc.F90"

end module dftbp_math_erfcalc
