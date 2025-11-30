# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!> Wrapper functions for scalapack.
module scalapack_module
  use scalapackfx_common_module
  implicit none
  private

  public :: psygst, phegst, psyev, pheev, psyevd, pheevd, psyevr, pheevr
  public :: ptrsm, pposv, ppotrf, ppotri, ptrtri, pgetrf, pgetri, pgesvd
  public :: sl_init, numroc, infog2l, indxl2g, descinit, indxg2p

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! ppotrf
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! ppotri
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! ptrtri
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pgetrf
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pgetri
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! psygst
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 120 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! phegst
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 142 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! psyev
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 163 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pheev
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! psyevd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pheevd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 236 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! psyevr
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 265 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pheevr
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! prgesvd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 322 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pcgesvd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 347 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! ptrsm
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 368 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! pposv
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 388 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! SCALAPACK CORE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Cholesky factorization of symmetric/Hermitian positive definite matrix.
  interface ppotrf
# 396 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Cholesky factorization of symmetric/Hermitian pos.def. matrix (real).
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pspotrf(uplo, nn, aa, ia, ja, desca, info)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pspotrf
# 396 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Cholesky factorization of symmetric/Hermitian pos.def. matrix (dreal).
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdpotrf(uplo, nn, aa, ia, ja, desca, info)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdpotrf
# 396 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Cholesky factorization of symmetric/Hermitian pos.def. matrix (complex).
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcpotrf(uplo, nn, aa, ia, ja, desca, info)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcpotrf
# 396 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Cholesky factorization of symmetric/Hermitian pos.def. matrix (dcomplex).
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzpotrf(uplo, nn, aa, ia, ja, desca, info)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzpotrf
# 400 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface ppotrf

  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix.
  interface ppotri
# 405 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 406 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (real).
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pspotri(uplo, nn, aa, ia, ja, desca, info)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pspotri
# 405 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 406 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (dreal).
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdpotri(uplo, nn, aa, ia, ja, desca, info)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdpotri
# 405 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 406 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (complex).
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcpotri(uplo, nn, aa, ia, ja, desca, info)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcpotri
# 405 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 406 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (dcomplex).
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzpotri(uplo, nn, aa, ia, ja, desca, info)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 407 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzpotri
# 409 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface ppotri

  !> Inversion of a triangular matrix.
  interface ptrtri
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 415 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (real).
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pstrtri(uplo, diag, nn, aa, ia, ja, desca, info)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo, diag
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pstrtri
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 415 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (dreal).
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdtrtri(uplo, diag, nn, aa, ia, ja, desca, info)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo, diag
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdtrtri
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 415 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (complex).
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pctrtri(uplo, diag, nn, aa, ia, ja, desca, info)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo, diag
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pctrtri
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 415 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inversion of a Cholesky decomposed symmetric/Hermitian matrix (dcomplex).
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pztrtri(uplo, diag, nn, aa, ia, ja, desca, info)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo, diag
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 416 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pztrtri
# 418 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface ptrtri

  !> LU decomposition of a general matrix with pivoting
  interface pgetrf
# 423 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 424 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> LU factorization of a general matrix with pivoting (real).
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine psgetrf(mm, nn, aa, ia, ja, desca, ipiv, info)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine psgetrf
# 423 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 424 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> LU factorization of a general matrix with pivoting (dreal).
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdgetrf(mm, nn, aa, ia, ja, desca, ipiv, info)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdgetrf
# 423 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 424 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> LU factorization of a general matrix with pivoting (complex).
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcgetrf(mm, nn, aa, ia, ja, desca, ipiv, info)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcgetrf
# 423 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 424 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> LU factorization of a general matrix with pivoting (dcomplex).
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzgetrf(mm, nn, aa, ia, ja, desca, ipiv, info)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzgetrf
# 427 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pgetrf

  !> Inversion of an LU-decomposed general matrix with pivoting
  interface pgetri
