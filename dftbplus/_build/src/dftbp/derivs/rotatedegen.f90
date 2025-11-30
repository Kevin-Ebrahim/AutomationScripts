# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90" 2

!> Module containing routines to make linear combinations of orbitals for degenerate perturbation
!! from a hermitian/symmetric matrix
module dftbp_derivs_rotatedegen
  use dftbp_common_accuracy, only : dp
  use dftbp_common_status, only : TStatus
  use dftbp_math_eigensolver, only : heev
  use dftbp_math_matrixops, only : makeSimilarityTrans
  use dftbp_type_wrappedintr, only : TwrappedCmplx2, TwrappedReal2
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  use dftbp_common_environment, only : TEnvironment
  use dftbp_extlibs_scalapackfx, only : linecomm
  use dftbp_type_densedescr, only : TDenseDescr
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  implicit none

  private
  public :: TRotateDegen, TRotateDegen_init

# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

  !> Data type for resolving degenerate orbitals in perturbation expressions
  type :: TRotateDegen
    private
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    !> Dense unitary matrix to transform orbitals
    complex(dp), allocatable :: CmplxU(:,:)

    !> Individual sub-blocks of unitary matrices to transform orbitals, if much smaller than U
    type(TwrappedCmplx2), allocatable :: CmplxUBlock(:)

# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    !> Dense unitary matrix to transform orbitals
    real(dp), allocatable :: RealU(:,:)

    !> Individual sub-blocks of unitary matrices to transform orbitals, if much smaller than U
    type(TwrappedReal2), allocatable :: RealUBlock(:)

# 43 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    !> Block ranges as needed in UBlock, deallocated again by time of return if dense U case
    integer, allocatable :: blockRange(:,:)

    !> To which group of states any particular one belongs
    integer, allocatable :: degenerateGroup(:)

    !> Numerical tolerance for deciding degeneracy
    real(dp) :: tolerance

    !> Sub-range of states to consider, if needed
    integer :: eiRange(2)

    !> Maximum fraction of total states in a single degenerate group before instead using dense
    !! transform on the whole matrix
    real(dp) :: maxDegenerateFraction

    !> Maximum number of states in a degenerate group before instead using dense transforms on the
    !! whole matrix
    integer :: maxDegenerateStates

    !> Should the order of states (derivatives) be reversed compared to the eigensolver return
    logical :: areEigvalsReversed = .false.

    ! redundant variables (could test from allocation status and size), but makes code simpler to
    ! read in a few places:

    !> Number of groups of degenerate orbitals
    integer :: nGrp = -1

    !> Order of matrix
    integer :: nOrb = -1

    !> Is it efficient to treat the full matrix, or sub-blocks
    logical :: isFullMatrixProcessed = .false.

  contains

    !> Generate unitary matrix for degenerate perturbation
    procedure :: generateCmplxUnitary
    procedure :: generateRealUnitary
    generic :: generateUnitary => generateCmplxUnitary, generateRealUnitary

# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    !> Are a pair of states in the same degenerate group?
    procedure :: isDegenerate

    !> Are any of the states degenerate?
    procedure :: isAnyDegenerate

    !> Release memory and cleans up
    procedure :: destroy

  end type TRotateDegen


contains

  !> Initialises instance and set some optional parameters
  subroutine TRotateDegen_init(self, tolerance, smallestBlock, smallestFraction, eiRange)

    !> Instance
    type(TRotateDegen), intent(inout) :: self

    !> Tolerance for degeneracy testing
    real(dp), intent(in), optional :: tolerance

    !> Smallest number of degenerate orbitals at which the dense algorithm should be used
    integer, intent(in), optional :: smallestBlock

    !> Smallest fraction of the matrix at which the dense algorithm should be used
    real, intent(in), optional :: smallestFraction

    !> Sub-range of states to consider, if needed, for example for metallic finite temperature in
    !! parallel gauge when only partially filed states would be included
    integer, intent(in), optional :: eiRange(2)

    if (present(smallestBlock)) then
      self%maxDegenerateStates = smallestBlock
    else
      self%maxDegenerateStates = 500
    end if

    if (present(smallestFraction)) then
      self%maxDegenerateFraction = smallestFraction
    else
      self%maxDegenerateFraction = 0.25_dp
    end if

    ! Tolerance for degeneracy detection
    if (present(tolerance)) then
      self%tolerance = tolerance
    else
      ! a few times eps, just in case of minor symmetry breaking
      self%tolerance = 128.0_dp * epsilon(0.0_dp)
    end if

    if (present(eiRange)) then
      self%eiRange(:) = eiRange
    else
      self%eiRange(:) = -1
    end if

  end subroutine TRotateDegen_init


