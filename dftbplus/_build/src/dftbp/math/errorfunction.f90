# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/errorfunction.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/errorfunction.F90" 2

!> Wrappers for the functions erf(x) and erfc(x).
!>
!> Based on the preprocessor settings, the error function is wrapped differently:
!>
!> a) no special definitions: the intrinsic error function is used (officially first available in
!>    the Fortran 2008 standard, but most F95/2003 compilers already implements this).
!>
!> b) INTERNAL_ERFC is defined: erf(x) and erfc(x) are internally calculated by the code.
!>
module dftbp_math_errorfunction
  use dftbp_common_accuracy, only : dp
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/errorfunction.F90"
  implicit none

  private
  public :: erfwrap, erfcwrap

contains


  !> Calculates the value of the error function.
  elemental function erfwrap(xx) result(res)
    !$OMP DECLARE SIMD(erfwrap)

    !> Function argument.
    real(dp), intent(in) :: xx

    !> erf(x)
    real(dp) :: res

    res = erf(xx)

  end function erfwrap


  !> Calculates the value of the complementary error function.
  elemental function erfcwrap(xx) result(res)
    !$OMP DECLARE SIMD(erfcwrap)

    !> Function argument.
    real(dp), intent(in) :: xx

    !> erf(x)
    real(dp) :: res

    res = erfc(xx)

  end function erfcwrap

end module dftbp_math_errorfunction
