# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90" 2

!> Contains F90 wrapper functions for some commonly used lapack calls needed in the code.
!> Contains some fixes for lapack 3.0 bugs, if this gets corrected in lapack 4.x they should be
!> removed.
module dftbp_math_eigensolver
  use dftbp_common_accuracy, only : rdp, rsp
  use dftbp_extlibs_lapack, only : cheev, cheevd, cheevr, chegst, chegv, chegvd, cpotrf, ctrmm,&
      & ctrsm, dgeev, dlamch, dpotrf, dsyev, dsyevd, dsyevr, dsygst, dsygv, dsygvd, dtrmm, dtrsm,&
      & sgeev, slamch, spotrf, ssyev, ssyevd, ssyevr, ssygst, ssygv, ssygvd, strmm, strsm, zheev,&
      & zheevd, zheevr, zhegst, zhegv, zhegvd, zpotrf, ztrmm, ztrsm
  use dftbp_io_message, only : error
# 25 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  implicit none (type, external)

  private
  public :: heev, heevd, heevr, hegv, hegvd, hegvr, geev
# 32 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


  !> QR eigensolver for a symmetric/hermitian matrix
  !! Caveat: the matrix a is overwritten
  interface heev
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heev_real
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heev_dreal
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heev_complex
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heev_dcomplex
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface heev


  !> Divide and conquer eigensolver for a symmetric/hermitian matrix
  !! Caveat: the matrix a is overwritten
  interface heevd
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevd_real
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevd_dreal
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevd_complex
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevd_dcomplex
# 49 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface heevd


  !> Relatively robust eigensolver for a symmetric/hermitian matrix
  !! Caveat: the matrix a is overwritten
  interface heevr
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevr_real
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevr_dreal
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevr_complex
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure heevr_dcomplex
# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface heevr


  !> QR eigensolver for a symmetric/hermitian generalized matrix problem
  !! caveat: the matrix a is overwritten
  !! caveat: the matrix b is overwritten with Cholesky factorization
  interface hegv
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegv_real
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegv_dreal
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegv_complex
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegv_dcomplex
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface hegv


  !> Divide and conquer eigensolver for a symmetric/hermitian generalized matrix
  !! conquer eigensolver
  !! caveat: the matrix a is overwritten
  !! caveat: the matrix b is overwritten with Cholesky factorization
  interface hegvd
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvd_real
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvd_dreal
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvd_complex
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvd_dcomplex
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface hegvd


  !> Relatively robust eigensolver for a symmetric/hermitian generalized matrix problem.
  !!
  !! Using the lapack ! relatively robust representation solver, based on the SYGV source. If the
  !requested number of ! eigenvalues is lower than the size of H/S suspace mode is used (optionally
  !the range can be set ! using il and ul) to return the lowest eigenvalues/vectors of number
  !! size(w)
  interface hegvr
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvr_real
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvr_dreal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvr_complex
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure hegvr_dcomplex
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface


  !> QR eigensolver for a general matrix
  interface geev
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure geev_real
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    module procedure geev_dreal
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
  end interface geev


# 120 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

contains


# 129 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heev_real(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


# 167 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    errorGuard: block
      iStep = 1
# 171 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyev(jobz, uplo, n, a, n, w, workDummy, -1, info_)
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyev(jobz, uplo, n, a, n, w, work, workSize, info_)
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine ssyev to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure LAPACK routine ssyev, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssyev, ", info_,&
            & " off-diagonal elements did not converge to zero."
      end if
    end select
    call error(errorMsg)

  end subroutine heev_real

# 129 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heev_dreal(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


# 167 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    errorGuard: block
      iStep = 1
# 171 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyev(jobz, uplo, n, a, n, w, workDummy, -1, info_)
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyev(jobz, uplo, n, a, n, w, work, workSize, info_)
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine dsyev to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure LAPACK routine dsyev, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsyev, ", info_,&
            & " off-diagonal elements did not converge to zero."
      end if
    end select
    call error(errorMsg)

  end subroutine heev_dreal

# 129 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heev_complex(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
# 153 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


# 165 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    allocate(rwork(3 * n - 2))
# 167 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    errorGuard: block
      iStep = 1
# 173 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cheev(jobz, uplo, n, a, n, w, workDummy, -1, rwork, info_)
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cheev(jobz, uplo, n, a, n, w, work, workSize, rwork, info_)
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine cheev to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure LAPACK routine cheev, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine cheev, ", info_,&
            & " off-diagonal elements did not converge to zero."
      end if
    end select
    call error(errorMsg)

  end subroutine heev_complex

# 129 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heev_dcomplex(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
# 153 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


# 165 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    allocate(rwork(3 * n - 2))
# 167 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    errorGuard: block
      iStep = 1
