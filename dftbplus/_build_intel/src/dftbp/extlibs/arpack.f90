!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!





!> Interfaces for the ARPACK routines needed in DFTB+ (currently for the linear response excited
!> state calculations).
module dftbp_extlibs_arpack
  use dftbp_common_accuracy, only : rdp, rsp
  use dftbp_io_message, only : error
  implicit none

  private
  public :: withArpack, saupd, seupd
  public :: withParpack, psaupd, pseupd


  !> Whether code was built with ARPACK support
  logical, parameter :: withArpack = .false.

  !> Whether code was built with PARPACK support
  logical, parameter :: withParpack = .false.


  ! Function overloading to be used within DFTB+
  interface saupd
    module procedure ssaupd
    module procedure dsaupd
  end interface

  ! Function overloading to be used within DFTB+
  interface seupd
    module procedure sseupd
    module procedure dseupd
  end interface

  ! Function overloading to be used within DFTB+
  interface psaupd
    module procedure pssaupd
    module procedure pdsaupd
  end interface

  ! Function overloading to be used within DFTB+
  interface pseupd
    module procedure psseupd
    module procedure pdseupd
  end interface

  ! Interface definition of the routines
  interface

    !> Arnoldi solver call
    module subroutine ssaupd(ido, bmat, n, which, nev, tol, resid, ncv,&
        & v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(inout) :: ido
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      integer, intent(in) :: nev
      real(rsp), intent(in) :: tol
      real(rsp), intent(inout) :: resid(n)
      integer, intent(in) :: ncv
      integer, intent(in) :: ldv
      real(rsp), intent(out) :: v(ldv, ncv)
      integer, intent(inout) :: iparam(11)
      integer, intent(out) :: ipntr(11)
      real(rsp), intent(inout) :: workd(3 * n)
      integer, intent(in) :: lworkl
      real(rsp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine ssaupd

    module subroutine sseupd(rvec, howmny, sel, d, z, ldz, sigma, bmat,&
        & n, which, nev, tol, resid, ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      logical, intent(in) :: rvec
      character, intent(in) :: howmny
      integer, intent(in) :: ncv
      logical, intent(in) :: sel(ncv)
      integer, intent(in) :: nev
      real(rsp), intent(out) :: d(nev)
      integer, intent(in) :: ldz
      real(rsp), intent(out) :: z(ldz, nev)
      real(rsp), intent(in) :: sigma
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      real(rsp), intent(in) :: tol
      real(rsp), intent(in) :: resid(n)
      integer, intent(in) :: ldv
      real(rsp), intent(inout) :: v(ldv, ncv)
      integer, intent(in) :: iparam(7)
      integer, intent(inout) :: ipntr(11)
      real(rsp), intent(inout) :: workd(2 * n)
      integer, intent(in) :: lworkl
      real(rsp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine sseupd

    module subroutine pssaupd(comm, ido, bmat, n, which, nev, tol, resid,&
        & ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(in) :: comm
      integer, intent(inout) :: ido
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      integer, intent(in) :: nev
      real(rsp), intent(in) :: tol
      real(rsp), intent(inout) :: resid(n)
      integer, intent(in) :: ncv
      integer, intent(in) :: ldv
      real(rsp), intent(out) :: v(ldv, ncv)
      integer, intent(inout) :: iparam(11)
      integer, intent(out) :: ipntr(11)
      real(rsp), intent(inout) :: workd(3 * n)
      integer, intent(in) :: lworkl
      real(rsp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine pssaupd

    module subroutine psseupd(comm, rvec, howmny, sel, d, z, ldz, sigma,&
        & bmat, n, which, nev, tol, resid, ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(in) :: comm
      logical, intent(in) :: rvec
      character, intent(in) :: howmny
      integer, intent(in) :: ncv
      logical, intent(inout) :: sel(ncv)
      integer, intent(in) :: nev
      real(rsp), intent(out) :: d(nev)
      integer, intent(in) :: ldz
      real(rsp), intent(out) :: z(ldz, nev)
      real(rsp), intent(in) :: sigma
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      real(rsp), intent(in) :: tol
      real(rsp), intent(in) :: resid(n)
      integer, intent(in) :: ldv
      real(rsp), intent(inout) :: v(ldv, ncv)
      integer, intent(in) :: iparam(7)
      integer, intent(inout) :: ipntr(11)
      real(rsp), intent(inout) :: workd(2 * n)
      integer, intent(in) :: lworkl
      real(rsp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine psseupd


    !> Arnoldi solver call
    module subroutine dsaupd(ido, bmat, n, which, nev, tol, resid, ncv,&
        & v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(inout) :: ido
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      integer, intent(in) :: nev
      real(rdp), intent(in) :: tol
      real(rdp), intent(inout) :: resid(n)
      integer, intent(in) :: ncv
      integer, intent(in) :: ldv
      real(rdp), intent(out) :: v(ldv, ncv)
      integer, intent(inout) :: iparam(11)
      integer, intent(out) :: ipntr(11)
      real(rdp), intent(inout) :: workd(3 * n)
      integer, intent(in) :: lworkl
      real(rdp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine dsaupd

    module subroutine dseupd(rvec, howmny, sel, d, z, ldz, sigma, bmat,&
        & n, which, nev, tol, resid, ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      logical, intent(in) :: rvec
      character, intent(in) :: howmny
      integer, intent(in) :: ncv
      logical, intent(in) :: sel(ncv)
      integer, intent(in) :: nev
      real(rdp), intent(out) :: d(nev)
      integer, intent(in) :: ldz
      real(rdp), intent(out) :: z(ldz, nev)
      real(rdp), intent(in) :: sigma
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      real(rdp), intent(in) :: tol
      real(rdp), intent(in) :: resid(n)
      integer, intent(in) :: ldv
      real(rdp), intent(inout) :: v(ldv, ncv)
      integer, intent(in) :: iparam(7)
      integer, intent(inout) :: ipntr(11)
      real(rdp), intent(inout) :: workd(2 * n)
      integer, intent(in) :: lworkl
      real(rdp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine dseupd

    module subroutine pdsaupd(comm, ido, bmat, n, which, nev, tol, resid,&
        & ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(in) :: comm
      integer, intent(inout) :: ido
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      integer, intent(in) :: nev
      real(rdp), intent(in) :: tol
      real(rdp), intent(inout) :: resid(n)
      integer, intent(in) :: ncv
      integer, intent(in) :: ldv
      real(rdp), intent(out) :: v(ldv, ncv)
      integer, intent(inout) :: iparam(11)
      integer, intent(out) :: ipntr(11)
      real(rdp), intent(inout) :: workd(3 * n)
      integer, intent(in) :: lworkl
      real(rdp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine pdsaupd

    module subroutine pdseupd(comm, rvec, howmny, sel, d, z, ldz, sigma,&
        & bmat, n, which, nev, tol, resid, ncv, v, ldv, iparam, ipntr, workd, workl, lworkl, info)
      integer, intent(in) :: comm
      logical, intent(in) :: rvec
      character, intent(in) :: howmny
      integer, intent(in) :: ncv
      logical, intent(inout) :: sel(ncv)
      integer, intent(in) :: nev
      real(rdp), intent(out) :: d(nev)
      integer, intent(in) :: ldz
      real(rdp), intent(out) :: z(ldz, nev)
      real(rdp), intent(in) :: sigma
      character, intent(in) :: bmat
      integer, intent(in) :: n
      character(2), intent(in) :: which
      real(rdp), intent(in) :: tol
      real(rdp), intent(in) :: resid(n)
      integer, intent(in) :: ldv
      real(rdp), intent(inout) :: v(ldv, ncv)
      integer, intent(in) :: iparam(7)
      integer, intent(inout) :: ipntr(11)
      real(rdp), intent(inout) :: workd(2 * n)
      integer, intent(in) :: lworkl
      real(rdp), intent(inout) :: workl(lworkl)
      integer, intent(inout) :: info
    end subroutine pdseupd

  end interface

end module dftbp_extlibs_arpack



!> Defines stubs for ARPACK/PARPACK routines, in case the libraries are not present.
submodule (dftbp_extlibs_arpack) dftbp_extlibs_arpack_stubs
  use dftbp_io_message
  implicit none

contains


  module procedure ssaupd
    call stubError_("ssaupd", "ARPACK")
  end procedure

  module procedure sseupd
    call stubError_("sseupd", "ARPACK")
  end procedure

  module procedure pssaupd
    call stubError_("pssaupd", "PARPACK")
  end procedure

  module procedure psseupd
    call stubError_("psseupd", "PARPACK")
  end procedure


  module procedure dsaupd
    call stubError_("dsaupd", "ARPACK")
  end procedure

  module procedure dseupd
    call stubError_("dseupd", "ARPACK")
  end procedure

  module procedure pdsaupd
    call stubError_("pdsaupd", "PARPACK")
  end procedure

  module procedure pdseupd
    call stubError_("pdseupd", "PARPACK")
  end procedure



  !! Generates error message, if a stub was called
  subroutine stubError_(routineName, libraryName)
    character(*), intent(in) :: routineName, libraryName

    call error("Internal error: " // routineName // "() called in a build without " // libraryName&
        & // " suppport")

  end subroutine stubError_

end submodule dftbp_extlibs_arpack_stubs