# 162 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

# 164 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

  !> Set up unitary transformation of matrix for degenerate states, producing combinations that are
  !! orthogonal under the action of the matrix. This is the complex case.
  subroutine generateCmplxUnitary(self, env, matrixToProcess, ei, eigVecs, denseDesc,&
      & areVectorsTransformed, errStatus)

    !> Instance
    class(TRotateDegen), intent(inout) :: self

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Matrix elements between (potentially degenerate) orbitals
    complex(dp), intent(in) :: matrixToProcess(:,:)

    !> Eigenvalues of local block of degenerate matrix
    real(dp), intent(in) :: ei(:)

    !> Eigenvectors for rotation
    complex(dp), intent(inout) :: eigVecs(:,:)

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Are and vectors from degenerate eigenvalues, so transformed
    logical, intent(out) :: areVectorsTransformed

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    integer :: eiRange(2), maxRange, nInBlock, iGrp, iEnd, iStart, iGet
    type(linecomm) :: communicator
    complex(dp), allocatable :: localMatrix(:,:), localMatrixCols(:,:)
    real(dp), allocatable :: eigenvals(:)

# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
    real(dp), parameter :: one = (1.0_dp, 0.0_dp)
    real(dp), parameter :: zero = (0.0_dp, 0.0_dp)
# 206 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    self%nOrb = size(ei)
    if (all(self%eiRange == [-1,-1] )) then
      eiRange(:) = [1, self%nOrb]
    else
      eiRange(:) = self%eiRange
    end if

    if (allocated(self%blockRange)) then
      if (any(shape(self%blockRange) /= [2, self%nOrb])) then
        deallocate(self%blockRange)
      end if
    end if
    if (.not.allocated(self%blockRange)) then
      allocate(self%blockRange(2, self%nOrb))
    end if
    self%blockRange(:,:) = 0
    if (allocated(self%degenerateGroup)) then
      if (size(self%degenerateGroup) /= self%nOrb) then
        deallocate(self%degenerateGroup)
      end if
    end if
    if (.not.allocated(self%degenerateGroup)) then
      allocate(self%degenerateGroup(self%nOrb))
    end if

    call degeneracyRanges_(self%blockRange, self%nGrp, Ei, errStatus, self%tolerance, eiRange,&
        & self%degenerateGroup)
  if (errStatus%hasError()) then
# 234 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
    return
