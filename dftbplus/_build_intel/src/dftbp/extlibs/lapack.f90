!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

!> Interface wrappers for LAPACK routines. See the <a href="http://www.netlib.org/lapack/">lapack
!! project documentation</a> for documentation of the routines.
module dftbp_extlibs_lapack
  use dftbp_common_accuracy, only : rdp, rsp
  implicit none

  interface

    !> Real symmetric eigensolver
    subroutine ssyev(jobz, uplo, nn, aa, lda, ww, work, lwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(out) :: ww(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine ssyev


    !> Real symmetric eigensolver
    subroutine dsyev(jobz, uplo, nn, aa, lda, ww, work, lwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(out) :: ww(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine dsyev

  end interface


  interface

    !> Complex symmetric eigensolver
    subroutine cheev(jobz, uplo, nn, aa, lda, ww, work, lwork, rwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(out) :: ww(*)
      complex(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rsp), intent(inout) :: rwork(*)
      integer, intent(out) :: info
    end subroutine cheev


    !> Complex symmetric eigensolver
    subroutine zheev(jobz, uplo, nn, aa, lda, ww, work, lwork, rwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(out) :: ww(*)
      complex(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rdp), intent(inout) :: rwork(*)
      integer, intent(out) :: info
    end subroutine zheev

  end interface


  interface

    !> Real symmetric eigensolver (relatively robust)
    subroutine ssyevd(jobz, uplo, nn, aa, lda, ww, work, lwork, iwork, liwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(out) :: ww(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine ssyevd


    !> Real symmetric eigensolver (relatively robust)
    subroutine dsyevd(jobz, uplo, nn, aa, lda, ww, work, lwork, iwork, liwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(out) :: ww(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine dsyevd

  end interface


  interface

    !> Complex hermitian eigensolver (relatively robust)
    subroutine cheevd(jobz, uplo, nn, aa, lda, ww, work, lwork, rwork, lrwork, iwork,&
        & liwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(out) :: ww(*)
      complex(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rsp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine cheevd


    !> Complex hermitian eigensolver (relatively robust)
    subroutine zheevd(jobz, uplo, nn, aa, lda, ww, work, lwork, rwork, lrwork, iwork,&
        & liwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(out) :: ww(*)
      complex(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rdp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine zheevd

  end interface


  interface

    !> Real symmetric eigensolver (relatively robust)
    subroutine ssyevr(jobz, range, uplo, nn, aa, lda, vl, vu, il, iu, abstol, mm, ww,&
        & zz, ldz, isuppz, work, lwork, iwork, liwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: range
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(in) :: vl
      real(rsp), intent(in) :: vu
      integer, intent(in) :: il
      integer, intent(in) :: iu
      real(rsp), intent(in) :: abstol
      integer, intent(out) :: mm
      real(rsp), intent(out) :: ww(*)
      integer, intent(in) :: ldz
      real(rsp), intent(out) :: zz(ldz, *)
      integer, intent(out) :: isuppz(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine ssyevr


    !> Real symmetric eigensolver (relatively robust)
    subroutine dsyevr(jobz, range, uplo, nn, aa, lda, vl, vu, il, iu, abstol, mm, ww,&
        & zz, ldz, isuppz, work, lwork, iwork, liwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: range
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(in) :: vl
      real(rdp), intent(in) :: vu
      integer, intent(in) :: il
      integer, intent(in) :: iu
      real(rdp), intent(in) :: abstol
      integer, intent(out) :: mm
      real(rdp), intent(out) :: ww(*)
      integer, intent(in) :: ldz
      real(rdp), intent(out) :: zz(ldz, *)
      integer, intent(out) :: isuppz(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine dsyevr

  end interface


  interface

    !> Complex hermitian eigensolver (relatively robust)
    subroutine cheevr(jobz, range, uplo, nn, aa, lda, vl, vu, il, iu, abstol,&
        & mm, ww, zz, ldz, isuppz, work, lwork, rwork, lrwork, iwork, liwork, info)
      import :: rsp
      character, intent(in) :: jobz
      character, intent(in) :: range
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      real(rsp), intent(in) :: vl
      real(rsp), intent(in) :: vu
      integer, intent(in) :: il
      integer, intent(in) :: iu
      real(rsp), intent(in) :: abstol
      integer, intent(out) :: mm
      real(rsp), intent(out) :: ww(*)
      integer, intent(in) :: ldz
      complex(rsp), intent(out) :: zz(ldz, *)
      integer, intent(out) :: isuppz(*)
      complex(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rsp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine cheevr


    !> Complex hermitian eigensolver (relatively robust)
    subroutine zheevr(jobz, range, uplo, nn, aa, lda, vl, vu, il, iu, abstol,&
        & mm, ww, zz, ldz, isuppz, work, lwork, rwork, lrwork, iwork, liwork, info)
      import :: rdp
      character, intent(in) :: jobz
      character, intent(in) :: range
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      real(rdp), intent(in) :: vl
      real(rdp), intent(in) :: vu
      integer, intent(in) :: il
      integer, intent(in) :: iu
      real(rdp), intent(in) :: abstol
      integer, intent(out) :: mm
      real(rdp), intent(out) :: ww(*)
      integer, intent(in) :: ldz
      complex(rdp), intent(out) :: zz(ldz, *)
      integer, intent(out) :: isuppz(*)
      complex(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rdp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine zheevr

  end interface


  interface

    !> Real symmetric generalized eigensolver
    subroutine ssygv(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: bb(ldb, *)
      real(rsp), intent(out) :: ww(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine ssygv


    !> Real symmetric generalized eigensolver
    subroutine dsygv(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: bb(ldb, *)
      real(rdp), intent(out) :: ww(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine dsygv

  end interface


  interface

    !> Complex hermitian generalized eigensolver
    subroutine chegv(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, rwork,&
          & info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rsp), intent(inout) :: bb(ldb, *)
      real(rsp), intent(out) :: ww(*)
      complex(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rsp), intent(inout) :: rwork(*)
      integer, intent(out) :: info
    end subroutine chegv


    !> Complex hermitian generalized eigensolver
    subroutine zhegv(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, rwork,&
          & info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rdp), intent(inout) :: bb(ldb, *)
      real(rdp), intent(out) :: ww(*)
      complex(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rdp), intent(inout) :: rwork(*)
      integer, intent(out) :: info
    end subroutine zhegv

  end interface


  interface

    !> Real symmetric generalized eigensolver (divide and conquer)
    subroutine ssygvd(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, iwork,&
          & liwork, info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: bb(ldb, *)
      real(rsp), intent(out) :: ww(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine ssygvd

    !> Real symmetric generalized eigensolver (divide and conquer)
    subroutine dsygvd(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, iwork,&
          & liwork, info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: bb(ldb, *)
      real(rdp), intent(out) :: ww(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine dsygvd
  end interface


  interface

    !> Complex hermitian generalized eigensolver (divide and conquer)
    subroutine chegvd(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, rwork,&
          & lrwork, iwork, liwork, info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rsp), intent(inout) :: bb(ldb, *)
      real(rsp), intent(out) :: ww(*)
      complex(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rsp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine chegvd


    !> Complex hermitian generalized eigensolver (divide and conquer)
    subroutine zhegvd(itype, jobz, uplo, nn, aa, lda, bb, ldb, ww, work, lwork, rwork,&
          & lrwork, iwork, liwork, info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: jobz
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rdp), intent(inout) :: bb(ldb, *)
      real(rdp), intent(out) :: ww(*)
      complex(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      real(rdp), intent(inout) :: rwork(*)
      integer, intent(in) :: lrwork
      integer, intent(inout) :: iwork(*)
      integer, intent(in) :: liwork
      integer, intent(out) :: info
    end subroutine zhegvd

  end interface




  interface

    !> Cholesky factorization of symmetric / hermitian positive definite matrix
    subroutine spotrf(uplo, nn, aa, lda, info)
      import :: rsp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: info
    end subroutine spotrf


    !> Cholesky factorization of symmetric / hermitian positive definite matrix
    subroutine dpotrf(uplo, nn, aa, lda, info)
      import :: rdp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: info
    end subroutine dpotrf


    !> Cholesky factorization of symmetric / hermitian positive definite matrix
    subroutine cpotrf(uplo, nn, aa, lda, info)
      import :: rsp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: info
    end subroutine cpotrf


    !> Cholesky factorization of symmetric / hermitian positive definite matrix
    subroutine zpotrf(uplo, nn, aa, lda, info)
      import :: rdp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: info
    end subroutine zpotrf

  end interface


  interface

    !> Reduces generalized eigenproblem to standard form
    subroutine ssygst(itype, uplo, nn, aa, lda, bb, ldb, info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(in) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine ssygst


    !> Reduces generalized eigenproblem to standard form
    subroutine dsygst(itype, uplo, nn, aa, lda, bb, ldb, info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(in) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine dsygst


    !> Reduces generalized eigenproblem to standard form
    subroutine chegst(itype, uplo, nn, aa, lda, bb, ldb, info)
      import :: rsp
      integer, intent(in) :: itype
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rsp), intent(in) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine chegst


    !> Reduces generalized eigenproblem to standard form
    subroutine zhegst(itype, uplo, nn, aa, lda, bb, ldb, info)
      import :: rdp
      integer, intent(in) :: itype
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      complex(rdp), intent(in) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine zhegst

  end interface


  interface

    !> Solve overdetermined or underdetermined real linear systems
    subroutine sgesv(nn, nrhs, aa, lda, ipiv, bb, ldb, info)
      import :: rsp
      integer, intent(in) :: nn
      integer, intent(in) :: nrhs
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine sgesv

    !> Solve overdetermined or underdetermined real linear systems
    subroutine dgesv(nn, nrhs, aa, lda, ipiv, bb, ldb, info)
      import :: rdp
      integer, intent(in) :: nn
      integer, intent(in) :: nrhs
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine dgesv
  end interface


    interface

    !> Solve overdetermined or underdetermined real linear systems
    subroutine sposv(nn, nrhs, aa, lda, bb, ldb, info)
      import :: rsp
      integer, intent(in) :: nn
      integer, intent(in) :: nrhs
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine sposv

    !> Solve overdetermined or underdetermined real linear systems
    subroutine dposv(nn, nrhs, aa, lda, bb, ldb, info)
      import :: rdp
      integer, intent(in) :: nn
      integer, intent(in) :: nrhs
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: bb(ldb, *)
      integer, intent(out) :: info
    end subroutine dposv
  end interface


  interface

    !> Computes LU factorization of real matrix
    subroutine sgetrf(mm, nn, aa, lda, ipiv, info)
      import :: rsp
      integer, intent(in) :: mm
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(out) :: info
    end subroutine sgetrf

    !> Computes LU factorization of real matrix
    subroutine dgetrf(mm, nn, aa, lda, ipiv, info)
      import :: rdp
      integer, intent(in) :: mm
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(out) :: info
    end subroutine dgetrf

    !> Computes LU factorization of real matrix
    subroutine cgetrf(mm, nn, aa, lda, ipiv, info)
      import :: rsp
      integer, intent(in) :: mm
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rsp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(out) :: info
    end subroutine cgetrf

    !> Computes LU factorization of real matrix
    subroutine zgetrf(mm, nn, aa, lda, ipiv, info)
      import :: rdp
      integer, intent(in) :: mm
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      complex(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      integer, intent(out) :: info
    end subroutine zgetrf
  end interface


  interface

    !> Computes inverse of a real matrix using LU factorisation
    subroutine sgetri(nn, aa, lda, ipiv, work, lwork, info)
      import :: rsp
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rsp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ipiv(*)
      real(rsp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine sgetri


    !> Computes inverse of a real matrix using LU factorisation
    subroutine dgetri(nn, aa, lda, ipiv, work, lwork, info)
      import :: rdp
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(in) :: ipiv(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine dgetri

  end interface


  interface

    !> Factorise a real symmetric matrix as A = U*D*U**T or A = L*D*L**T
    subroutine ssytrf(uplo, nn, aa, lda, ipiv, work, lwork, info)
      import :: rdp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine ssytrf


    !> Factorise a real symmetric matrix as A = U*D*U**T or A = L*D*L**T
    subroutine dsytrf(uplo, nn, aa, lda, ipiv, work, lwork, info)
      import :: rdp
      character, intent(in) :: uplo
      integer, intent(in) :: nn
      integer, intent(in) :: lda
      real(rdp), intent(inout) :: aa(lda, *)
      integer, intent(out) :: ipiv(*)
      real(rdp), intent(inout) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(out) :: info
    end subroutine dsytrf

  end interface


  interface

    !> Returns a vector of real random numbers from a uniform or normal distribution
    subroutine slarnv(idist, iseed, nn, xx)
      import :: rsp
      integer, intent(in) :: idist
      integer, intent(inout) :: iseed(4)
      integer, intent(in) :: nn
      real(rsp), intent(out) :: xx(*)
    end subroutine slarnv


    !> Returns a vector of real random numbers from a uniform or normal distribution
    subroutine dlarnv(idist, iseed, nn, xx)
      import :: rdp
      integer, intent(in) :: idist
      integer, intent(inout) :: iseed(4)
      integer, intent(in) :: nn
      real(rdp), intent(out) :: xx(*)
    end subroutine dlarnv


    !> Returns a vector of real random numbers from a uniform or normal distribution
    subroutine clarnv(idist, iseed, nn, xx)
      import :: rsp
      integer, intent(in) :: idist
      integer, intent(inout) :: iseed(4)
      integer, intent(in) :: nn
      complex(rsp), intent(out) :: xx(*)
    end subroutine clarnv


    !> Returns a vector of real random numbers from a uniform or normal distribution
    subroutine zlarnv(idist, iseed, nn, xx)
      import :: rdp
      integer, intent(in) :: idist
      integer, intent(inout) :: iseed(4)
      integer, intent(in) :: nn
      complex(rdp), intent(out) :: xx(*)
    end subroutine zlarnv

  end interface


  interface
    !> Provides problem-dependent LAPACK routine parameters for the local environment
    function ilaenv(ispec, name, opts, n1, n2, n3, n4)
      integer, intent(in) :: ispec
      character, intent(in) :: name
      character, intent(in) :: opts
      integer, intent(in) :: n1
      integer, intent(in) :: n2
      integer, intent(in) :: n3
      integer, intent(in) :: n4
      integer :: ilaenv
    end function ilaenv
  end interface


  interface

    !> Machine parameters
    function slamch(cmach)
      import :: rsp
      character, intent(in) :: cmach
      real(rsp) :: slamch
    end function slamch


    !> Machine parameters
    function dlamch(cmach)
      import :: rdp
      character, intent(in) :: cmach
      real(rdp) :: dlamch
    end function dlamch

  end interface


  interface
    !> Error handler for the LAPACK routines
    subroutine xerbla(srname, info)
      character(6), intent(in) :: srname
      integer, intent(in) :: info
    end subroutine xerbla
  end interface


  interface

  !> Real singular value decomposition
    subroutine rgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, info)
      import :: rsp
      character, intent(in) :: jobvt
      character, intent(in) :: jobu
      integer, intent(in) :: m
      integer, intent(in) :: n
      integer, intent(in) :: lda
      integer, intent(in) :: ldu
      integer, intent(in) :: ldvt
      real(rsp), intent(inout) :: a(lda,*)
      real(rsp), intent(out) :: s(*)
      real(rsp), intent(out) :: u(ldu,*)
      real(rsp), intent(out) :: vt(ldvt,*)
      real(rsp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine rgesvd


  !> Real singular value decomposition
    subroutine dgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, info)
      import :: rdp
      character, intent(in) :: jobvt
      character, intent(in) :: jobu
      integer, intent(in) :: m
      integer, intent(in) :: n
      integer, intent(in) :: lda
      integer, intent(in) :: ldu
      integer, intent(in) :: ldvt
      real(rdp), intent(inout) :: a(lda,*)
      real(rdp), intent(out) :: s(*)
      real(rdp), intent(out) :: u(ldu,*)
      real(rdp), intent(out) :: vt(ldvt,*)
      real(rdp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine dgesvd

  end interface


  interface

    !> Complex singular value decomposition
    subroutine cgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork,&
        & rwork, info)
      import :: rsp
      character, intent(in) :: jobvt
      character, intent(in) :: jobu
      integer, intent(in) :: m
      integer, intent(in) :: n
      integer, intent(in) :: lda
      integer, intent(in) :: ldu
      integer, intent(in) :: ldvt
      complex(rsp), intent(inout) :: a(lda,*)
      real(rsp), intent(out) :: s(*)
      real(rsp), intent(out) :: rwork(*)
      complex(rsp), intent(out) :: u(ldu,*)
      complex(rsp), intent(out) :: vt(ldvt,*)
      complex(rsp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine cgesvd


    !> Complex singular value decomposition
    subroutine zgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork,&
        & rwork, info)
      import :: rdp
      character, intent(in) :: jobvt
      character, intent(in) :: jobu
      integer, intent(in) :: m
      integer, intent(in) :: n
      integer, intent(in) :: lda
      integer, intent(in) :: ldu
      integer, intent(in) :: ldvt
      complex(rdp), intent(inout) :: a(lda,*)
      real(rdp), intent(out) :: s(*)
      real(rdp), intent(out) :: rwork(*)
      complex(rdp), intent(out) :: u(ldu,*)
      complex(rdp), intent(out) :: vt(ldvt,*)
      complex(rdp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine zgesvd

  end interface


  interface

    !> general matrix eigensolver
    subroutine sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work,&
          & lwork, info)
      import :: rsp
      character, intent(in) :: jobvl
      character, intent(in) :: jobvr
      integer, intent(in) :: n
      real(rsp), intent(inout) :: a(lda,*)
      integer, intent(in) :: lda
      real(rsp), intent(out) :: wr(*)
      real(rsp), intent(out) :: wi(*)
      real(rsp), intent(out) :: vl(ldvl, *)
      integer, intent(in) :: ldvl
      real(rsp), intent(out) :: vr(ldvr, *)
      integer, intent(in) :: ldvr
      real(rsp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine sgeev


    !> general matrix eigensolver
    subroutine dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work,&
          & lwork, info)
      import :: rdp
      character, intent(in) :: jobvl
      character, intent(in) :: jobvr
      integer, intent(in) :: n
      real(rdp), intent(inout) :: a(lda,*)
      integer, intent(in) :: lda
      real(rdp), intent(out) :: wr(*)
      real(rdp), intent(out) :: wi(*)
      real(rdp), intent(out) :: vl(ldvl, *)
      integer, intent(in) :: ldvl
      real(rdp), intent(out) :: vr(ldvr, *)
      integer, intent(in) :: ldvr
      real(rdp), intent(out) :: work(*)
      integer, intent(in) :: lwork
      integer, intent(in) :: info
    end subroutine dgeev

  end interface


  interface

    !> Triangular solve with multiple right-hand sides
    subroutine strsm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rsp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      real(rsp), intent(in) :: alpha
      integer, intent(in) :: lda
      real(rsp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: b(ldb, *)
    end subroutine strsm


    !> Triangular solve with multiple right-hand sides
    subroutine dtrsm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rdp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      real(rdp), intent(in) :: alpha
      integer, intent(in) :: lda
      real(rdp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: b(ldb, *)
    end subroutine dtrsm


    !> Triangular solve with multiple right-hand sides
    subroutine ctrsm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rsp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      complex(rsp), intent(in) :: alpha
      integer, intent(in) :: lda
      complex(rsp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      complex(rsp), intent(inout) :: b(ldb, *)
    end subroutine ctrsm


    !> Triangular solve with multiple right-hand sides
    subroutine ztrsm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rdp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      complex(rdp), intent(in) :: alpha
      integer, intent(in) :: lda
      complex(rdp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      complex(rdp), intent(inout) :: b(ldb, *)
    end subroutine ztrsm

  end interface


  interface

    !> Triangular matrix-matrix multiplication
    subroutine strmm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rsp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      real(rsp), intent(in) :: alpha
      integer, intent(in) :: lda
      real(rsp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      real(rsp), intent(inout) :: b(ldb, *)
    end subroutine strmm


    !> Triangular matrix-matrix multiplication
    subroutine dtrmm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rdp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      real(rdp), intent(in) :: alpha
      integer, intent(in) :: lda
      real(rdp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      real(rdp), intent(inout) :: b(ldb, *)
    end subroutine dtrmm


    !> Triangular matrix-matrix multiplication
    subroutine ctrmm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rsp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      complex(rsp), intent(in) :: alpha
      integer, intent(in) :: lda
      complex(rsp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      complex(rsp), intent(inout) :: b(ldb, *)
    end subroutine ctrmm


    !> Triangular matrix-matrix multiplication
    subroutine ztrmm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)
      import :: rdp
      character, intent(in) :: side
      character, intent(in) :: uplo
      character, intent(in) :: transa
      character, intent(in) :: diag
      integer, intent(in) :: m
      integer, intent(in) :: n
      complex(rdp), intent(in) :: alpha
      integer, intent(in) :: lda
      complex(rdp), intent(in) :: a(lda, *)
      integer, intent(in) :: ldb
      complex(rdp), intent(inout) :: b(ldb, *)
    end subroutine ztrmm

  end interface

end module dftbp_extlibs_lapack
