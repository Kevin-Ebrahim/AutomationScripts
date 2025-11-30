# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

! ************************************************************************
! *** psyr / pher
! ************************************************************************


# 25 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"



! ************************************************************************
! *** psyrk / pherk
! ************************************************************************

# 51 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"




! ************************************************************************
! *** psyr2k / pher2k
! ************************************************************************

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"




! ************************************************************************
! *** psymv / phemv
! ************************************************************************

# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"



! ************************************************************************
! *** psymm / phemm
! ************************************************************************

# 142 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


! ************************************************************************
! *** ptrmm
! ************************************************************************

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


! ************************************************************************
! *** pgemm
! ************************************************************************

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


! ************************************************************************
! *** ptran / ptranu / ptranc
! ************************************************************************

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"



!> Interface to PBLAS routines
module pblas_module
  use scalapackfx_common_module
  implicit none
  private

  public :: psyr, pher
  public :: psyrk, pherk
  public :: psyr2k, pher2k
  public :: psymv, phemv
  public :: psymm, phemm
  public :: pgemm
  public :: ptrmm
  public :: ptran, ptranu
  public :: ptranc

  !> Symmetric rank one update.
  interface psyr

# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank one update (real).
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pssyr(uplo, nn, alpha, xx, ix, jx, descx, incx, aa, ia, ja, desca)
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: xx(descx(LLD_), *)
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: incx
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: aa(desca(LLD_), *)
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pssyr
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank one update (dreal).
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdsyr(uplo, nn, alpha, xx, ix, jx, descx, incx, aa, ia, ja, desca)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: xx(descx(LLD_), *)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: incx
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: aa(desca(LLD_), *)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdsyr
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface psyr

  !> Hermitian rank one update.
  interface pher

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank one update (complex).
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pcher(uplo, nn, alpha, xx, ix, jx, descx, incx, aa, ia, ja, desca)
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: xx(descx(LLD_), *)
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: incx
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: aa(desca(LLD_), *)
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pcher
# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank one update (dcomplex).
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzher(uplo, nn, alpha, xx, ix, jx, descx, incx, aa, ia, ja, desca)
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: xx(descx(LLD_), *)
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: incx
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: aa(desca(LLD_), *)
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzher
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface pher

  !> Symmetric rank-k update.
  interface psyrk

# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (real).
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pssyrk(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, beta, cc,&
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: cc(descc(LLD_), *)
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pssyrk
# 250 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (dreal).
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdsyrk(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, beta, cc,&
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: cc(descc(LLD_), *)
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdsyrk
# 251 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface psyrk

  !> Hermitian rank-k update.
  interface pherk

# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (complex).
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pcherk(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, beta, cc,&
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: cc(descc(LLD_), *)
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pcherk
# 256 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (dcomplex).
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzherk(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, beta, cc,&
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: cc(descc(LLD_), *)
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzherk
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface pherk

  !> Symmetric rank-k update.
  interface psyr2k

# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (real).
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pssyr2k(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, bb, ib, jb, descb, beta, cc,&
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: bb(descb(LLD_), *)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: cc(descc(LLD_), *)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pssyr2k
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (dreal).
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdsyr2k(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, bb, ib, jb, descb, beta, cc,&
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: bb(descb(LLD_), *)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: cc(descc(LLD_), *)
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdsyr2k
# 263 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface psyr2k

  !> Hermitian rank-k update.
  interface pher2k

# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (complex).
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pcher2k(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, bb, ib, jb, descb, beta, cc,&
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: bb(descb(LLD_), *)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: cc(descc(LLD_), *)
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pcher2k
# 268 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian rank-k update (dcomplex).
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzher2k(uplo, trans, nn, kk, alpha, aa, ia, ja, desca, bb, ib, jb, descb, beta, cc,&
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & ic, jc, descc)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo, trans
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn, kk
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: bb(descb(LLD_), *)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: cc(descc(LLD_), *)
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzher2k
# 269 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface pher2k

  !> Symmetric matrix vector product
  interface psymv

# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product ($1).
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pssymv(uplo, nn, alpha, aa, ia, ja, desca, xx, ix, jx, descx, incx, &
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & beta, yy, iy, jy, descy, incy)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: xx(descx(LLD_), *)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx, incx
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descy(*)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: yy(descy(LLD_), *)
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: iy, jy, incy
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pssymv
# 274 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product ($1).
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdsymv(uplo, nn, alpha, aa, ia, ja, desca, xx, ix, jx, descx, incx, &
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & beta, yy, iy, jy, descy, incy)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: xx(descx(LLD_), *)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx, incx
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descy(*)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: yy(descy(LLD_), *)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: iy, jy, incy
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdsymv
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface psymv

  !> Hermitian matrix vector product
  interface phemv

# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product ($1).
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pchemv(uplo, nn, alpha, aa, ia, ja, desca, xx, ix, jx, descx, incx, &
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & beta, yy, iy, jy, descy, incy)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: alpha
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: xx(descx(LLD_), *)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx, incx
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: beta
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descy(*)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: yy(descy(LLD_), *)
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: iy, jy, incy
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pchemv
# 280 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product ($1).
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzhemv(uplo, nn, alpha, aa, ia, ja, desca, xx, ix, jx, descx, incx, &
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & beta, yy, iy, jy, descy, incy)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: alpha
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descx(*)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: xx(descx(LLD_), *)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ix, jx, incx
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: beta
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descy(*)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: yy(descy(LLD_), *)
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: iy, jy, incy
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzhemv
# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface phemv

  !> Symmetric matrix general matrix product
  interface psymm

# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix with general matrix product ($1).
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pssymm(side, uplo, mm, nn, alpha, aa, ia, ja, desca, &
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: bb(descb(LLD_), *)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: cc(descc(LLD_), *)
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pssymm
# 286 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix with general matrix product ($1).
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdsymm(side, uplo, mm, nn, alpha, aa, ia, ja, desca, &
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: bb(descb(LLD_), *)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: cc(descc(LLD_), *)
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdsymm
# 287 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface psymm

  !> Hermitian matrix general matrix product
  interface phemm

# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix with general matrix product ($1).
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pchemm(side, uplo, mm, nn, alpha, aa, ia, ja, desca, &
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: alpha
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: beta
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: bb(descb(LLD_), *)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: cc(descc(LLD_), *)
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pchemm
# 292 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix with general matrix product ($1).
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzhemm(side, uplo, mm, nn, alpha, aa, ia, ja, desca, &
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: uplo
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: nn
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: alpha
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: beta
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: bb(descb(LLD_), *)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: cc(descc(LLD_), *)
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzhemm
# 293 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface phemm

  !> Triangular matrix matrix product
  interface ptrmm

# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product (real).
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pstrmm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja, desca, &
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb)
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: bb(descb(LLD_), *)
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pstrmm
# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product (dreal).
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdtrmm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja, desca, &
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb)
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: bb(descb(LLD_), *)
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdtrmm
# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product (complex).
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pctrmm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja, desca, &
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb)
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: alpha
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: bb(descb(LLD_), *)
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pctrmm
# 300 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Symmetric/hermitian matrix vector product (dcomplex).
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pztrmm(side, uplo, transa, diag, mm, nn, alpha, aa, ia, ja, desca, &
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb)
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: side, uplo, transa, diag
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: alpha
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: bb(descb(LLD_), *)
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pztrmm
# 301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface ptrmm

  !> General matrix matrix product
  interface pgemm

# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> General matrix matrix product (real).
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine psgemm(transa, transb, mm, nn, kk, alpha, aa, ia, ja, desca, &
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: transa, transb
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn, kk
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: alpha
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: aa(desca(LLD_), *)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: bb(descb(LLD_), *)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in) :: beta
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: cc(descb(LLD_), *)
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine psgemm
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> General matrix matrix product (dreal).
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdgemm(transa, transb, mm, nn, kk, alpha, aa, ia, ja, desca, &
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: transa, transb
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn, kk
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: alpha
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: aa(desca(LLD_), *)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: bb(descb(LLD_), *)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in) :: beta
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: cc(descb(LLD_), *)
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdgemm
# 307 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> General matrix matrix product (complex).
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pcgemm(transa, transb, mm, nn, kk, alpha, aa, ia, ja, desca, &
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: transa, transb
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn, kk
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: alpha
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: aa(desca(LLD_), *)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: bb(descb(LLD_), *)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in) :: beta
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: cc(descb(LLD_), *)
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pcgemm
# 308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> General matrix matrix product (dcomplex).
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pzgemm(transa, transb, mm, nn, kk, alpha, aa, ia, ja, desca, &
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
      & bb, ib, jb, descb, beta, cc, ic, jc, descc)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    character, intent(in) :: transa, transb
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: mm, nn, kk
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: alpha
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: desca(*)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: aa(desca(LLD_), *)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ia, ja
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descb(*)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: bb(descb(LLD_), *)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ib, jb
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in) :: beta
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: descc(*)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: cc(descb(LLD_), *)
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in) :: ic, jc
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pzgemm
# 309 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface pgemm

  !> Real matrix transpose.
  interface ptran

# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pstran(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in)    :: alpha
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in)    :: aa(desca(LLD_), *)
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(in)    :: beta
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(sp), intent(inout) :: cc(descc(LLD_), *)
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pstran
# 314 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pdtran(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in)    :: alpha
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in)    :: aa(desca(LLD_), *)
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(in)    :: beta
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    real(dp), intent(inout) :: cc(descc(LLD_), *)
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pdtran
# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface ptran

  !> Complex matrix transpose.
  interface ptranu

# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pctranu(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: alpha
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: aa(desca(LLD_), *)
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: beta
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: cc(descc(LLD_), *)
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pctranu
# 320 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pztranu(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: alpha
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: aa(desca(LLD_), *)
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: beta
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: cc(descc(LLD_), *)
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pztranu
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface ptranu

  !> Complex hermitian matrix transpose.
  interface ptranc

# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pctranc(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: alpha
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: aa(desca(LLD_), *)
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(in)    :: beta
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(sp), intent(inout) :: cc(descc(LLD_), *)
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pctranc
# 326 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"


# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  !> Transpose of a distributed matrix ($COMMENT$).
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  subroutine pztranc(mm, nn, alpha, aa, ia, ja, desca, beta, cc, ic, jc, descc)
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    import
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: mm, nn
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: alpha
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ia, ja
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: desca(*)
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: aa(desca(LLD_), *)
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(in)    :: beta
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: ic, jc
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    integer, intent(in)   :: descc(*)
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
    complex(dp), intent(inout) :: cc(descc(LLD_), *)
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"
  end subroutine pztranc
# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblas.fpp"

  end interface ptranc

end module pblas_module
