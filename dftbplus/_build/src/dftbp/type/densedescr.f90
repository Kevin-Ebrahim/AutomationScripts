# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90" 2

!> Module for square dense matrix specification
module dftbp_type_densedescr
# 13 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90"
  use dftbp_extlibs_scalapackfx, only : DLEN_
# 15 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90"
  implicit none

  private
  public :: TDenseDescr


  type :: TDenseDescr

# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90"
    !> BLACS specifier for the orbital sized matrix
    integer :: blacsOrbSqr(DLEN_)

    !> BLACS specifier for the reordered matrix
    integer :: blacsColumnSqr(DLEN_)

# 31 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/type/densedescr.F90"

    !> Dense matrix indexing by the start of orbitals for each atom.
    !>
    !> Note: for Pauli matrix it contains the indexing of the left upper block only
    !>
    integer, allocatable :: iAtomStart(:)

    !> Dimension of the matrix
    integer :: fullSize

    !> Nr. of atomic orbitals represented in the matrix.
    !>
    !> Equals to fullSize for normal matrices and fullSize / 2 for Pauli matrices
    !>
    integer :: nOrb

    !> Whether atomic matrix represents a two-component Pauli matrix.
    logical :: t2Component

  end type TDenseDescr

end module dftbp_type_densedescr
