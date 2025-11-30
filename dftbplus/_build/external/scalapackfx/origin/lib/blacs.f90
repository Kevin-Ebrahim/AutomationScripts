# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

!> Interfaces to BLACS routines.
module blacs_module
  use scalapackfx_common_module
  implicit none
  private

  public :: blacs_pinfo, blacs_get, blacs_gridinfo, blacs_gridinit
  public :: blacs_barrier, blacs_exit, blacs_abort, blacs_pnum
  public :: gebs2d, gebr2d, gesd2d, gerv2d, gsum2d, gemr2d


  !> Performs 2d copy from data in matrix to another, potentially with different distribution
  !> patterns.
  !> See BLACS documentation for details.
  interface gemr2d
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    module procedure igemr2d
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    module procedure sgemr2d
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    module procedure dgemr2d
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    module procedure cgemr2d
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    module procedure zgemr2d
# 23 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gemr2d

  interface

    !> Returns the number of processes available for use.
    !! \see BLACS documentation for details.
    subroutine blacs_pinfo(id, nproc)
      integer, intent(out) :: id, nproc
    end subroutine blacs_pinfo

    !> Gets values that BLACS uses for internal defaults.
    !! \see BLACS documentation for details.
    subroutine blacs_get(ictxt, what, val)
      integer, intent(in) :: ictxt, what
      integer, intent(out) :: val
    end subroutine blacs_get

    !> Delivers information about the grid.
    !! \see BLACS documentation for details.
    subroutine blacs_gridinfo(ictxt, nprow, npcol, myrow, mycol)
      integer, intent(in) :: ictxt,nprow, npcol
      integer, intent(out) :: myrow, mycol
    end subroutine blacs_gridinfo

    !> Assigns available processes into BLACS process grid.
    !! \see BLACS documentation for details.
    subroutine blacs_gridinit(ictxt, order, nprow, npcol)
      integer, intent(inout) :: ictxt
      character, intent(in) :: order
      integer, intent(in) :: nprow, npcol
    end subroutine blacs_gridinit

    !> Creates a customized process grid.
    !! \see BLACS documentation for details.
    subroutine blacs_gridmap(ictxt, umap, ldumap, nprow, npcol)
      integer, intent(inout) :: ictxt
      integer, intent(in) :: ldumap
      integer, intent(in) :: umap(ldumap, *), nprow, npcol
    end subroutine blacs_gridmap

    !> Calls a barrier.
    !! \see BLACS documentation for details.
    subroutine blacs_barrier(ictxt, scope)
      integer, intent(in) :: ictxt
      character, intent(in) :: scope
    end subroutine blacs_barrier

    !> Exits blacs communicator.
    !! \see BLACS documentation for details.
    subroutine blacs_exit(cont)
      integer, intent(in) :: cont
    end subroutine blacs_exit

    !> Frees all BLACS contexts and releases all allocated memory.
    !! \see BLACS documentation for details.
    subroutine blacs_abort(ictxt, errornum)
      integer, intent(in) :: ictxt, errornum
    end subroutine blacs_abort

    !> Returns the system process number of the process in the process grid.
    !! \see BLACS documentation for details.
    function blacs_pnum(ictxt, prow, pcol) result(res)
      integer, intent(in) :: ictxt, prow, pcol
      integer :: res
    end function blacs_pnum

    !> Returns row and column of a process in the grid
    !! \see BLACS documentation for details.
    subroutine blacs_pcoord(ictxt, pnum, prow, pcol)
      integer, intent(in) :: ictxt, pnum
      integer, intent(out) :: prow, pcol
    end subroutine blacs_pcoord

  end interface

!##########################################################################
!##########################################################################
!##########################################################################

# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"


# 133 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"


# 147 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"


# 161 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"


# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"


!##########################################################################
!##########################################################################
!##########################################################################

  !> Wrapper around type specific ?gebs2d subroutines.
  !! \see BLACS documentation for details.
  interface gebs2d
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Starts broadcast for general rectangular matrix.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine igebs2d(ictxt, scope, top, mm, nn, aa, lda)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: aa(lda,*)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine igebs2d
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Starts broadcast for general rectangular matrix.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine sgebs2d(ictxt, scope, top, mm, nn, aa, lda)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(sp), intent(in) :: aa(lda,*)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine sgebs2d
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Starts broadcast for general rectangular matrix.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine dgebs2d(ictxt, scope, top, mm, nn, aa, lda)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(dp), intent(in) :: aa(lda,*)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine dgebs2d
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Starts broadcast for general rectangular matrix.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine cgebs2d(ictxt, scope, top, mm, nn, aa, lda)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(sp), intent(in) :: aa(lda,*)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine cgebs2d
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Starts broadcast for general rectangular matrix.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine zgebs2d(ictxt, scope, top, mm, nn, aa, lda)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(dp), intent(in) :: aa(lda,*)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine zgebs2d
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gebs2d

  !> Wrapper around type specific ?gebr2d subroutines.
  !! \see BLACS documentation for details.
  interface gebr2d
# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives broadcast for general rectangular matrix.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine igebr2d(ictxt, scope, top, mm, nn, aa, lda, rsrc, csrc)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(out) :: aa(lda,*)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rsrc, csrc
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine igebr2d
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives broadcast for general rectangular matrix.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine sgebr2d(ictxt, scope, top, mm, nn, aa, lda, rsrc, csrc)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(sp), intent(out) :: aa(lda,*)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rsrc, csrc
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine sgebr2d
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives broadcast for general rectangular matrix.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine dgebr2d(ictxt, scope, top, mm, nn, aa, lda, rsrc, csrc)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(dp), intent(out) :: aa(lda,*)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rsrc, csrc
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine dgebr2d
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives broadcast for general rectangular matrix.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine cgebr2d(ictxt, scope, top, mm, nn, aa, lda, rsrc, csrc)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(sp), intent(out) :: aa(lda,*)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rsrc, csrc
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine cgebr2d
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives broadcast for general rectangular matrix.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine zgebr2d(ictxt, scope, top, mm, nn, aa, lda, rsrc, csrc)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(dp), intent(out) :: aa(lda,*)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rsrc, csrc
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine zgebr2d
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gebr2d

  !> Wrapper around type specific ?gesd2d subroutines.
  !! \see BLACS documentation for details.
  interface gesd2d
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Sends general rectangular matrix to destination.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine igesd2d(ictxt, mm, nn, aa, lda, rdest, cdest)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rdest, cdest
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: aa(lda,*)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine igesd2d
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Sends general rectangular matrix to destination.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine sgesd2d(ictxt, mm, nn, aa, lda, rdest, cdest)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rdest, cdest
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(sp), intent(in) :: aa(lda,*)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine sgesd2d
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Sends general rectangular matrix to destination.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine dgesd2d(ictxt, mm, nn, aa, lda, rdest, cdest)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rdest, cdest
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(dp), intent(in) :: aa(lda,*)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine dgesd2d
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Sends general rectangular matrix to destination.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine cgesd2d(ictxt, mm, nn, aa, lda, rdest, cdest)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rdest, cdest
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(sp), intent(in) :: aa(lda,*)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine cgesd2d
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Sends general rectangular matrix to destination.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine zgesd2d(ictxt, mm, nn, aa, lda, rdest, cdest)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rdest, cdest
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(dp), intent(in) :: aa(lda,*)
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine zgesd2d
# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 212 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gesd2d

  !> Wrapper around type specific ?gerv2d subroutines.
  !! \see BLACS documentation for details.
  interface gerv2d
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives general rectangular matrix from process ($1).
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine igerv2d(ictxt, mm, nn, aa, lda, rsrc, csrc)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rsrc, csrc
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(out) :: aa(lda,*)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine igerv2d
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives general rectangular matrix from process ($1).
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine sgerv2d(ictxt, mm, nn, aa, lda, rsrc, csrc)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rsrc, csrc
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(sp), intent(out) :: aa(lda,*)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine sgerv2d
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives general rectangular matrix from process ($1).
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine dgerv2d(ictxt, mm, nn, aa, lda, rsrc, csrc)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rsrc, csrc
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(dp), intent(out) :: aa(lda,*)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine dgerv2d
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives general rectangular matrix from process ($1).
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine cgerv2d(ictxt, mm, nn, aa, lda, rsrc, csrc)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rsrc, csrc
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(sp), intent(out) :: aa(lda,*)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine cgerv2d
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Receives general rectangular matrix from process ($1).
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine zgerv2d(ictxt, mm, nn, aa, lda, rsrc, csrc)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt, mm, nn
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda, rsrc, csrc
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(dp), intent(out) :: aa(lda,*)
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine zgerv2d
# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 222 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gerv2d

  !> Wrapper around type specific ?gsum2d subroutines.
  !! \see BLACS documentation for details.
  interface gsum2d
# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 229 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Performs element-wise summation.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine igsum2d(ictxt, scope, top, mm, nn, aa, lda, rdest, cdest)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(inout) :: aa(lda,*)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rdest, cdest
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine igsum2d
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 229 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Performs element-wise summation.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine sgsum2d(ictxt, scope, top, mm, nn, aa, lda, rdest, cdest)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(sp), intent(inout) :: aa(lda,*)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rdest, cdest
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine sgsum2d
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 229 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Performs element-wise summation.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine dgsum2d(ictxt, scope, top, mm, nn, aa, lda, rdest, cdest)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      real(dp), intent(inout) :: aa(lda,*)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rdest, cdest
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine dgsum2d
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 229 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Performs element-wise summation.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine cgsum2d(ictxt, scope, top, mm, nn, aa, lda, rdest, cdest)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(sp), intent(inout) :: aa(lda,*)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rdest, cdest
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine cgsum2d
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 229 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !> Performs element-wise summation.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    !! \see BLACS documentation for details.
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    subroutine zgsum2d(ictxt, scope, top, mm, nn, aa, lda, rdest, cdest)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      import
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: ictxt
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      character, intent(in) :: scope, top
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: mm, nn
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: lda
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      complex(dp), intent(inout) :: aa(lda,*)
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
      integer, intent(in) :: rdest, cdest
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
    end subroutine zgsum2d
# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

# 232 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  end interface gsum2d

contains

# 237 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  !> Interface for i case of the p?gemr2d routine, explictly wrapped to work around the
  !> lack of assumed size in interfaces (Fortran2018)
  subroutine igemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
    integer, intent(in) :: mm, nn, ia, ja, ib, jb
    integer, intent(in) :: descA(DLEN_), descB(DLEN_)
    integer, intent(in) :: aa(:,:)
    integer, intent(inout) :: bb(:,:)
    integer, intent(in) :: ictxt
    external pigemr2d

    call pigemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)

  end subroutine igemr2d

# 237 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  !> Interface for s case of the p?gemr2d routine, explictly wrapped to work around the
  !> lack of assumed size in interfaces (Fortran2018)
  subroutine sgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
    integer, intent(in) :: mm, nn, ia, ja, ib, jb
    integer, intent(in) :: descA(DLEN_), descB(DLEN_)
    real(sp), intent(in) :: aa(:,:)
    real(sp), intent(inout) :: bb(:,:)
    integer, intent(in) :: ictxt
    external psgemr2d

    call psgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)

  end subroutine sgemr2d

# 237 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  !> Interface for d case of the p?gemr2d routine, explictly wrapped to work around the
  !> lack of assumed size in interfaces (Fortran2018)
  subroutine dgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
    integer, intent(in) :: mm, nn, ia, ja, ib, jb
    integer, intent(in) :: descA(DLEN_), descB(DLEN_)
    real(dp), intent(in) :: aa(:,:)
    real(dp), intent(inout) :: bb(:,:)
    integer, intent(in) :: ictxt
    external pdgemr2d

    call pdgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)

  end subroutine dgemr2d

# 237 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  !> Interface for c case of the p?gemr2d routine, explictly wrapped to work around the
  !> lack of assumed size in interfaces (Fortran2018)
  subroutine cgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
    integer, intent(in) :: mm, nn, ia, ja, ib, jb
    integer, intent(in) :: descA(DLEN_), descB(DLEN_)
    complex(sp), intent(in) :: aa(:,:)
    complex(sp), intent(inout) :: bb(:,:)
    integer, intent(in) :: ictxt
    external pcgemr2d

    call pcgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)

  end subroutine cgemr2d

# 237 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"
  !> Interface for z case of the p?gemr2d routine, explictly wrapped to work around the
  !> lack of assumed size in interfaces (Fortran2018)
  subroutine zgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
    integer, intent(in) :: mm, nn, ia, ja, ib, jb
    integer, intent(in) :: descA(DLEN_), descB(DLEN_)
    complex(dp), intent(in) :: aa(:,:)
    complex(dp), intent(inout) :: bb(:,:)
    integer, intent(in) :: ictxt
    external pzgemr2d

    call pzgemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)

  end subroutine zgemr2d

# 255 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacs.fpp"

end module blacs_module