# 432 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 433 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inverse of an LU factorized general matrix (real).
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine psgetri(nn, aa, ia, ja, desca, ipiv, work, lwork, iwork, liwork, info)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: work(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork, liwork
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine psgetri
# 432 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 433 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inverse of an LU factorized general matrix (dreal).
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdgetri(nn, aa, ia, ja, desca, ipiv, work, lwork, iwork, liwork, info)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: work(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork, liwork
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdgetri
# 432 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 433 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inverse of an LU factorized general matrix (complex).
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcgetri(nn, aa, ia, ja, desca, ipiv, work, lwork, iwork, liwork, info)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: work(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork, liwork
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcgetri
# 432 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 433 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Inverse of an LU factorized general matrix (dcomplex).
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzgetri(nn, aa, ia, ja, desca, ipiv, work, lwork, iwork, liwork, info)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: ipiv(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: work(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork, liwork
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzgetri
# 436 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pgetri

  !> Reduces generalized symmetric eigenvalue problem to standard form.
  interface psygst
# 441 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 442 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Reduces generalized symmetric eigenvalue problem to standard form (real).
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pssygst(ibtype, uplo, nn, aa, ia, ja, desca, bb, ib,&
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & jb, descb, scale, info)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ibtype
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb, descb(*)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: bb(descb(LLD_), *)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: scale
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pssygst
# 441 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 442 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Reduces generalized symmetric eigenvalue problem to standard form (dreal).
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdsygst(ibtype, uplo, nn, aa, ia, ja, desca, bb, ib,&
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & jb, descb, scale, info)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ibtype
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb, descb(*)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: bb(descb(LLD_), *)
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: scale
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 443 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdsygst
# 445 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface psygst

  !> Reduces generalized Hermitian eigenvalue problem to standard form.
  interface phegst
# 450 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 451 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Reduces generalized Hermitian eigenvalue problem to standard form (complex).
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pchegst(ibtype, uplo, nn, aa, ia, ja, desca, bb, ib,&
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & jb, descb, scale, info)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ibtype
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb, descb(*)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(in) :: bb(descb(LLD_), *)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: scale
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pchegst
# 450 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 451 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Reduces generalized Hermitian eigenvalue problem to standard form (dcomplex).
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzhegst(ibtype, uplo, nn, aa, ia, ja, desca, bb, ib,&
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & jb, descb, scale, info)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ibtype
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb, descb(*)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(in) :: bb(descb(LLD_), *)
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: scale
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 452 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzhegst
# 454 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface phegst

  !> Solves the symmetric eigenvalue problem.
  interface psyev
# 459 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 460 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (real)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pssyev(jobz, uplo, nn, aa, ia, ja, desca, ww, zz,&
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & iz, jz, descz, work, lwork, info)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn), zz(descz(LLD_),*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: work(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pssyev
# 459 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 460 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (dreal)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdsyev(jobz, uplo, nn, aa, ia, ja, desca, ww, zz,&
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & iz, jz, descz, work, lwork, info)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn), zz(descz(LLD_),*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: work(*)
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 461 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdsyev
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface psyev

  !> Solves the Hermitian eigenvalue problem.
  interface pheev
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (complex)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcheev(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, rwork, lrwork, info)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(out) ::  zz(descz(LLD_),*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: work(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: rwork(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcheev
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (dcomplex)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzheev(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, rwork, lrwork, info)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(out) ::  zz(descz(LLD_),*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: work(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: rwork(*)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzheev
# 472 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pheev

  !> Solves the symmetric eigenvalue problem by divide and conquer algorithm.
  interface psyevd
# 477 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 478 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (real)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pssyevd(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, iwork, liwork, info)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn), zz(descz(LLD_),*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: work(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pssyevd
# 477 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 478 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (dreal)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdsyevd(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, iwork, liwork, info)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn), zz(descz(LLD_),*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: work(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 479 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdsyevd
# 481 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface psyevd

  !> Solves the Hermitian eigenvalue problem by divide and conquer algorithm.
  interface pheevd
# 486 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (complex)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcheevd(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, rwork, lrwork, iwork, liwork, info)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(out) ::  zz(descz(LLD_),*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: work(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: rwork(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcheevd
# 486 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by divide and conquer algorithm (dcomplex)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzheevd(jobz, uplo, nn, aa, ia, ja, desca, ww, zz, iz, jz,&
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & descz, work, lwork, rwork, lrwork, iwork, liwork, info)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, uplo
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz, descz(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(out) ::  zz(descz(LLD_),*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: work(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: rwork(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzheevd
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pheevd

  !> Solves the symmetric eigenvalue problem by the MRRR algorithm.
  interface psyevr
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 496 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by MRRR algorithm (real)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pssyevr(jobz, range, uplo, nn, aa, ia, ja, desca, vl, vu,&
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & il, iu, mm, nz, ww, zz, iz, jz, descz, work, lwork, iwork, liwork, info)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, range, uplo
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: vl, vu
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: il, iu
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: mm, nz
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descz(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: zz(descz(LLD_),*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: work(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pssyevr
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 496 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by MRRR algorithm (dreal)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdsyevr(jobz, range, uplo, nn, aa, ia, ja, desca, vl, vu,&
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & il, iu, mm, nz, ww, zz, iz, jz, descz, work, lwork, iwork, liwork, info)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, range, uplo
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: vl, vu
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: il, iu
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: mm, nz
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descz(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: zz(descz(LLD_),*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: work(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdsyevr
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface psyevr

  !> Solves the Hermitian eigenvalue problem by the MRRR algorithm.
  interface pheevr
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by MRRR algorithm (complex)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcheevr(jobz, range, uplo, nn, aa, ia, ja, desca, vl,&
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & vu, il, iu, mm, nz, ww, zz, iz, jz, descz, work, lwork, rwork, lrwork,&
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & iwork, liwork, info)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, range, uplo
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: vl, vu
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: il, iu
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: mm, nz
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: ww(nn)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descz(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(out) ::  zz(descz(LLD_),*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: work(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: rwork(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcheevr
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Eigenvalues and eigenvectors by MRRR algorithm (dcomplex)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzheevr(jobz, range, uplo, nn, aa, ia, ja, desca, vl,&
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & vu, il, iu, mm, nz, ww, zz, iz, jz, descz, work, lwork, rwork, lrwork,&
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & iwork, liwork, info)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobz, range, uplo
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: vl, vu
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: il, iu
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: mm, nz
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: ww(nn)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descz(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(out) ::  zz(descz(LLD_),*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iz, jz
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: work(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: rwork(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lrwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(inout) :: iwork(*)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: liwork
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzheevr
# 508 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pheevr

  !> Singular value decomposition of a matrix
  interface pgesvd
# 513 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Singular values and vectors (real)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine psgesvd(jobu, jobvt, mm, nn, aa, ia, ja, desca, sigma,&
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & uu, iu, ju, descu, vt, ivt, jvt, descvt, work, lwork, info)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobu, jobvt
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: sigma(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iu, ju, descu(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: uu(descu(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ivt, jvt, descvt(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: vt(descvt(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: work(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine psgesvd
# 513 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Singular values and vectors (dreal)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdgesvd(jobu, jobvt, mm, nn, aa, ia, ja, desca, sigma,&
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & uu, iu, ju, descu, vt, ivt, jvt, descvt, work, lwork, info)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobu, jobvt
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: sigma(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iu, ju, descu(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: uu(descu(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ivt, jvt, descvt(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: vt(descvt(LLD_), *)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: work(*)
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 515 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdgesvd
# 517 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 518 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 519 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Singular values and vectors (complex)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcgesvd(jobu, jobvt, mm, nn, aa, ia, ja, desca, sigma,&
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & uu, iu, ju, descu, vt, ivt, jvt, descvt, work, lwork, rwork, info)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobu, jobvt
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(out) :: sigma(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iu, ju, descu(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(out) :: uu(descu(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ivt, jvt, descvt(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(out) :: vt(descvt(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: work(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: rwork(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcgesvd
# 518 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 519 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Singular values and vectors (dcomplex)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzgesvd(jobu, jobvt, mm, nn, aa, ia, ja, desca, sigma,&
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    & uu, iu, ju, descu, vt, ivt, jvt, descvt, work, lwork, rwork, info)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: jobu, jobvt
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja, desca(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(out) :: sigma(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: iu, ju, descu(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(out) :: uu(descu(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ivt, jvt, descvt(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(out) :: vt(descvt(LLD_), *)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: work(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: lwork
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: rwork(*)
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzgesvd
# 522 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pgesvd

  !> Linear system of equation for triangular matrix.
  interface ptrsm
# 527 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 528 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a triangular matrix equation (real).
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pstrsm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja,&
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & desca, bb, ib, jb, descb)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: alpha
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: bb(descb(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pstrsm
# 527 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 528 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a triangular matrix equation (dreal).
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdtrsm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja,&
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & desca, bb, ib, jb, descb)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: alpha
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: bb(descb(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdtrsm
# 527 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 528 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a triangular matrix equation (complex).
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pctrsm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja,&
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & desca, bb, ib, jb, descb)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(in) :: alpha
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: bb(descb(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pctrsm
# 527 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 528 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a triangular matrix equation (dcomplex).
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pztrsm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja,&
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
      & desca, bb, ib, jb, descb)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: mm, nn
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(in) :: alpha
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: bb(descb(LLD_), *)
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 529 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pztrsm
# 531 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface ptrsm

  !> Linear system of equation for hermitian/symmetric matrix
  interface pposv
# 536 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 537 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a symmetric/hermitian matrix equation (real).
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine psposv(uplo, nn, nrhs, aa, ia, ja, desca, bb, ib, jb, descb, info)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn, nrhs
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(sp), intent(inout) :: bb(descb(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine psposv
# 536 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 537 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a symmetric/hermitian matrix equation (dreal).
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pdposv(uplo, nn, nrhs, aa, ia, ja, desca, bb, ib, jb, descb, info)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn, nrhs
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    real(dp), intent(inout) :: bb(descb(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pdposv
# 536 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 537 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a symmetric/hermitian matrix equation (complex).
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pcposv(uplo, nn, nrhs, aa, ia, ja, desca, bb, ib, jb, descb, info)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn, nrhs
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(sp), intent(inout) :: bb(descb(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pcposv
# 536 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 537 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  !> Solves a symmetric/hermitian matrix equation (dcomplex).
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  subroutine pzposv(uplo, nn, nrhs, aa, ia, ja, desca, bb, ib, jb, descb, info)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    import
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    character, intent(in) :: uplo
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: nn, nrhs
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: desca(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ia, ja
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: descb(*)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    complex(dp), intent(inout) :: bb(descb(LLD_), *)
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(in) :: ib, jb
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
    integer, intent(out) :: info
# 538 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end subroutine pzposv
# 540 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapack.fpp"
  end interface pposv

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! SCALAPACK TOOLS
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  interface

    !> Scalapack initialization routine.
    subroutine sl_init(ictxt, nprow, npcol)
      integer, intent(out) :: ictxt
      integer, intent(in) :: nprow, npcol
    end subroutine sl_init

    !> Number of rows or columns of distributed matrix owned by local process.
    function numroc(nn, nb, iproc, isrcproc, nproc)
      integer, intent(in) :: nn, nb, iproc, isrcproc, nproc
      integer :: numroc
    end function numroc

    !> Converts global matrix index into local.
    subroutine infog2l(grindx, gcindx, desc, nprow, npcol, myrow, mycol,&
        & lrindx, lcindx, rsrc, csrc)
      integer, intent(in) :: grindx, gcindx, desc(*)
      integer, intent(in) :: nprow, npcol, myrow, mycol
      integer, intent(out) :: lrindx, lcindx, rsrc, csrc
    end subroutine infog2l

    !> Converts local matrix index into global.
    function indxl2g(indxglob, nb, iproc, isrcproc, nprocs)
      integer :: indxl2g
      integer, intent(in) :: indxglob, nb, iproc, isrcproc, nprocs
    end function indxl2g

    !> Finds processor id where global index is stored.
    function indxg2p(indxglob, nb, iproc, isrcproc, nprocs)
      integer :: indxg2p
      integer, intent(in) :: indxglob, nb, iproc, isrcproc, nprocs
    end function indxg2p

    !> Initializes a descriptor for a distributed array.
    subroutine descinit(desc, mm, nn, mb, nb, irsrc, icsrc, ictxt, lld, info)
      integer, intent(out) :: desc(*)
      integer, intent(in) :: mm, nn, mb, nb, irsrc, icsrc, ictxt, lld
      integer, intent(out) :: info
    end subroutine descinit

  end interface


end module scalapack_module