# 173 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zheev(jobz, uplo, n, a, n, w, workDummy, -1, rwork, info_)
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zheev(jobz, uplo, n, a, n, w, work, workSize, rwork, info_)
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine zheev to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure LAPACK routine zheev, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zheev, ", info_,&
            & " off-diagonal elements did not converge to zero."
      end if
    end select
    call error(errorMsg)

  end subroutine heev_dcomplex

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heevd_real(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


    errorGuard: block
      iStep = 1
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyevd(jobz, uplo, n, a, n, w, workDummy, -1, iworkDummy, -1, info_)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 270 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyevd(jobz, uplo, n, a, n, w, work, workSize, iwork, iworkSize, info_)
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine ssyevd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine ssyevd, illegal argument&
            & at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssyevd, ", info_,&
            & " off-diagonal elements did not converge to zero."
        end if
    end select
    call error(errorMsg)

  end subroutine heevd_real

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heevd_dreal(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


    errorGuard: block
      iStep = 1
# 257 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyevd(jobz, uplo, n, a, n, w, workDummy, -1, iworkDummy, -1, info_)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 270 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyevd(jobz, uplo, n, a, n, w, work, workSize, iwork, iworkSize, info_)
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine dsyevd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine dsyevd, illegal argument&
            & at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsyevd, ", info_,&
            & " off-diagonal elements did not converge to zero."
        end if
    end select
    call error(errorMsg)

  end subroutine heevd_dreal

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heevd_complex(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
    real(rsp) :: rworkDummy(1)
    integer :: rworkSize
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


    errorGuard: block
      iStep = 1
# 259 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cheevd(jobz, uplo, n, a, n, w, workDummy, -1, rworkDummy, -1, iworkDummy,&
          & -1, info_)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 272 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call cheevd(jobz, uplo, n, a, n, w, work, workSize, rwork, rworkSize, iwork,&
          & iworkSize, info_)
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine cheevd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine cheevd, illegal argument&
            & at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine cheevd, ", info_,&
            & " off-diagonal elements did not converge to zero."
        end if
    end select
    call error(errorMsg)

  end subroutine heevd_complex

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for a symmetric matrix
  subroutine heevd_dcomplex(a, w, uplo, jobz, info)

    !> contains the matrix for the solver, returns as eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
    real(rdp) :: rworkDummy(1)
    integer :: rworkSize
# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iStep
    character(len=100) :: errorMsg




    n = size(a, dim=1)


    errorGuard: block
      iStep = 1
# 259 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zheevd(jobz, uplo, n, a, n, w, workDummy, -1, rworkDummy, -1, iworkDummy,&
          & -1, info_)
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 272 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call zheevd(jobz, uplo, n, a, n, w, work, workSize, rwork, rworkSize, iwork,&
          & iworkSize, info_)
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine zheevd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine zheevd, illegal argument&
            & at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zheevd, ", info_,&
            & " off-diagonal elements did not converge to zero."
        end if
    end select
    call error(errorMsg)

  end subroutine heevd_dcomplex

# 299 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for symmetric/hermitian matrix problem
  !> Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !> only the first n eigenvalues/eigenvectors are found.
  subroutine heevr_real(a, w, uplo, jobz, ilIn, iuIn, info)

    !> Contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> Eigenvalues on return
    real(rsp), intent(out) :: w(:)

    !> Upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> Compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> Lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> Upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 345 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: z(:,:)
    real(rsp) :: abstol, vl, vu
    integer :: n, info_, m, il, iu, ldz, iStep
    integer, allocatable :: isuppz(:)
    logical :: subspace
    character :: range
    character(len=100) :: errorMsg

    n = size(a, dim=1)






    subspace = (size(w) < n)
    if (subspace) then
      range = "I"
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w)
      end if
    else
      range = "A"
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (jobz == 'v' .or. jobz == 'V') then
      allocate(z(n, iu - il + 1))
      ldz = n
    else
      allocate(z(1, 1))
      ldz = 1
    end if

    allocate(isuppz(2 * n))
    abstol = slamch( 'Safe minimum' )

    errorGuard: block
      iStep = 1
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
        call ssyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
            & isuppz, workDummy, -1, iworkDummy, -1, info_)
# 403 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 411 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
          & isuppz, work, workSize, iwork, iworkSize, info_)
# 419 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 3
      a(:,:) = 0.0_rsp
      if (jobz == 'v' .or. jobz == 'V') then
        a(:n, :iu-il+1) = z
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine ssyevr to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine ssyevr, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssyevr, internal error"
      end if
    end select
    call error(errorMsg)

  end subroutine heevr_real
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for symmetric/hermitian matrix problem
  !> Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !> only the first n eigenvalues/eigenvectors are found.
  subroutine heevr_dreal(a, w, uplo, jobz, ilIn, iuIn, info)

    !> Contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> Eigenvalues on return
    real(rdp), intent(out) :: w(:)

    !> Upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> Compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> Lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> Upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 345 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: z(:,:)
    real(rdp) :: abstol, vl, vu
    integer :: n, info_, m, il, iu, ldz, iStep
    integer, allocatable :: isuppz(:)
    logical :: subspace
    character :: range
    character(len=100) :: errorMsg

    n = size(a, dim=1)






    subspace = (size(w) < n)
    if (subspace) then
      range = "I"
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w)
      end if
    else
      range = "A"
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (jobz == 'v' .or. jobz == 'V') then
      allocate(z(n, iu - il + 1))
      ldz = n
    else
      allocate(z(1, 1))
      ldz = 1
    end if

    allocate(isuppz(2 * n))
    abstol = dlamch( 'Safe minimum' )

    errorGuard: block
      iStep = 1
# 397 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
        call dsyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
            & isuppz, workDummy, -1, iworkDummy, -1, info_)
# 403 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 411 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
          & isuppz, work, workSize, iwork, iworkSize, info_)
# 419 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 3
      a(:,:) = 0.0_rdp
      if (jobz == 'v' .or. jobz == 'V') then
        a(:n, :iu-il+1) = z
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine dsyevr to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine dsyevr, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsyevr, internal error"
      end if
    end select
    call error(errorMsg)

  end subroutine heevr_dreal
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for symmetric/hermitian matrix problem
  !> Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !> only the first n eigenvalues/eigenvectors are found.
  subroutine heevr_complex(a, w, uplo, jobz, ilIn, iuIn, info)

    !> Contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> Eigenvalues on return
    real(rsp), intent(out) :: w(:)

    !> Upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> Compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> Lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> Upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 341 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
    real(rsp) :: rworkDummy(1)
    integer :: rworkSize
# 345 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    complex(rsp), allocatable :: z(:,:)
    real(rsp) :: abstol, vl, vu
    integer :: n, info_, m, il, iu, ldz, iStep
    integer, allocatable :: isuppz(:)
    logical :: subspace
    character :: range
    character(len=100) :: errorMsg

    n = size(a, dim=1)






    subspace = (size(w) < n)
    if (subspace) then
      range = "I"
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w)
      end if
    else
      range = "A"
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (jobz == 'v' .or. jobz == 'V') then
      allocate(z(n, iu - il + 1))
      ldz = n
    else
      allocate(z(1, 1))
      ldz = 1
    end if

    allocate(isuppz(2 * n))
    abstol = slamch( 'Safe minimum' )

    errorGuard: block
      iStep = 1