# 234 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  end if

    maxRange = maxval(self%blockRange(2,:self%nGrp) - self%blockRange(1,:self%nGrp)) + 1

    if (maxRange > self%maxDegenerateStates) then
  call errStatus%setError(-1, "Degenerate group exceeds reasonable size for one node to process",&
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      & "src/dftbp/derivs/rotatedegen.F90", 239)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  return
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      ! should add a dense case to cope with this -- blank out non-degenerate elements, diagonalise
      ! whole matrix and then use pgemm with eigenvectors
    end if

    allocate(eigenvals(maxRange))

    if (maxRange == 1) then
      areVectorsTransformed = .false.
      return
    end if
    areVectorsTransformed = .true.

    call communicator%init(env%blacs%orbitalGrid, denseDesc%blacsOrbSqr, "c")

    allocate(localMatrixCols(self%nOrb, maxRange))
    allocate(localMatrix(maxRange, maxRange))
    localMatrixCols(:,:) = 0.0_dp
    localMatrix(:,:) = 0.0_dp

    do iGrp = 1, self%nGrp
      iStart = self%blockRange(1,iGrp)
      iEnd = self%blockRange(2,iGrp)
      nInBlock = iEnd - iStart + 1
      if (nInBlock == 1) then
        cycle
      end if
      localMatrix(:,:) = 0.0_dp
      do iGet = iStart, iEnd

        if (env%mpi%tGroupLead) then

          call communicator%getline_lead(env%blacs%orbitalGrid, iGet, matrixToProcess,&
              & localMatrixCols(:,iGet-iStart+1))

          localMatrix(:iEnd-iStart+1,iGet-iStart+1) = localMatrixCols(iStart:iEnd,iGet-iStart+1)

          ! now get eigenvectors into this structure
          call communicator%getline_lead(env%blacs%orbitalGrid, iGet, eigvecs,&
              & localMatrixCols(:,iGet-iStart+1))

        else

          ! send matrix rows
          call communicator%getline_follow(env%blacs%orbitalGrid, iGet, matrixToProcess)

          ! send eigenvectors
          call communicator%getline_follow(env%blacs%orbitalGrid, iGet, eigvecs)

        end if

      end do

      if (env%mpi%tGroupLead) then
        call heev(localMatrix(:nInBlock, :nInBlock), eigenvals(:nInBlock), 'L', 'V')

        if (self%areEigvalsReversed) then
          localMatrix(:nInBlock, :nInBlock) = localMatrix(:nInBlock, nInBlock:1:-1)
        end if

        localMatrixCols(:,:nInBlock) = matmul(localMatrixCols(:,:nInBlock),&
            & localMatrix(:nInBlock, :nInBlock))
      end if



      do iGet = iStart, iEnd

        if (env%mpi%tGroupLead) then

          ! now send transformed eigenvectors back
          call communicator%setline_lead(env%blacs%orbitalGrid, iGet,&
              & localMatrixCols(:,iGet-iStart+1), eigvecs)

        else

          ! set relevant eigenvectors to the transformed ones
          call communicator%setline_follow(env%blacs%orbitalGrid, iGet, eigvecs)

        end if

      end do

    end do

  end subroutine generateCmplxUnitary

# 164 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

  !> Set up unitary transformation of matrix for degenerate states, producing combinations that are
  !! orthogonal under the action of the matrix. This is the real case.
  subroutine generateRealUnitary(self, env, matrixToProcess, ei, eigVecs, denseDesc,&
      & areVectorsTransformed, errStatus)

    !> Instance
    class(TRotateDegen), intent(inout) :: self

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Matrix elements between (potentially degenerate) orbitals
    real(dp), intent(in) :: matrixToProcess(:,:)

    !> Eigenvalues of local block of degenerate matrix
    real(dp), intent(in) :: ei(:)

    !> Eigenvectors for rotation
    real(dp), intent(inout) :: eigVecs(:,:)

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Are and vectors from degenerate eigenvalues, so transformed
    logical, intent(out) :: areVectorsTransformed

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    integer :: eiRange(2), maxRange, nInBlock, iGrp, iEnd, iStart, iGet
    type(linecomm) :: communicator
    real(dp), allocatable :: localMatrix(:,:), localMatrixCols(:,:)
    real(dp), allocatable :: eigenvals(:)

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
    real(dp), parameter :: one = 1.0_dp
    real(dp), parameter :: zero = 0.0_dp
# 206 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    self%nOrb = size(ei)
    if (all(self%eiRange == [-1,-1] )) then
      eiRange(:) = [1, self%nOrb]
    else
      eiRange(:) = self%eiRange
    end if

    if (allocated(self%blockRange)) then
      if (any(shape(self%blockRange) /= [2, self%nOrb])) then
        deallocate(self%blockRange)
      end if
    end if
    if (.not.allocated(self%blockRange)) then
      allocate(self%blockRange(2, self%nOrb))
    end if
    self%blockRange(:,:) = 0
    if (allocated(self%degenerateGroup)) then
      if (size(self%degenerateGroup) /= self%nOrb) then
        deallocate(self%degenerateGroup)
      end if
    end if
    if (.not.allocated(self%degenerateGroup)) then
      allocate(self%degenerateGroup(self%nOrb))
    end if

    call degeneracyRanges_(self%blockRange, self%nGrp, Ei, errStatus, self%tolerance, eiRange,&
        & self%degenerateGroup)
  if (errStatus%hasError()) then
