# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90" 2

!> Common mathematical operations built out of multiple scalapack calls
module dftbp_math_scalafxext
  use dftbp_common_accuracy, only : dp
# 15 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  use dftbp_common_status, only : TStatus
  use dftbp_extlibs_scalapackfx, only : blacsfx_gsum, blacsgrid, CSRC_, DLEN_, MB_, NB_, RSRC_,&
      & scalafx_getlocalshape, scalafx_indxl2g, scalafx_ppotrf, scalafx_ppotri
# 19 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  implicit none

  private
  public :: psymmatinv, phermatinv
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  public :: distrib2replicated
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"

contains

# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"

  !> Inversion of a symmetric matrix
  subroutine psymmatinv(desc, aa, status, uplo)

    !> Matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> Matrix to invert on entry, inverted matrix on exit
    real(dp), intent(inout) :: aa(:,:)

    !> Status flag
    type(TStatus), intent(out) :: status

    !> Whether upper or lower triangle is specified in the matrix ("U" or "L", default: "L")
    character, intent(in), optional :: uplo

    integer :: info

    call scalafx_ppotrf(aa, desc, uplo=uplo, info=info)
    if (info /= 0) then
  block
# 50 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    character(1024) :: message
# 50 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    write(message, "('scalafx_ppotrf failed in psymmatinv (info: ',I0,')')") info
# 50 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  call status%setError(-1, trim(message), "src/dftbp/math/scalafxext.F90", 50)
# 50 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  end block
# 50 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  return
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    end if
    call scalafx_ppotri(aa, desc, uplo=uplo, info=info)
    if (info /= 0) then
  block
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    character(1024) :: message
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    write(message, "('scalafx_ppotri failed in psymmatinv (info: ',I0,')')") info
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  call status%setError(-1, trim(message), "src/dftbp/math/scalafxext.F90", 55)
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  end block
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  return
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    end if

  end subroutine psymmatinv


  !> Inversion of a hermitian matrix
  subroutine phermatinv(desc, aa, status, uplo)

    !> Matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> Matrix to invert on entry, inverted matrix on exit
    complex(dp), intent(inout) :: aa(:,:)

    !> Status flag
    type(TStatus), intent(out) :: status

    !> Whether upper or lower triangle is specified in the matrix ("U" or "L", default: "L")
    character, intent(in), optional :: uplo

    integer :: info

    call scalafx_ppotrf(aa, desc, uplo=uplo, info=info)
    if (info /= 0) then
  block
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    character(1024) :: message
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    write(message, "('scalafx_ppotrf failed in phermatinv (info: ',I0,')')") info
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  call status%setError(-1, trim(message), "src/dftbp/math/scalafxext.F90", 81)
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  end block
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  return
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    end if
    call scalafx_ppotri(aa, desc, uplo=uplo, info=info)
    if (info /= 0) then
  block
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    character(1024) :: message
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    write(message, "('scalafx_ppotri failed in phermatinv (info: ',I0,')')") info
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  call status%setError(-1, trim(message), "src/dftbp/math/scalafxext.F90", 86)
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  end block
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
  return
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"
    end if

  end subroutine phermatinv


  !> Collect distributed BLACS array into duplicated arrays on each processor
  subroutine distrib2replicated(grid, desc, locArrayPart, glbDuplicatedArray)

    !> Group grid for the matrix
    type(blacsgrid) :: grid

    !> Dense matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> Local part of BLACS distributed array
    real(dp), intent(in) :: locArrayPart(:,:)

    !> Globally duplicated entire array
    real(dp), intent(out) :: glbDuplicatedArray(:,:)

    integer :: iLoc, jLoc, iGlb, jGlb, nLocalRows, nLocalCols, ierr

    call scalafx_getlocalshape(grid, desc, nLocalRows, nLocalCols)
    glbDuplicatedArray(:,:) = 0.0_dp
    do iLoc = 1, nLocalRows
      iGlb = scalafx_indxl2g(iLoc, desc(MB_), grid%myrow, desc(RSRC_), grid%nrow)
      do jLoc = 1, nLocalCols
        jGlb = scalafx_indxl2g(jLoc, desc(NB_), grid%mycol, desc(CSRC_), grid%ncol)
        glbDuplicatedArray(iGlb,jGlb) = locArrayPart(iLoc,jLoc)
      end do
    end do
    call blacsfx_gsum(grid, glbDuplicatedArray, rdest=-1, cdest=-1)

  end subroutine distrib2replicated

# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/scalafxext.F90"

end module dftbp_math_scalafxext