# 400 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
        call cheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
            & isuppz, workDummy, -1, rworkDummy, -1, iworkDummy, -1, info_)
# 403 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call cheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
          & isuppz, work, workSize, rwork, rworkSize, iwork, iworkSize, info_)
# 419 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 3
      a(:,:) = 0.0_rsp
      if (jobz == 'v' .or. jobz == 'V') then
        a(:n, :iu-il+1) = z
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine cheevr to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine cheevr, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine cheevr, internal error"
      end if
    end select
    call error(errorMsg)

  end subroutine heevr_complex
# 306 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for symmetric/hermitian matrix problem
  !> Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !> only the first n eigenvalues/eigenvectors are found.
  subroutine heevr_dcomplex(a, w, uplo, jobz, ilIn, iuIn, info)

    !> Contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> Eigenvalues on return
    real(rdp), intent(out) :: w(:)

    !> Upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> Compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> Lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> Upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info /= 0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 341 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
    real(rdp) :: rworkDummy(1)
    integer :: rworkSize
# 345 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    complex(rdp), allocatable :: z(:,:)
    real(rdp) :: abstol, vl, vu
    integer :: n, info_, m, il, iu, ldz, iStep
    integer, allocatable :: isuppz(:)
    logical :: subspace
    character :: range
    character(len=100) :: errorMsg

    n = size(a, dim=1)






    subspace = (size(w) < n)
    if (subspace) then
      range = "I"
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w)
      end if
    else
      range = "A"
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (jobz == 'v' .or. jobz == 'V') then
      allocate(z(n, iu - il + 1))
      ldz = n
    else
      allocate(z(1, 1))
      ldz = 1
    end if

    allocate(isuppz(2 * n))
    abstol = dlamch( 'Safe minimum' )

    errorGuard: block
      iStep = 1
# 400 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
        call zheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
            & isuppz, workDummy, -1, rworkDummy, -1, iworkDummy, -1, info_)
# 403 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 414 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call zheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, z, ldz,&
          & isuppz, work, workSize, rwork, rworkSize, iwork, iworkSize, info_)
# 419 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      iStep = 3
      a(:,:) = 0.0_rdp
      if (jobz == 'v' .or. jobz == 'V') then
        a(:n, :iu-il+1) = z
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine zheevr to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine zheevr, illegal argument at&
            & position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zheevr, internal error"
      end if
    end select
    call error(errorMsg)

  end subroutine heevr_dcomplex