# 234 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
    return
# 234 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  end if

    maxRange = maxval(self%blockRange(2,:self%nGrp) - self%blockRange(1,:self%nGrp)) + 1

    if (maxRange > self%maxDegenerateStates) then
  call errStatus%setError(-1, "Degenerate group exceeds reasonable size for one node to process",&
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      & "src/dftbp/derivs/rotatedegen.F90", 239)
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  return
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      ! should add a dense case to cope with this -- blank out non-degenerate elements, diagonalise
      ! whole matrix and then use pgemm with eigenvectors
    end if

    allocate(eigenvals(maxRange))

    if (maxRange == 1) then
      areVectorsTransformed = .false.
      return
    end if
    areVectorsTransformed = .true.

    call communicator%init(env%blacs%orbitalGrid, denseDesc%blacsOrbSqr, "c")

    allocate(localMatrixCols(self%nOrb, maxRange))
    allocate(localMatrix(maxRange, maxRange))
    localMatrixCols(:,:) = 0.0_dp
    localMatrix(:,:) = 0.0_dp

    do iGrp = 1, self%nGrp
      iStart = self%blockRange(1,iGrp)
      iEnd = self%blockRange(2,iGrp)
      nInBlock = iEnd - iStart + 1
      if (nInBlock == 1) then
        cycle
      end if
      localMatrix(:,:) = 0.0_dp
      do iGet = iStart, iEnd

        if (env%mpi%tGroupLead) then

          call communicator%getline_lead(env%blacs%orbitalGrid, iGet, matrixToProcess,&
              & localMatrixCols(:,iGet-iStart+1))

          localMatrix(:iEnd-iStart+1,iGet-iStart+1) = localMatrixCols(iStart:iEnd,iGet-iStart+1)

          ! now get eigenvectors into this structure
          call communicator%getline_lead(env%blacs%orbitalGrid, iGet, eigvecs,&
              & localMatrixCols(:,iGet-iStart+1))

        else

          ! send matrix rows
          call communicator%getline_follow(env%blacs%orbitalGrid, iGet, matrixToProcess)

          ! send eigenvectors
          call communicator%getline_follow(env%blacs%orbitalGrid, iGet, eigvecs)

        end if

      end do

      if (env%mpi%tGroupLead) then
        call heev(localMatrix(:nInBlock, :nInBlock), eigenvals(:nInBlock), 'L', 'V')

        if (self%areEigvalsReversed) then
          localMatrix(:nInBlock, :nInBlock) = localMatrix(:nInBlock, nInBlock:1:-1)
        end if

        localMatrixCols(:,:nInBlock) = matmul(localMatrixCols(:,:nInBlock),&
            & localMatrix(:nInBlock, :nInBlock))
      end if



      do iGet = iStart, iEnd

        if (env%mpi%tGroupLead) then

          ! now send transformed eigenvectors back
          call communicator%setline_lead(env%blacs%orbitalGrid, iGet,&
              & localMatrixCols(:,iGet-iStart+1), eigvecs)

        else

          ! set relevant eigenvectors to the transformed ones
          call communicator%setline_follow(env%blacs%orbitalGrid, iGet, eigvecs)

        end if

      end do

    end do

  end subroutine generateRealUnitary

# 328 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

# 599 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

  !> Clean up structure
  subroutine destroy(self)

    !> Instance
    class(TRotateDegen), intent(inout) :: self

    integer :: iGrp

    if (allocated(self%blockRange)) then
      deallocate(self%blockRange)
    end if
    if (allocated(self%degenerateGroup)) then
      deallocate(self%degenerateGroup)
    end if

    if (self%isFullMatrixProcessed) then

# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      if (allocated(self%CmplxU)) then
        deallocate(self%CmplxU)
      end if
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      if (allocated(self%RealU)) then
        deallocate(self%RealU)
      end if
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    else

# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      if (allocated(self%CmplxUBlock)) then
        do iGrp = 1, size(self%CmplxUBlock)
          deallocate(self%CmplxUBlock(iGrp)%data)
        end do
        deallocate(self%CmplxUBlock)
      end if
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
      if (allocated(self%RealUBlock)) then
        do iGrp = 1, size(self%RealUBlock)
          deallocate(self%RealUBlock(iGrp)%data)
        end do
        deallocate(self%RealUBlock)
      end if
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"

    end if

  end subroutine destroy


  !> Returns whether states are in the same degenerate group
  pure function isDegenerate(self, ii, jj)

    !> Instance
    class(TRotateDegen), intent(in) :: self

    !> First state
    integer, intent(in) :: ii

    !> Second state
    integer, intent(in) :: jj

    !> Resulting test
    logical :: isDegenerate

    isDegenerate = (self%degenerateGroup(ii) == self%degenerateGroup(jj))

  end function isDegenerate


  !> Returns whether any states are degenerate
  pure function isAnyDegenerate(self, ei)

    !> Instance
    class(TRotateDegen), intent(in) :: self

    !> Eigenvalues for degeneracy testing
    real(dp), intent(in) :: ei(:)

    !> Resulting test
    logical :: isAnyDegenerate

    integer :: ii, nOrb, eiRange(2)

    nOrb = size(ei)
    if (all(self%eiRange == [-1,-1] )) then
      eiRange(:) = [1, nOrb]
    else
      eiRange(:) = self%eiRange
    end if

    isAnyDegenerate = .false.
    do ii = eiRange(1)+1, eiRange(2)
      ! assumes sorted:
      if ( ei(ii) - ei(ii-1) < self%tolerance) then
        isAnyDegenerate = .true.
        return
      end if
    end do

  end function isAnyDegenerate


  ! Internal routines


  !> Find which groups of eigenvales are degenerate to within a tolerance
  !! Note, similar process is used in Casida excited state calculations, so should spin off as its
  !! own module at some point
  subroutine degeneracyRanges_(blockRange, nGrp, Ei, errStatus, tol, eiRange, grpMembership)

    !> Index array for lower and upper states in degenerate group
    integer, intent(out) :: blockRange(:,:)

    !> Number of degenerate groups
    integer, intent(out) :: nGrp

    !> Eigenvalues for degeneracy testing
    real(dp), intent(in) :: ei(:)

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    !> Tolerance for degeneracy testing
    real(dp), intent(in), optional :: tol

    !> Sub range of eigenvalues to process
    integer, intent(in), optional :: eiRange(2)

    integer, intent(out), optional :: grpMembership(:)

    integer :: ii, jj, nOrb, iStart, iEnd
    real(dp) :: localTol

    if (present(tol)) then
      localTol = tol
    else
      ! a few times eps, just in case of minor symmetry breaking
      localTol = 128.0_dp * epsilon(0.0_dp)
    end if
    nOrb = size(ei)
    blockRange(:,:) = 0
    nGrp = 0

    if (present(eiRange)) then
      ! set states before group as not of interest
      iStart = eiRange(1)
      iEnd = eiRange(2)
      if (iStart == iEnd) then
  call errStatus%setError(-1, "Degeneracy range is itself degenerate, should not be here", "src/dftbp/derivs/rotatedegen.F90", 738)
# 738 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/rotatedegen.F90"
  return
      end if
      do ii = 1, iStart - 1
        blockRange(:, ii) = ii
      end do
    else
      iStart = 1
      iEnd = nOrb
    end if
    nGrp = nGrp + iStart - 1

    do ii = 1, nGrp
      grpMembership(ii) = ii
    end do

    ii = iStart
    do while (ii <= iEnd)
      nGrp = nGrp + 1
      blockRange(1, nGrp) = ii
      grpMembership(ii) = nGrp
      do jj = ii + 1, iEnd
        ! assumes sorted:
        if ( ei(jj) - ei(jj-1) > localTol) then
          exit
        end if
        grpMembership(jj) = nGrp
      end do
      ii = jj
      blockRange(2, nGrp) = jj - 1
    end do

    if (present(eiRange)) then
      ! set states after range as not of interest
      do ii = iEnd + 1, nOrb
        nGrp = nGrp + 1
        blockRange(:, nGrp) = ii
        grpMembership(ii) = nGrp
      end do
    end if

  end subroutine degeneracyRanges_

end module dftbp_derivs_rotatedegen
