# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dense.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/dftb/dense.F90" 2

!> Contains subroutines for the dense matrix representation
module dftbp_dftb_dense
  use dftbp_type_commontypes, only : TOrbitals
  implicit none

  private
  public :: buildSquaredAtomIndex, getDescriptor

contains

  !> Builds an atom offset array for the squared hamiltonain/overlap.
  subroutine buildSquaredAtomIndex(iAtomStart, orb)

    !> Returns the offset array for each atom.
    integer, intent(out) :: iAtomStart(:)

    !> Information about the orbitals in the system.
    type(TOrbitals), intent(in) :: orb

    integer :: ind, iAt1
    integer :: nAtom

    nAtom = size(orb%nOrbAtom)



    ind = 1
    do iAt1 = 1, nAtom
      iAtomStart(iAt1) = ind
      ind = ind + orb%nOrbAtom(iAt1)
    end do
    iAtomStart(nAtom+1) = ind

  end subroutine buildSquaredAtomIndex


  !> Finds location of relevant atomic block indices in a dense matrix.
  pure function getDescriptor(iAt, iSquare) result(desc)

    !> Relevant atom
    integer, intent(in) :: iAt

    !> Indexing array for start of atom orbitals
    integer, intent(in) :: iSquare(:)

    !> Resulting location ranges
    integer :: desc(3)

    desc(:) = [iSquare(iAt), iSquare(iAt + 1) - 1, iSquare(iAt + 1) - iSquare(iAt)]

  end function getDescriptor

end module dftbp_dftb_dense