# 446 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR eigensolver for generalized symmetric/hermitian matrix problem
  subroutine hegv_real(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, lda, info_, iitype, ldb, iStep
    character(len=100) :: errorMsg



    n = size(a, dim=2)



    lda = size(a, dim=1)

    ldb = size(b, dim=1)
    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssygv(iitype, jobz, uplo, n, a, lda, b, ldb, w, workDummy, -1, info_)
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssygv(iitype, jobz, uplo, n, a, lda, b, ldb, w, work, workSize, info_)
# 526 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine ssygv to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine ssygv, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssygv, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssygv, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegv_real

# 453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR eigensolver for generalized symmetric/hermitian matrix problem
  subroutine hegv_dreal(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, lda, info_, iitype, ldb, iStep
    character(len=100) :: errorMsg



    n = size(a, dim=2)



    lda = size(a, dim=1)

    ldb = size(b, dim=1)
    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsygv(iitype, jobz, uplo, n, a, lda, b, ldb, w, workDummy, -1, info_)
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
# 520 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsygv(iitype, jobz, uplo, n, a, lda, b, ldb, w, work, workSize, info_)
# 526 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine dsygv to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine dsygv, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsygv, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsygv, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegv_dreal

# 453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR eigensolver for generalized symmetric/hermitian matrix problem
  subroutine hegv_complex(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
# 484 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
    real(rsp) :: rworkDummy(1)
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, lda, info_, iitype, ldb, iStep
    character(len=100) :: errorMsg



    n = size(a, dim=2)



    lda = size(a, dim=1)

    ldb = size(b, dim=1)
    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 511 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call chegv(iitype, jobz, uplo, n, a, lda, b, ldb, w, workDummy, -1,&
          & rworkDummy, info_)
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
# 522 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      allocate(rwork(3 * n - 2))
      call chegv(iitype, jobz, uplo, n, a, lda, b, ldb, w, work, workSize, rwork,&
          & info_)
# 526 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine chegv to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine chegv, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine chegv, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine chegv, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegv_complex

# 453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR eigensolver for generalized symmetric/hermitian matrix problem
  subroutine hegv_dcomplex(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
# 484 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
    real(rdp) :: rworkDummy(1)
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, lda, info_, iitype, ldb, iStep
    character(len=100) :: errorMsg



    n = size(a, dim=2)



    lda = size(a, dim=1)

    ldb = size(b, dim=1)
    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 511 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zhegv(iitype, jobz, uplo, n, a, lda, b, ldb, w, workDummy, -1,&
          & rworkDummy, info_)
# 514 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
# 522 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      allocate(rwork(3 * n - 2))
      call zhegv(iitype, jobz, uplo, n, a, lda, b, ldb, w, work, workSize, rwork,&
          & info_)
# 526 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine zhegv to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine zhegv, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zhegv, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zhegv, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegv_dcomplex

# 551 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"



# 559 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for generalized symmetric matrix problem - divide and conquer
  subroutine hegvd_real(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> optional specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 597 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iitype, iStep
    character(len=100) :: errorMsg





    n = size(a, dim=1)

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 616 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssygvd(iitype, jobz, uplo, n, a, n, b, n, w, workDummy, -1, &
         & iworkDummy, -1, info_)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      worksize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssygvd(iitype, jobz, uplo, n, a, n, b, n, w, work, workSize, iwork,&
          & iworkSize, info_)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine ssygvd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine ssygvd, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssygvd, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine ssygvd, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegvd_real

# 559 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for generalized symmetric matrix problem - divide and conquer
  subroutine hegvd_dreal(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> optional specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 597 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iitype, iStep
    character(len=100) :: errorMsg





    n = size(a, dim=1)

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 616 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsygvd(iitype, jobz, uplo, n, a, n, b, n, w, workDummy, -1, &
         & iworkDummy, -1, info_)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      worksize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsygvd(iitype, jobz, uplo, n, a, n, b, n, w, work, workSize, iwork,&
          & iworkSize, info_)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine dsygvd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine dsygvd, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsygvd, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine dsygvd, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegvd_dreal

# 559 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for generalized symmetric matrix problem - divide and conquer
  subroutine hegvd_complex(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> optional specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 593 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
    real(rsp) :: rworkDummy(1)
    integer :: rworkSize
# 597 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iitype, iStep
    character(len=100) :: errorMsg





    n = size(a, dim=1)

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call chegvd(iitype, jobz, uplo, n, a, n, b, n, w, workDummy, -1,&
         & rworkDummy, -1, iworkDummy, -1, info_)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      worksize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call chegvd(iitype, jobz, uplo, n, a, n, b, n, w, work, workSize, rwork,&
          & rworkSize, iwork, iworkSize, info_)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine chegvd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine chegvd, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine chegvd, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine chegvd, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegvd_complex

# 559 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Real eigensolver for generalized symmetric matrix problem - divide and conquer
  subroutine hegvd_dcomplex(a, b, w, uplo, jobz, itype, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !> overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of the matrix
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> optional specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 593 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
    real(rdp) :: rworkDummy(1)
    integer :: rworkSize
# 597 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    integer n, info_, iitype, iStep
    character(len=100) :: errorMsg





    n = size(a, dim=1)

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    errorGuard: block
      iStep = 1
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zhegvd(iitype, jobz, uplo, n, a, n, b, n, w, workDummy, -1,&
         & rworkDummy, -1, iworkDummy, -1, info_)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_/=0) exit errorGuard

      iStep = 2
      worksize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
      call zhegvd(iitype, jobz, uplo, n, a, n, b, n, w, work, workSize, rwork,&
          & rworkSize, iwork, iworkSize, info_)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      call error("Failure in LAPACK routine zhegvd to determine optimum workspace")
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in LAPACK routine zhegvd, illegal argument&
            & at position ", -info_
      else if (info_ <= n) then
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zhegvd, ", info_,&
            & " off diagonal elements did not converge to zero."
      else
        write(errorMsg, "(a, i0, a)") "Failure in LAPACK routine zhegvd, non-positive&
            & definite overlap, minor ", info_ - n, " responsible."
      end if
    end select
    call error(errorMsg)

  end subroutine hegvd_dcomplex

# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for generalized symmetric matrix problem.
  !!
  !! Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !! only the first n eigenvalues/eigenvectors are found.
  !! This version re-uses a triangle of a matrix (saving an additional allocation that was in the
  !! previous version).
  !! Based in part on deMon routine from T. Heine
  subroutine hegvr_real(a, b, w, uplo, jobz, itype, ilIn, iuIn, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    real(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 722 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: tmpChole(:)
    integer, allocatable :: isuppz(:)
    integer :: n, info_, iitype, iStep
    integer :: m, neig
    real(rsp) :: abstol
    logical :: wantz, upper
    character :: trans, range
    real(rsp) :: vl, vu
    integer :: il, iu
    logical :: subspace
    integer :: ii, jj
    character :: uploNew
    character(len=100) :: errorMsg

    character, parameter :: transNormal = "N"
# 738 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    character, parameter :: transAdjoint = "T"
    real(rsp), parameter :: one = 1.0_rsp
# 744 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    n = size(a, dim=1)







    subspace = (size(w) < n)
    if (subspace) then
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w, dim=1)
      end if
    else
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    allocate(isuppz(2 * n))
    allocate(tmpChole(size(a, dim=1)))

    wantz = (jobz == 'V' .or. jobz == 'v')
    upper = (uplo == 'U' .or. uplo == 'u')
    abstol = slamch('Safe minimum')
    if (subspace) then
      range = 'I'
    else
      range = 'A'
    end if

    errorGuard: block
      ! Determine the optimal workspace sizes
      iStep = 1
# 797 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyevr(jobz, range, uplo, n, a, size(a, dim=1), vl, vu, il, iu, abstol, m,&
          & w, b, size(b, dim=1), isuppz, workDummy, -1, iworkDummy, -1, info_)
# 803 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Form a Cholesky factorization of B.
      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 815 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call spotrf(uplo, n, b, n, info_)
      if (info_ /= 0) then
        info_ = n + info_
        exit errorGuard
      end if

      ! Transform problem to standard eigenvalue
      iStep = 3
      call ssygst(iitype, uplo, n, a, n, b, n, info_)
      if (info_ /= 0) exit errorGuard

      ! Solve standard eigenvalue problem
      iStep = 4
      if (wantz) then
        ! Save Cholesky factor in the other triangle of H and tmpChole
        do ii = 1, n
          tmpChole(ii) = b(ii, ii)
        end do
        if (upper) then
          do jj = 1, n
            do ii = jj+1, n
              a(ii, jj) =  b(jj, ii) 
            end do
          end do
        else
          do jj = 1, n
            do ii = 1, jj - 1
              a(ii, jj) =  b(jj, ii) 
            end do
          end do
        end if
      end if
# 848 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call ssyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, b, n,&
          & isuppz, work, workSize, iwork, iworkSize, info_)
# 854 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Backtransform eigenvectors to the original problem.
      iStep = 5
      if (wantz) then

        do ii = 1, n
          a(ii,ii) = tmpChole(ii)
        end do

        if (upper) then
          uploNew = 'L'
          upper = .false.
        else
          uploNew = 'U'
          upper = .true.
        end if

        neig = n
        if (iitype == 1 .or. iitype == 2) then
          ! For A*x=(lambda)*B*x and A*B*x=(lambda)*x;
          ! backtransform eigenvectors: x = inv(L)'*y or inv(U)*y          !'
          if (upper) then
            trans = transNormal
          else
            trans = transAdjoint
          end if
          call strsm('Left', uploNew, trans, 'Non-unit', n, neig, one, A, n, B, n)
        else if (iitype == 3) then
          ! For B*A*x=(lambda)*x;
          ! backtransform eigenvectors: x = L*y or U'*y     !'
          if (upper) then
            trans = transAdjoint
          else
            trans = transNormal
          end if
          call strmm('Left', uploNew, trans, 'Non-unit', n, neig, one, a, n, b, n)
        end if
        do ii = 1,m
          a(1:n, ii) = b(1:n, ii)
        end do
        a(1:n, m+1:n) = 0.0
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine ssyevr to determine optimum workspace"
    case (2)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine spotrf, unable to complete&
          & Cholesky factorization of B, info: ", info_
    case (3)
      write(errorMsg, "(a, i0)") "Failure in ssygst to transform to standard form,&
          & info: ", info_
    case (4)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine ssyevr to solve the&
          & eigenvalue, problem, info: ", info_
    end select
    call error(errorMsg)

  end subroutine hegvr_real

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for generalized symmetric matrix problem.
  !!
  !! Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !! only the first n eigenvalues/eigenvectors are found.
  !! This version re-uses a triangle of a matrix (saving an additional allocation that was in the
  !! previous version).
  !! Based in part on deMon routine from T. Heine
  subroutine hegvr_dreal(a, b, w, uplo, jobz, itype, ilIn, iuIn, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    real(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    real(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 722 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: tmpChole(:)
    integer, allocatable :: isuppz(:)
    integer :: n, info_, iitype, iStep
    integer :: m, neig
    real(rdp) :: abstol
    logical :: wantz, upper
    character :: trans, range
    real(rdp) :: vl, vu
    integer :: il, iu
    logical :: subspace
    integer :: ii, jj
    character :: uploNew
    character(len=100) :: errorMsg

    character, parameter :: transNormal = "N"
# 738 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    character, parameter :: transAdjoint = "T"
    real(rdp), parameter :: one = 1.0_rdp
# 744 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    n = size(a, dim=1)







    subspace = (size(w) < n)
    if (subspace) then
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w, dim=1)
      end if
    else
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    allocate(isuppz(2 * n))
    allocate(tmpChole(size(a, dim=1)))

    wantz = (jobz == 'V' .or. jobz == 'v')
    upper = (uplo == 'U' .or. uplo == 'u')
    abstol = dlamch('Safe minimum')
    if (subspace) then
      range = 'I'
    else
      range = 'A'
    end if

    errorGuard: block
      ! Determine the optimal workspace sizes
      iStep = 1
# 797 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyevr(jobz, range, uplo, n, a, size(a, dim=1), vl, vu, il, iu, abstol, m,&
          & w, b, size(b, dim=1), isuppz, workDummy, -1, iworkDummy, -1, info_)
# 803 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Form a Cholesky factorization of B.
      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 815 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dpotrf(uplo, n, b, n, info_)
      if (info_ /= 0) then
        info_ = n + info_
        exit errorGuard
      end if

      ! Transform problem to standard eigenvalue
      iStep = 3
      call dsygst(iitype, uplo, n, a, n, b, n, info_)
      if (info_ /= 0) exit errorGuard

      ! Solve standard eigenvalue problem
      iStep = 4
      if (wantz) then
        ! Save Cholesky factor in the other triangle of H and tmpChole
        do ii = 1, n
          tmpChole(ii) = b(ii, ii)
        end do
        if (upper) then
          do jj = 1, n
            do ii = jj+1, n
              a(ii, jj) =  b(jj, ii) 
            end do
          end do
        else
          do jj = 1, n
            do ii = 1, jj - 1
              a(ii, jj) =  b(jj, ii) 
            end do
          end do
        end if
      end if
# 848 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call dsyevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, b, n,&
          & isuppz, work, workSize, iwork, iworkSize, info_)
# 854 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Backtransform eigenvectors to the original problem.
      iStep = 5
      if (wantz) then

        do ii = 1, n
          a(ii,ii) = tmpChole(ii)
        end do

        if (upper) then
          uploNew = 'L'
          upper = .false.
        else
          uploNew = 'U'
          upper = .true.
        end if

        neig = n
        if (iitype == 1 .or. iitype == 2) then
          ! For A*x=(lambda)*B*x and A*B*x=(lambda)*x;
          ! backtransform eigenvectors: x = inv(L)'*y or inv(U)*y          !'
          if (upper) then
            trans = transNormal
          else
            trans = transAdjoint
          end if
          call dtrsm('Left', uploNew, trans, 'Non-unit', n, neig, one, A, n, B, n)
        else if (iitype == 3) then
          ! For B*A*x=(lambda)*x;
          ! backtransform eigenvectors: x = L*y or U'*y     !'
          if (upper) then
            trans = transAdjoint
          else
            trans = transNormal
          end if
          call dtrmm('Left', uploNew, trans, 'Non-unit', n, neig, one, a, n, b, n)
        end if
        do ii = 1,m
          a(1:n, ii) = b(1:n, ii)
        end do
        a(1:n, m+1:n) = 0.0
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine dsyevr to determine optimum workspace"
    case (2)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine dpotrf, unable to complete&
          & Cholesky factorization of B, info: ", info_
    case (3)
      write(errorMsg, "(a, i0)") "Failure in dsygst to transform to standard form,&
          & info: ", info_
    case (4)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine dsyevr to solve the&
          & eigenvalue, problem, info: ", info_
    end select
    call error(errorMsg)

  end subroutine hegvr_dreal

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for generalized symmetric matrix problem.
  !!
  !! Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !! only the first n eigenvalues/eigenvectors are found.
  !! This version re-uses a triangle of a matrix (saving an additional allocation that was in the
  !! previous version).
  !! Based in part on deMon routine from T. Heine
  subroutine hegvr_complex(a, b, w, uplo, jobz, itype, ilIn, iuIn, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    complex(rsp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rsp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rsp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rsp), allocatable :: work(:)
    complex(rsp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 718 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rsp), allocatable :: rwork(:)
    real(rsp) :: rworkDummy(1)
    integer :: rworkSize
# 722 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    complex(rsp), allocatable :: tmpChole(:)
    integer, allocatable :: isuppz(:)
    integer :: n, info_, iitype, iStep
    integer :: m, neig
    real(rsp) :: abstol
    logical :: wantz, upper
    character :: trans, range
    real(rsp) :: vl, vu
    integer :: il, iu
    logical :: subspace
    integer :: ii, jj
    character :: uploNew
    character(len=100) :: errorMsg

    character, parameter :: transNormal = "N"
# 741 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    character, parameter :: transAdjoint = "C"
    complex(rsp), parameter :: one =  (1.0_rsp, 0.0_rsp)
# 744 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    n = size(a, dim=1)







    subspace = (size(w) < n)
    if (subspace) then
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w, dim=1)
      end if
    else
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    allocate(isuppz(2 * n))
    allocate(tmpChole(size(a, dim=1)))

    wantz = (jobz == 'V' .or. jobz == 'v')
    upper = (uplo == 'U' .or. uplo == 'u')
    abstol = slamch('Safe minimum')
    if (subspace) then
      range = 'I'
    else
      range = 'A'
    end if

    errorGuard: block
      ! Determine the optimal workspace sizes
      iStep = 1
# 800 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cheevr(jobz, range, uplo, n, a, size(a, dim=1), vl, vu, il, iu, abstol, m,&
          & w, b, size(b, dim=1), isuppz, workDummy, -1, rworkDummy, -1, iworkDummy, -1, info_)
# 803 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Form a Cholesky factorization of B.
      iStep = 2
      workSize = nint(real(workDummy(1), kind=rsp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 812 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
# 815 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cpotrf(uplo, n, b, n, info_)
      if (info_ /= 0) then
        info_ = n + info_
        exit errorGuard
      end if

      ! Transform problem to standard eigenvalue
      iStep = 3
      call chegst(iitype, uplo, n, a, n, b, n, info_)
      if (info_ /= 0) exit errorGuard

      ! Solve standard eigenvalue problem
      iStep = 4
      if (wantz) then
        ! Save Cholesky factor in the other triangle of H and tmpChole
        do ii = 1, n
          tmpChole(ii) = b(ii, ii)
        end do
        if (upper) then
          do jj = 1, n
            do ii = jj+1, n
              a(ii, jj) =  conjg(b(jj, ii)) 
            end do
          end do
        else
          do jj = 1, n
            do ii = 1, jj - 1
              a(ii, jj) =  conjg(b(jj, ii)) 
            end do
          end do
        end if
      end if
# 851 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call cheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, b, n,&
          & isuppz, work, workSize, rwork, rworkSize, iwork, iworkSize, info_)
# 854 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Backtransform eigenvectors to the original problem.
      iStep = 5
      if (wantz) then

        do ii = 1, n
          a(ii,ii) = tmpChole(ii)
        end do

        if (upper) then
          uploNew = 'L'
          upper = .false.
        else
          uploNew = 'U'
          upper = .true.
        end if

        neig = n
        if (iitype == 1 .or. iitype == 2) then
          ! For A*x=(lambda)*B*x and A*B*x=(lambda)*x;
          ! backtransform eigenvectors: x = inv(L)'*y or inv(U)*y          !'
          if (upper) then
            trans = transNormal
          else
            trans = transAdjoint
          end if
          call ctrsm('Left', uploNew, trans, 'Non-unit', n, neig, one, A, n, B, n)
        else if (iitype == 3) then
          ! For B*A*x=(lambda)*x;
          ! backtransform eigenvectors: x = L*y or U'*y     !'
          if (upper) then
            trans = transAdjoint
          else
            trans = transNormal
          end if
          call ctrmm('Left', uploNew, trans, 'Non-unit', n, neig, one, a, n, b, n)
        end if
        do ii = 1,m
          a(1:n, ii) = b(1:n, ii)
        end do
        a(1:n, m+1:n) = 0.0
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine cheevr to determine optimum workspace"
    case (2)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine cpotrf, unable to complete&
          & Cholesky factorization of B, info: ", info_
    case (3)
      write(errorMsg, "(a, i0)") "Failure in chegst to transform to standard form,&
          & info: ", info_
    case (4)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine cheevr to solve the&
          & eigenvalue, problem, info: ", info_
    end select
    call error(errorMsg)

  end subroutine hegvr_complex

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> Relatively robust eigensolver for generalized symmetric matrix problem.
  !!
  !! Representation, optionally use the subspace form if w is smaller than the size of a and b, then
  !! only the first n eigenvalues/eigenvectors are found.
  !! This version re-uses a triangle of a matrix (saving an additional allocation that was in the
  !! previous version).
  !! Based in part on deMon routine from T. Heine
  subroutine hegvr_dcomplex(a, b, w, uplo, jobz, itype, ilIn, iuIn, info)

    !> contains the matrix for the solver, returns eigenvectors if requested (matrix always
    !! overwritten on return anyway)
    complex(rdp), intent(inout) :: a(:,:)

    !> contains the second matrix for the solver (overwritten by Cholesky factorization)
    complex(rdp), intent(inout) :: b(:,:)

    !> eigenvalues
    real(rdp), intent(out) :: w(:)

    !> upper or lower triangle of both matrices
    character, intent(in) :: uplo

    !> compute eigenvalues 'N' or eigenvalues and eigenvectors 'V'
    character, intent(in) :: jobz

    !> specifies the problem type to be solved 1:A*x=(lambda)*B*x, 2:A*B*x=(lambda)*x,
    !> 3:B*A*x=(lambda)*x default is 1
    integer, optional, intent(in) :: itype

    !> lower range of eigenstates
    integer, optional, intent(in) :: ilIn

    !> upper range of eigenstates
    integer, optional, intent(in) :: iuIn

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    complex(rdp), allocatable :: work(:)
    complex(rdp) :: workDummy(1)
    integer :: workSize
    integer, allocatable :: iwork(:)
    integer :: iworkDummy(1)
    integer :: iworkSize
# 718 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    real(rdp), allocatable :: rwork(:)
    real(rdp) :: rworkDummy(1)
    integer :: rworkSize
# 722 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    complex(rdp), allocatable :: tmpChole(:)
    integer, allocatable :: isuppz(:)
    integer :: n, info_, iitype, iStep
    integer :: m, neig
    real(rdp) :: abstol
    logical :: wantz, upper
    character :: trans, range
    real(rdp) :: vl, vu
    integer :: il, iu
    logical :: subspace
    integer :: ii, jj
    character :: uploNew
    character(len=100) :: errorMsg

    character, parameter :: transNormal = "N"
# 741 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
    character, parameter :: transAdjoint = "C"
    complex(rdp), parameter :: one =  (1.0_rdp, 0.0_rdp)
# 744 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

    n = size(a, dim=1)







    subspace = (size(w) < n)
    if (subspace) then
      if (present(ilIn)) then




        il = ilIn
        iu = iuIn
      else
        il = 1
        iu = size(w, dim=1)
      end if
    else
      if (present(ilIn)) then

      end if
      il = 1
      iu = n
    end if

    if (present(itype)) then
      iitype = itype
    else
      iitype = 1
    end if


    allocate(isuppz(2 * n))
    allocate(tmpChole(size(a, dim=1)))

    wantz = (jobz == 'V' .or. jobz == 'v')
    upper = (uplo == 'U' .or. uplo == 'u')
    abstol = dlamch('Safe minimum')
    if (subspace) then
      range = 'I'
    else
      range = 'A'
    end if

    errorGuard: block
      ! Determine the optimal workspace sizes
      iStep = 1
# 800 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zheevr(jobz, range, uplo, n, a, size(a, dim=1), vl, vu, il, iu, abstol, m,&
          & w, b, size(b, dim=1), isuppz, workDummy, -1, rworkDummy, -1, iworkDummy, -1, info_)
# 803 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Form a Cholesky factorization of B.
      iStep = 2
      workSize = nint(real(workDummy(1), kind=rdp))
      allocate(work(workSize))
      iworkSize = iworkDummy(1)
      allocate(iwork(iworkSize))
# 812 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      rworkSize = nint(rworkDummy(1))
      allocate(rwork(rworkSize))
# 815 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zpotrf(uplo, n, b, n, info_)
      if (info_ /= 0) then
        info_ = n + info_
        exit errorGuard
      end if

      ! Transform problem to standard eigenvalue
      iStep = 3
      call zhegst(iitype, uplo, n, a, n, b, n, info_)
      if (info_ /= 0) exit errorGuard

      ! Solve standard eigenvalue problem
      iStep = 4
      if (wantz) then
        ! Save Cholesky factor in the other triangle of H and tmpChole
        do ii = 1, n
          tmpChole(ii) = b(ii, ii)
        end do
        if (upper) then
          do jj = 1, n
            do ii = jj+1, n
              a(ii, jj) =  conjg(b(jj, ii)) 
            end do
          end do
        else
          do jj = 1, n
            do ii = 1, jj - 1
              a(ii, jj) =  conjg(b(jj, ii)) 
            end do
          end do
        end if
      end if
# 851 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      call zheevr(jobz, range, uplo, n, a, n, vl, vu, il, iu, abstol, m, w, b, n,&
          & isuppz, work, workSize, rwork, rworkSize, iwork, iworkSize, info_)
# 854 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"
      if (info_ /= 0) exit errorGuard

      ! Backtransform eigenvectors to the original problem.
      iStep = 5
      if (wantz) then

        do ii = 1, n
          a(ii,ii) = tmpChole(ii)
        end do

        if (upper) then
          uploNew = 'L'
          upper = .false.
        else
          uploNew = 'U'
          upper = .true.
        end if

        neig = n
        if (iitype == 1 .or. iitype == 2) then
          ! For A*x=(lambda)*B*x and A*B*x=(lambda)*x;
          ! backtransform eigenvectors: x = inv(L)'*y or inv(U)*y          !'
          if (upper) then
            trans = transNormal
          else
            trans = transAdjoint
          end if
          call ztrsm('Left', uploNew, trans, 'Non-unit', n, neig, one, A, n, B, n)
        else if (iitype == 3) then
          ! For B*A*x=(lambda)*x;
          ! backtransform eigenvectors: x = L*y or U'*y     !'
          if (upper) then
            trans = transAdjoint
          else
            trans = transNormal
          end if
          call ztrmm('Left', uploNew, trans, 'Non-unit', n, neig, one, a, n, b, n)
        end if
        do ii = 1,m
          a(1:n, ii) = b(1:n, ii)
        end do
        a(1:n, m+1:n) = 0.0
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine zheevr to determine optimum workspace"
    case (2)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine zpotrf, unable to complete&
          & Cholesky factorization of B, info: ", info_
    case (3)
      write(errorMsg, "(a, i0)") "Failure in zhegst to transform to standard form,&
          & info: ", info_
    case (4)
      write(errorMsg, "(a, i0)") "Failure in LAPACK routine zheevr to solve the&
          & eigenvalue, problem, info: ", info_
    end select
    call error(errorMsg)

  end subroutine hegvr_dcomplex

# 920 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 923 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR general matrix eigensolver
  subroutine geev_real(a, wr, wi, vl, vr, info)

    !> Matrix, overwritten on exit
    real(rsp), intent(inout) :: a(:,:)

    !> Real part of eigenvalues
    real(rsp), intent(out) :: wr(:)

    !> Imaginary part of eigenvalues
    real(rsp), intent(out) :: wi(:)

    !> Left eigenvectors
    real(rsp), intent(out), optional :: vl(:,:)

    !> Right eigenvectors
    real(rsp), intent(out), optional :: vr(:,:)

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rsp), allocatable :: work(:)
    real(rsp) :: workDummy(1)
    integer :: workSize
    integer :: n, lda, info_, ldvl, ldvr, iStep
    character :: jobvl, jobvr
    character(len=100) :: errorMsg

    ! If no eigenvectors requested, need a dummy array for lapack call
    real(rsp) :: dummyvl(1,1), dummyvr(1,1)

    lda = size(a, dim=1)
    n = size(a, dim=2)





    if (present(vl)) then
      jobvl = 'V'
      ldvl = size(vl, dim=1)

    else
      jobvl = 'N'
      ldvl = 1
    end if
    if (present(vr)) then
      jobvr = 'V'
      ldvr = size(vr, dim=1)

    else
      jobvr = 'N'
      ldvr = 1
    end if

    errorGuard: block
      iStep = 1
      if (jobvl == 'V' .and. jobvr == 'V') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'V' .and. jobvr == 'N') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, dummyvr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'N' .and. jobvr == 'V') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, vr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'N' .and. jobvr == 'N') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, dummyvr, ldvr,&
            & workDummy, -1, info_)
      end if
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(workDummy(1))
      allocate(work(workSize))
      if (jobvl == 'V' .and. jobvr == 'V') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'V' .and. jobvr == 'N') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, dummyvr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'N' .and. jobvr == 'V') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, vr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'N' .and. jobvr == 'N') then
        call sgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, dummyvr, ldvr,&
            & work, workSize, info_)
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine sgeev to determine optimum workspace"
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in diagonalisation routine sgeev, illegal&
            & argument at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in diagonalisation routine sgeev,&
            & QR algorithm failed to calculate ", info_, " eigenvalues."
      end if
    end select
    call error(errorMsg)

  end subroutine geev_real

# 923 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

  !> QR general matrix eigensolver
  subroutine geev_dreal(a, wr, wi, vl, vr, info)

    !> Matrix, overwritten on exit
    real(rdp), intent(inout) :: a(:,:)

    !> Real part of eigenvalues
    real(rdp), intent(out) :: wr(:)

    !> Imaginary part of eigenvalues
    real(rdp), intent(out) :: wi(:)

    !> Left eigenvectors
    real(rdp), intent(out), optional :: vl(:,:)

    !> Right eigenvectors
    real(rdp), intent(out), optional :: vr(:,:)

    !> if present and info/=0 job is to be terminated by the calling routine
    integer, optional, intent(out) :: info

    real(rdp), allocatable :: work(:)
    real(rdp) :: workDummy(1)
    integer :: workSize
    integer :: n, lda, info_, ldvl, ldvr, iStep
    character :: jobvl, jobvr
    character(len=100) :: errorMsg

    ! If no eigenvectors requested, need a dummy array for lapack call
    real(rdp) :: dummyvl(1,1), dummyvr(1,1)

    lda = size(a, dim=1)
    n = size(a, dim=2)





    if (present(vl)) then
      jobvl = 'V'
      ldvl = size(vl, dim=1)

    else
      jobvl = 'N'
      ldvl = 1
    end if
    if (present(vr)) then
      jobvr = 'V'
      ldvr = size(vr, dim=1)

    else
      jobvr = 'N'
      ldvr = 1
    end if

    errorGuard: block
      iStep = 1
      if (jobvl == 'V' .and. jobvr == 'V') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'V' .and. jobvr == 'N') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, dummyvr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'N' .and. jobvr == 'V') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, vr, ldvr,&
            & workDummy, -1, info_)
      else if (jobvl == 'N' .and. jobvr == 'N') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, dummyvr, ldvr,&
            & workDummy, -1, info_)
      end if
      if (info_ /= 0) exit errorGuard

      iStep = 2
      workSize = nint(workDummy(1))
      allocate(work(workSize))
      if (jobvl == 'V' .and. jobvr == 'V') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'V' .and. jobvr == 'N') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, dummyvr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'N' .and. jobvr == 'V') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, vr, ldvr, work,&
            & workSize, info_)
      else if (jobvl == 'N' .and. jobvr == 'N') then
        call dgeev(jobvl, jobvr, n, a, lda, wr, wi, dummyvl, ldvl, dummyvr, ldvr,&
            & work, workSize, info_)
      end if
    end block errorGuard

    if (present(info)) info = info_
    if (info_ == 0 .or. present(info)) return

    select case (iStep)
    case (1)
      errorMsg = "Failure in LAPACK routine dgeev to determine optimum workspace"
    case (2)
      if (info_ < 0) then
        write(errorMsg, "(a, i0)") "Failure in diagonalisation routine dgeev, illegal&
            & argument at position ", -info_
      else
        write(errorMsg, "(a, i0, a)") "Failure in diagonalisation routine dgeev,&
            & QR algorithm failed to calculate ", info_, " eigenvalues."
      end if
    end select
    call error(errorMsg)

  end subroutine geev_dreal

# 1034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"


# 1248 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/math/eigensolver.F90"

end module dftbp_math_eigensolver
