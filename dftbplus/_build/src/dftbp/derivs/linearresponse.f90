# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90" 2

!> Module for linear response calculations
module dftbp_derivs_linearresponse
  use dftbp_common_accuracy, only : dp
  use dftbp_common_environment, only : TEnvironment
  use dftbp_common_status, only : TStatus
  use dftbp_derivs_fermihelper, only : deltamn, invDiff, theta
  use dftbp_derivs_rotatedegen, only : TRotateDegen
  use dftbp_dftb_hybridxc, only : THybridXcFunc
  use dftbp_dftb_periodic, only : TNeighbourList
  use dftbp_type_commontypes, only : TOrbitals
  use dftbp_type_densedescr, only : TDenseDescr
  use dftbp_type_parallelks, only : TParallelKS
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  use dftbp_dftb_sparse2dense, only : packRhoCplxBlacs, packRhoHelicalCplxBlacs,&
      & packRhoHelicalRealBlacs, packRhoPauliBlacs, packRhoRealBlacs, unpackHPauliBlacs,&
      & unpackHSCplxBlacs, unpackHSHelicalCplxBlacs, unpackHSHelicalRealBlacs, unpackHSRealBlacs
  use dftbp_extlibs_scalapackfx, only : CSRC_, DLEN_, MB_, NB_, pblasfx_pgemm, pblasfx_phemm,&
      & pblasfx_psymm, pblasfx_ptran, pblasfx_ptranc, RSRC_, scalafx_indxl2g
# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  implicit none

  private
  public :: dRhoReal, dRhoFermiChangeReal
  public :: dRhoCmplx, dRhoFermiChangeCmplx
  public :: dRhoPauli, dRhoFermiChangePauli

  !> Internal interface to evaluate |ci>H<cj|/(ei-ej)
  interface weightMatrix
    module procedure static_RR_weight
    module procedure static_CC_weight
    module procedure dynamic_RC_weight
    module procedure dynamic_CC_weight
  end interface weightMatrix


contains

  !> Calculate the derivative of density matrix from derivative of hamiltonian at q=0, k=0
  subroutine dRhoReal(env, dHam, dOver, neighbourList, nNeighbourSK, iSparseStart, img2CentCell,&
      & denseDesc, iKS, parallelKS, nFilled, nEmpty, eigVecsReal, eCiReal, eigVals, filling, Ef,&
      & tempElec, orb, dRhoSparse, dRhoSqr, hybridXc, over, nNeighbourCam, degenTransform, species,&
      & dEi, dPsi, coord, errStatus, omega, isHelical, eta, maxFill)

    !> Environment settings
    type(TEnvironment), intent(inout) :: env

    !> Derivative of the hamiltonian
    real(dp), intent(in) :: dHam(:,:)

    !> Derivative of the overlap, if relevant
    real(dp), intent(in), allocatable :: dOver(:)

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Particular spin/k-point
    integer, intent(in) :: iKS

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Ground state eigenvectors
    real(dp), intent(in) :: eigVecsReal(:,:,:)

    !> Eigenvalue weighted eigenvectors
    real(dp), intent(in), allocatable :: eCiReal(:,:,:)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Filling of unperturbed ground state
    real(dp), intent(in) :: filling(:,:,:)

    !> Fermi level(s)
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:, :)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Returning dRhoSparse on exit
    real(dp), intent(out) :: dRhoSparse(:)

    !> Derivative of rho as a square matrix, if needed
    real(dp), pointer :: dRhoSqr(:,:,:)

    !> Data for range-separated calculation
    class(THybridXcFunc), allocatable, intent(inout) :: hybridXc

    !> Sparse overlap matrix
    real(dp), intent(in) :: over(:)

    !> Number of neighbours for each of the atoms for the exchange contributions of CAM functionals
    integer, intent(in), allocatable :: nNeighbourCam(:)

    !> Transformation structure for degenerate orbitals
    type(TRotateDegen), intent(inout) :: degenTransform

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Derivative of single particle eigenvalues
    real(dp), allocatable, intent(inout) :: dEi(:,:,:)

    !> Optional derivatives of single particle wavefunctions
    real(dp), allocatable, intent(inout) :: dPsi(:,:,:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    !> Finite frequency, if relevant is > 0
    real(dp), intent(in) :: omega

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

    !> Small complex value for frequency dependent
    complex(dp), intent(in), optional :: eta

    !> Maximum allowed number of electrons in a single particle state
    real(dp), intent(in), optional :: maxFill

# 162 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: iGlob, jGlob, jj
    logical :: isTransformed
    complex(dp), allocatable :: cWorkLocal2(:,:), cWorkLocal3(:,:)
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: ii, iS, iK, iSignOmega
    logical :: isFreqDep

    real(dp), allocatable :: workLocal(:, :), work2Local(:,:), work3Local(:,:), work4Local(:,:)
    complex(dp), allocatable :: cWorkLocal(:,:)
    real(dp), allocatable :: dRho(:,:)
    real(dp), allocatable :: eigVecsTransformed(:,:), eWeightVecsTransformed(:,:)

    logical :: isHelical_

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"



    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if

    if (omega /= 0.0_dp) then
      isFreqDep = .true.
    else
      isFreqDep = .false.
    end if

    iK = parallelKS%localKS(1, iKS)
    iS = parallelKS%localKS(2, iKS)

    if (allocated(dEi)) then
      dEi(:, iK, iS) = 0.0_dp
    end if
    if (allocated(dPsi)) then
      dPsi(:, :, iS) = 0.0_dp
    end if

    allocate(workLocal(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)), source=0.0_dp)
    if (allocated(dOver)) then
      allocate(work2Local(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)), source=0.0_dp)
      allocate(work3Local(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)), source=0.0_dp)
    end if
    allocate(dRho(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)), source=0.0_dp)

    dRhoSparse(:) = 0.0_dp

# 219 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! dH in square form
    if (isHelical_) then
      call unpackHSHelicalRealBlacs(env%blacs, dHam(:,iS), neighbourList%iNeighbour,&
          & nNeighbourSK, iSparseStart, img2CentCell, orb, species, coord, denseDesc, workLocal)
    else
      call unpackHSRealBlacs(env%blacs, dHam(:,iS), neighbourList%iNeighbour, nNeighbourSK,&
          & iSparseStart, img2CentCell, denseDesc, workLocal)
    end if

    ! dH times c_i
    call pblasfx_psymm(workLocal, denseDesc%blacsOrbSqr, eigVecsReal(:,:,iKS),&
        & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

    if (allocated(dOver)) then
      ! dS in square form
      call unpackHSRealBlacs(env%blacs, dOver, neighbourList%iNeighbour, nNeighbourSK,&
          & iSparseStart, img2CentCell, denseDesc, work2Local)

      ! H' - e S' |c>
      call pblasfx_psymm(work2Local, denseDesc%blacsOrbSqr, eCiReal(:,:,iKS),&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr, alpha=-1.0_dp, beta=1.0_dp)
    end if

    ! <c| H' |c>
    call pblasfx_pgemm(eigVecsReal(:,:,iKS), denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
        & workLocal, denseDesc%blacsOrbSqr, transa="T")

    if (allocated(dOver)) then
      ! <c| S' |c>, note not fully efficient, as could replace second operation with pointwise
      ! product and sum along first index (distributed)
      call pblasfx_psymm(work2Local, denseDesc%blacsOrbSqr, eigVecsReal(:,:,iKS),&
          & denseDesc%blacsOrbSqr, work3local, denseDesc%blacsOrbSqr)
      call pblasfx_pgemm(eigVecsReal(:,:,iKS), denseDesc%blacsOrbSqr, work3Local,&
          & denseDesc%blacsOrbSqr, work4Local, denseDesc%blacsOrbSqr, transa="T")
    end if

    ! Orthogonalise any degeneracy against perturbation
    eigvecsTransformed = eigVecsReal(:,:,iKS)
    call degenTransform%generateUnitary(env, worklocal, eigvals(:,iK,iS), eigVecsTransformed,&
        & denseDesc, isTransformed, errStatus)
  if (errStatus%hasError()) then
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    return
# 262 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  end if
    ! now have states orthogonalised against the operator in degenerate cases: |c~>

    if (isTransformed) then
      ! re-form <c~| H' |c~> with the transformed vectors

      dRho(:,:) = 0.0_dp
      workLocal(:,:) = 0.0_dp

      ! dH in square form
      if (isHelical_) then
        call unpackHSHelicalRealBlacs(env%blacs, dHam(:,iS), neighbourList%iNeighbour,&
            & nNeighbourSK, iSparseStart, img2CentCell, orb, species, coord, denseDesc, workLocal)
      else
        call unpackHSRealBlacs(env%blacs, dHam(:,iS), neighbourList%iNeighbour, nNeighbourSK,&
            & iSparseStart, img2CentCell, denseDesc, workLocal)
      end if

      ! |dH| c~ >
      call pblasfx_psymm(workLocal, denseDesc%blacsOrbSqr, eigVecsTransformed,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      if (allocated(dOver)) then
        ! overlap transformed, needs to be fixed:
        ! |-e_i dS| c~ >
        call pblasfx_psymm(work2Local, denseDesc%blacsOrbSqr, eigVecsReal(:,:,iKS),&
            & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr, alpha=-1.0_dp, beta=1.0_dp)
      end if

      ! form <c| H' |c> or <c| H' - e_i S' |c> depending on whether the overlap is changing
      ! note: not fully efficient, as could replace with pointwise product and sum along first index
      ! (distributed)
      call pblasfx_pgemm(eigVecsTransformed, denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
          & workLocal, denseDesc%blacsOrbSqr, transa="T")

    end if

    ! derivative of eigenvalues stored in diagonal of matrix workLocal, from <c|h'|c>
    if (allocated(dEi)) then
      do jj = 1, size(workLocal,dim=2)
        jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
            & env%blacs%orbitalGrid%ncol)
        do ii = 1, size(workLocal,dim=1)
          iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
              & env%blacs%orbitalGrid%nrow)
          if (iGlob == jGlob) then
            !if (iGlob == jGlob) then workLocal(ii,jj) contains a derivative of an eigenvalue
            dEi(iGlob, iK, iS) = workLocal(ii,jj)
          end if
        end do
      end do
    end if

    if (isFreqDep) then

      allocate(cWorkLocal(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)))
      allocate(cWorkLocal2(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)))
      allocate(cWorkLocal3(size(eigVecsReal,dim=1), size(eigVecsReal,dim=2)))

      do iSignOmega = -1, 1, 2 ! loop over positive and negative frequencies

        ! Form actual perturbation U matrix for eigenvectors (potentially at finite T) by weighting
        ! the elements
        call weightMatrix(env, desc, cWorkLocal, workLocal, nFilled, nEmpty, eigVals, tempElec, iS,&
            & iK, Ef, iSignOmega * omega + eta)

        ! Derivatives of eigenvectors
        cWorkLocal2(:,:) = eigvecsTransformed
        call pblasfx_pgemm(cWorkLocal2, denseDesc%blacsOrbSqr, cWorkLocal, denseDesc%blacsOrbSqr,&
            & cWorkLocal3, denseDesc%blacsOrbSqr)

        ! Form derivative of density matrix
        cWorkLocal(:,:) = eigvecsTransformed
        call pblasfx_pgemm(cWorkLocal3, desc, cWorkLocal, desc, cWorkLocal2, desc, transb="T",&
            & kk=nFilled(iS, 1))

        ! Hermitian symmetry
        cWorkLocal3(:,:) = cWorkLocal2
        call pblasfx_ptranc(cWorkLocal3, desc, cWorkLocal2, desc, alpha=(0.5_dp,0.0_dp),&
            & beta=(0.5_dp,0.0_dp))

        if (isHelical_) then
          call packRhoHelicalRealBlacs(env%blacs, denseDesc, real(cWorkLocal2),&
              & neighbourList%iNeighbour, nNeighbourSK, iSparseStart, img2CentCell, orb, species,&
              & coord, dRhoSparse)
        else
          call packRhoRealBlacs(env%blacs, denseDesc, real(cWorkLocal2), neighbourList%iNeighbour,&
              & nNeighbourSK, orb%mOrb, iSparseStart, img2CentCell, dRhoSparse)
        end if

      end do

      if (associated(dRhoSqr)) then
        dRhoSqr(:,:,iS) = real(cWorkLocal2)
      end if

      deallocate(cWorkLocal)
      deallocate(cWorkLocal3)
      deallocate(cWorkLocal2)

    else

      ! Form actual perturbation U matrix for eigenvectors (potentially at finite T) by weighting
      ! the elements
      call weightMatrix(env, desc, workLocal, workLocal, nFilled, nEmpty, eigVals, tempElec, iS, 1,&
          & Ef)

      ! Derivatives of eigenvectors
      call pblasfx_pgemm(eigvecsTransformed, denseDesc%blacsOrbSqr, workLocal,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      if (allocated(dPsi)) then
        dPsi(:, :, iS) = dRho
      end if

      ! Form derivative of occupied density matrix
      call pblasfx_pgemm(dRho, denseDesc%blacsOrbSqr, eigvecsTransformed, denseDesc%blacsOrbSqr,&
          & workLocal, denseDesc%blacsOrbSqr, transb="T", kk=nFilled(iS, 1))

      dRho(:,:) = workLocal
      ! and symmetrize
      call pblasfx_ptran(workLocal, denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr, beta=1.0_dp)

      if (isHelical_) then
        call packRhoHelicalRealBlacs(env%blacs, denseDesc, dRho, neighbourList%iNeighbour,&
            & nNeighbourSK, iSparseStart, img2CentCell, orb, species, coord, dRhoSparse)
      else
        call packRhoRealBlacs(env%blacs, denseDesc, dRho, neighbourList%iNeighbour, nNeighbourSK,&
            & orb%mOrb, iSparseStart, img2CentCell, dRhoSparse)
      end if

      if (associated(dRhoSqr)) then
        dRhoSqr(:,:,iS) = dRho
      end if

    end if

    if (allocated(dOver)) then
      ! include  - |c> S' <c|
      dRho(:,:) = 0.0_dp

    end if

# 592 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  end subroutine dRhoReal


  !> Calculate the change in the density matrix due to shift in the Fermi energy for real, q=0
  !! systems
  subroutine dRhoFermiChangeReal(dRhoExtra, env, maxFill, parallelKS, iKS, neighbourList,&
      & nNEighbourSK, img2CentCell, iSparseStart, dE_F, Ef, nFilled, nEmpty, eigVecsReal, orb,&
      & denseDesc, tempElec, eigVals, dRhoSqr, species, coord, isHelical)

    !> Additional contribution to the density matrix to cancel effect of Fermi energy change
    real(dp), intent(inout) :: dRhoExtra(:)

    !> Environment settings
    type(TEnvironment), intent(inout) :: env

    !> Maximum allowed number of electrons in a single particle state
    real(dp), intent(in) :: maxFill

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Spin/kpoint channel
    integer, intent(in) :: iKS

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Fermi level derivative
    real(dp), intent(in) :: dE_F(:)

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel (and dummy k)
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel (and dummy k)
    integer, intent(in) :: nEmpty(:, :)

    !> Ground state eigenvectors
    real(dp), intent(in) :: eigVecsReal(:,:,:)

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Derivative of rho as a square matrix, if needed
    real(dp), pointer :: dRhoSqr(:,:,:)

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: jj, jGlob
    real(dp), allocatable :: work2Real(:,:)
# 674 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    integer :: iS
    real(dp) :: workReal(size(eigVecsReal, dim=1), size(eigVecsReal, dim=2))
    logical :: isHelical_

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if

    iS = parallelKS%localKS(2, iKS)

    workReal(:,:) = 0.0_dp

# 697 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    allocate(work2Real(size(eigVecsReal, dim=1), size(eigVecsReal, dim=2)))

    do jj = 1, size(workReal,dim=2)
      jGlob = scalafx_indxl2g(jj,desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob >= nEmpty(iS, 1) .and. jGlob <= nFilled(iS, 1)) then
        workReal(:,jj) = eigVecsReal(:,jj,iKS) * &
            & deltamn(eigVals(jGlob, 1, iS), Ef(iS), tempElec) * dE_F(iS)
      end if
    end do

    call pblasfx_pgemm(workReal, denseDesc%blacsOrbSqr, eigVecsReal(:,:,iKS),&
        & denseDesc%blacsOrbSqr, work2Real, denseDesc%blacsOrbSqr, transb="T",&
        & alpha=maxFill)
    workReal(:,:) = work2Real
    ! Symmetrise
    call pblasfx_ptran(work2Real, desc, workReal, desc, alpha=0.5_dp, beta=0.5_dp)
    deallocate(work2Real)

# 729 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! pack extra term into density matrix
# 732 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    if (isHelical_) then
      call packRhoHelicalRealBlacs(env%blacs, denseDesc, workReal, neighbourList%iNeighbour,&
          & nNeighbourSK, iSparseStart, img2CentCell, orb, species, coord, dRhoExtra)
    else
      call packRhoRealBlacs(env%blacs, denseDesc, workReal, neighbourList%iNeighbour, nNeighbourSK,&
          & orb%mOrb, iSparseStart, img2CentCell, drhoExtra)
    end if
# 748 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if  (associated(dRhoSqr)) then
      dRhoSqr(:,:,iS) = dRhoSqr(:,:,iS) + workReal
    end if

  end subroutine dRhoFermiChangeReal


  !> Calculate the derivative of density matrix from derivative of hamiltonian at q=0 but with
  !! k-points
  subroutine dRhoCmplx(env, dHam, neighbourList, nNeighbourSK, iSparseStart, img2CentCell,&
      & denseDesc, parallelKS, nFilled, nEmpty, eigVecsCplx, eigVals, Ef, tempElec, orb,&
      & dRhoSparse, kPoint, kWeight, iCellVec, cellVec, iKS, degenTransform, species, coord, dEi,&
      & dPsi, errStatus, omega, isHelical, eta)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Derivative of the hamiltonian
    real(dp), intent(in) :: dHam(:,:)

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Ground state eigenvectors
    complex(dp), intent(in) :: eigVecsCplx(:,:,:)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Fermi level(s)
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:,:)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Returning dRhoSparse on exit
    real(dp), intent(inout) :: dRhoSparse(:,:)

    !> The k-points
    real(dp), intent(in) :: kPoint(:,:)

    !> Weights for k-points
    real(dp), intent(in) :: kWeight(:)

    !> Vectors (in units of the lattice constants) to cells of the lattice
    real(dp), intent(in) :: cellVec(:,:)

    !> Index for which unit cell atoms are associated with
    integer, intent(in) :: iCellVec(:)

    !> Spin/kpoint channel
    integer, intent(in) :: iKS

    !> Transformation structure for degenerate orbitals
    type(TRotateDegen), intent(inout) :: degenTransform

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Derivative of single particle eigenvalues
    real(dp), allocatable, intent(inout) :: dEi(:,:,:)

    !> Optional derivatives of single particle wavefunctions
    complex(dp), allocatable, intent(inout) :: dPsi(:,:,:,:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    !> Finite frequency, if relevant is > 0
    real(dp), intent(in) :: omega

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

    !> Small complex value for frequency dependent
    complex(dp), intent(in), optional :: eta

# 854 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: jj, iGlob, jGlob
    logical :: isTransformed
# 859 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    integer :: ii, iK, iS, iSignOmega
    complex(dp), allocatable :: workLocal(:,:), dRho(:,:), eigVecsTransformed(:,:)
    complex(dp), allocatable :: cWorkLocal(:,:), cWorkLocal2(:,:)
    logical :: isHelical_, isFreqDep

# 866 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 871 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if

    if (omega /= 0.0_dp) then
      isFreqDep = .true.
    else
      isFreqDep = .false.
    end if

    allocate(workLocal(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))
    allocate(dRho(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))

    iK = parallelKS%localKS(1, iKS)
    iS = parallelKS%localKS(2, iKS)

    if (allocated(dEi)) then
      dEi(:, iK, iS) = 0.0_dp
    end if
    if (allocated(dPsi)) then
      dPsi(:, :, iK, iS) = cmplx(0,0,dp)
    end if

    workLocal(:,:) = cmplx(0,0,dp)
    dRho(:,:) = cmplx(0,0,dp)

# 901 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! dH in square form
    if (isHelical_) then
      call unpackHSHelicalCplxBlacs(env%blacs, dHam(:,iS), kPoint(:,iK),&
          & neighbourList%iNeighbour, nNeighbourSK, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, orb, species, coord, denseDesc, workLocal)
    else
      call unpackHSCplxBlacs(env%blacs, dHam(:,iS), kPoint(:,iK), neighbourList%iNeighbour,&
          & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, denseDesc, workLocal)
    end if

    ! dH times c_i
    call pblasfx_phemm(workLocal, denseDesc%blacsOrbSqr, eigVecsCplx(:,:,iKS),&
        & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

    ! c_i times dH times c_i
    call pblasfx_pgemm(eigVecsCplx(:,:,iKS), denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
        & workLocal, denseDesc%blacsOrbSqr, transa="C")

    eigvecsTransformed = eigVecsCplx(:,:,iKS)
    call degenTransform%generateUnitary(env, worklocal, eigvals(:,iK,iS), eigVecsTransformed,&
        & denseDesc, isTransformed, errStatus)
  if (errStatus%hasError()) then
# 923 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    return
# 923 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  end if
    ! now have states orthogonalised agains the operator in degenerate cases, |c~>

    if (isTransformed) then
      ! re-form |c~> H' <c~| with the transformed vectors

      dRho(:,:) = 0.0_dp
      workLocal(:,:) = 0.0_dp

      ! dH in square form
      if (isHelical_) then
        call unpackHSHelicalCplxBlacs(env%blacs, dHam(:,iS), kPoint(:,iK),&
            & neighbourList%iNeighbour, nNeighbourSK, iCellVec, cellVec, iSparseStart,&
            & img2CentCell, orb, species, coord, denseDesc, workLocal)
      else
        call unpackHSCplxBlacs(env%blacs, dHam(:,iS), kPoint(:,iK), neighbourList%iNeighbour,&
            & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, denseDesc, workLocal)
      end if

      ! dH times c_i
      call pblasfx_phemm(workLocal, denseDesc%blacsOrbSqr, eigVecsTransformed,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      ! c_i times dH times c_i
      call pblasfx_pgemm(eigVecsTransformed, denseDesc%blacsOrbSqr, dRho,&
          & denseDesc%blacsOrbSqr, workLocal, denseDesc%blacsOrbSqr, transa="C")

    end if

    ! derivative of eigenvalues stored in diagonal of matrix workLocal, from <c|h'|c>
    if (allocated(dEi)) then
      do jj = 1, size(workLocal,dim=2)
        jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
            & env%blacs%orbitalGrid%ncol)
        do ii = 1, size(workLocal,dim=1)
          iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
              & env%blacs%orbitalGrid%nrow)
          if (iGlob == jGlob) then
            dEi(iGlob, iK, iS) = real(workLocal(ii,jj),dp)
          end if
        end do
      end do
    end if

    if (isFreqDep) then

      allocate(cWorkLocal(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))
      allocate(cWorkLocal2(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))

      do iSignOmega = -1, 1, 2 ! loop over positive and negative frequencies

        call weightMatrix(env, desc, cWorkLocal, workLocal, nFilled, nEmpty, eigVals, tempElec, iS,&
            & iK, Ef, iSignOmega * omega + eta)

        ! Derivatives of eigenvectors
        cWorkLocal2(:,:) = eigvecsTransformed
        call pblasfx_pgemm(cWorkLocal2, denseDesc%blacsOrbSqr, cWorkLocal, denseDesc%blacsOrbSqr,&
            & dRho, denseDesc%blacsOrbSqr)

        ! Form derivative of occupied space density matrix
        cWorkLocal(:,:) = eigvecsTransformed
        call pblasfx_pgemm(dRho, desc, cWorkLocal, desc, cWorkLocal2, desc, transb="C",&
            & kk=nFilled(iS, iK))

        ! Hermitian symmetry
        dRho(:,:) = cWorkLocal2
        call pblasfx_ptranc(cWorkLocal2, desc, dRho, desc, alpha=(0.5_dp,0.0_dp),&
            & beta=(0.5_dp,0.0_dp))

        if (isHelical_) then
          call packRhoHelicalCplxBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK),&
              & kWeight(iK), neighbourList%iNeighbour, nNeighbourSK, iCellVec, cellVec,&
              & iSparseStart, img2CentCell, orb, species, coord, dRhoSparse(:,iS))
        else
          call packRhoCplxBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK), kWeight(iK),&
              & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
              & img2CentCell, dRhoSparse(:,iS))
        end if

      end do

      deallocate(cWorkLocal)
      deallocate(cWorkLocal2)

    else

      ! Form actual perturbation U matrix for eigenvectors (potentially at finite T) by weighting
      ! the elements
      call weightMatrix(env, desc, workLocal, workLocal, nFilled, nEmpty, eigVals, tempElec, iS,&
          & iK, Ef)

      ! Derivatives of eigenvectors
      call pblasfx_pgemm(eigvecsTransformed, denseDesc%blacsOrbSqr, workLocal,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      if (allocated(dPsi)) then
        dPsi(:, :, iK, iS) = workLocal
      end if

      ! Form derivative of occupied density matrix
      call pblasfx_pgemm(dRho, denseDesc%blacsOrbSqr,eigvecsTransformed, denseDesc%blacsOrbSqr,&
          & workLocal, denseDesc%blacsOrbSqr, transb="C", kk=nFilled(iS, iK))
      dRho(:,:) = workLocal

      ! Hermitian symmetry
      call pblasfx_ptranc(workLocal, denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
          & beta=(1.0_dp,0.0_dp))

      if (isHelical_) then
        call packRhoHelicalCplxBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK), kWeight(iK),&
            & neighbourList%iNeighbour, nNeighbourSK, iCellVec, cellVec, iSparseStart,&
            & img2CentCell, orb, species, coord, dRhoSparse(:,iS))
      else
        call packRhoCplxBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK), kWeight(iK),&
            & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
            & img2CentCell, dRhoSparse(:,iS))
      end if

    end if

# 1150 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  end subroutine dRhoCmplx


  !> Calculate the change in the density matrix due to shift in the Fermi energy for q=0 cases with
  !! k-points
  subroutine dRhoFermiChangeCmplx(dRhoExtra, env, maxFill, parallelKS, iKS, kPoint, kWeight,&
      & iCellVec, cellVec, neighbourList, nNEighbourSK, img2CentCell, iSparseStart, dE_F, Ef,&
      & nFilled, nEmpty, eigVecsCplx, orb, denseDesc, tempElec, eigVals, species, coord, isHelical)

    !> Additional contribution to the density matrix to cancel effect of Fermi energy change,
    real(dp), intent(inout) :: dRhoExtra(:,:)

    !> Environment settings
    type(TEnvironment), intent(inout) :: env

    !> Maximum allowed number of electrons in a single particle state
    real(dp), intent(in) :: maxFill

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Spin/kpoint channel
    integer, intent(in) :: iKS

    !> The k-points
    real(dp), intent(in) :: kPoint(:,:)

    !> Weights for k-points
    real(dp), intent(in) :: kWeight(:)

    !> Vectors (in units of the lattice constants) to cells of the lattice
    real(dp), intent(in) :: cellVec(:,:)

    !> Index for which unit cell atoms are associated with
    integer, intent(in) :: iCellVec(:)

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Fermi level derivative
    real(dp), intent(in) :: dE_F(:)

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:,:)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:,:)

    !> Ground state eigenvectors
    complex(dp), intent(in) :: eigVecsCplx(:,:,:)

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

# 1236 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: jj, jGlob
# 1240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: iK, iS
    complex(dp) :: workLocal(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
# 1243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    complex(dp) :: workLocal2(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
    complex(dp) :: workLocal3(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
# 1246 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    logical :: isHelical_

# 1249 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 1254 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if

    workLocal(:,:) = cmplx(0,0,dp)

    iK = parallelKS%localKS(1, iKS)
    iS = parallelKS%localKS(2, iKS)

# 1267 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    do jj = 1, size(workLocal,dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob >= nEmpty(iS,iK) .and. jGlob <= nFilled(iS,iK)) then
        workLocal(:, jj) = eigVecsCplx(:, jj, iKS) * &
            & deltamn(eigVals(jGlob, iK, iS), Ef(iS), tempElec) * dE_F(iS)
      end if
    end do

    workLocal3(:,:) = eigVecsCplx(:,:,iKS)
    call pblasfx_pgemm(workLocal, denseDesc%blacsOrbSqr, workLocal3,&
        & denseDesc%blacsOrbSqr, workLocal2, denseDesc%blacsOrbSqr, transb="C",&
        & alpha=cmplx(maxFill,0.0_dp,dp))
    workLocal(:,:) = workLocal2

    ! Hermitian symmetry
    call pblasfx_ptranc(workLocal2, denseDesc%blacsOrbSqr, workLocal, denseDesc%blacsOrbSqr,&
        & alpha=(0.5_dp,0.0_dp), beta=(0.5_dp,0.0_dp))

# 1298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! pack extra term into density matrix
# 1301 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    if (isHelical_) then
      call packRhoHelicalCplxBlacs(env%blacs, denseDesc, workLocal, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, orb, species, coord, dRhoExtra(:,iS))
    else
      call packRhoCplxBlacs(env%blacs, denseDesc, workLocal, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, dRhoExtra(:,iS))
    end if
# 1321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  end subroutine dRhoFermiChangeCmplx


  !> Calculate the derivative of density matrix from derivative of hamiltonian at q=0
  subroutine dRhoPauli(env, dHam, idHam, neighbourList, nNeighbourSK, iSparseStart,&
      & img2CentCell, denseDesc, parallelKS, nFilled, nEmpty, eigVecsCplx, eigVals, Ef, tempElec,&
      & orb, dRhoSparse, idRhoSparse, kPoint, kWeight, iCellVec, cellVec, iKS, degenTransform,&
      & species, coord, dEi, dPsi, errStatus, omega, isHelical, eta)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Derivative of the hamiltonian
    real(dp), intent(in) :: dHam(:,:)

    !> Derivative of the imaginary part of the hamiltonian
    real(dp), intent(inout), allocatable :: idHam(:,:)

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Ground state eigenvectors
    complex(dp), intent(in) :: eigVecsCplx(:,:,:)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Fermi level(s)
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:,:)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Returning dRhoSparse on exit
    real(dp), intent(inout) :: dRhoSparse(:,:)

    !> Returning imaginary part of dRhoSparse on exit
    real(dp), intent(inout), allocatable :: idRhoSparse(:,:)

    !> The k-points
    real(dp), intent(in) :: kPoint(:,:)

    !> Weights for k-points
    real(dp), intent(in) :: kWeight(:)

    !> Vectors (in units of the lattice constants) to cells of the lattice
    real(dp), intent(in) :: cellVec(:,:)

    !> Index for which unit cell atoms are associated with
    integer, intent(in) :: iCellVec(:)

    !> Spin/kpoint channel
    integer, intent(in) :: iKS

    !> Transformation structure for degenerate orbitals
    type(TRotateDegen), intent(inout) :: degenTransform

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Derivative of single particle eigenvalues
    real(dp), allocatable, intent(inout) :: dEi(:,:,:)

    !> Optional derivatives of single particle wavefunctions
    complex(dp), allocatable, intent(inout) :: dPsi(:,:,:,:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    !> Finite frequency, if relevant is > 0
    real(dp), intent(in) :: omega

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

    !> Small complex value for frequency dependent
    complex(dp), intent(in), optional :: eta

# 1428 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: jj, iGlob, jGlob
    logical :: isTransformed
    complex(dp), allocatable :: cWorkLocal3(:,:)
# 1434 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    integer :: ii, iK, iS, iSignOmega
    complex(dp), allocatable :: cWorkLocal(:,:), cWorkLocal2(:,:), dRho(:,:)
    complex(dp), allocatable :: eigVecsTransformed(:,:)
    logical :: isHelical_, isFreqDep

# 1441 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 1446 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if
    if (isHelical_) then
  call errStatus%setError(-1, "Helical geometry for Pauli hamiltonians not currently possible",&
# 1453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
      & "src/dftbp/derivs/linearresponse.F90", 1453)
# 1453 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  return
# 1455 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    end if

    if (omega /= 0.0_dp) then
      isFreqDep = .true.
    else
      isFreqDep = .false.
    end if

    allocate(cWorkLocal(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))
    allocate(dRho(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))

    iK = parallelKS%localKS(1, iKS)
    iS = parallelKS%localKS(2, iKS)

    if (allocated(dEi)) then
      dEi(:, iK, iS) = 0.0_dp
    end if
    if (allocated(dPsi)) then
      dPsi(:, :, iK, iS) = cmplx(0,0,dp)
    end if

    cWorkLocal(:,:) = cmplx(0,0,dp)
    dRho(:,:) = cmplx(0,0,dp)

# 1480 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! dH in square form
    if (allocated(idHam)) then
      call unpackHPauliBlacs(env%blacs, dHam, kPoint(:,iK), neighbourList%iNeighbour,&
          & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, orb%mOrb, denseDesc,&
          & cWorkLocal, iorig=idHam)
    else
      call unpackHPauliBlacs(env%blacs, dHam, kPoint(:,iK), neighbourList%iNeighbour,&
          & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, orb%mOrb, denseDesc,&
          & cWorkLocal)
    end if

    ! dH times c_i
    call pblasfx_phemm(cWorkLocal, denseDesc%blacsOrbSqr, eigVecsCplx(:,:,iKS),&
        & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

    ! c_i times dH times c_i
    call pblasfx_pgemm(eigVecsCplx(:,:,iKS), denseDesc%blacsOrbSqr, dRho,&
        & denseDesc%blacsOrbSqr, cWorkLocal, denseDesc%blacsOrbSqr, transa="C")

    eigvecsTransformed = eigVecsCplx(:,:,iKS)
    call degenTransform%generateUnitary(env, cWorkLocal, eigvals(:,iK,iS), eigVecsTransformed,&
        & denseDesc, isTransformed, errStatus)
  if (errStatus%hasError()) then
# 1503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    return
# 1503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  end if
    ! now have states orthogonalised against the operator in degenerate cases, |c~>

    if (isTransformed) then
      ! re-form |c~> H' <c~| with the transformed vectors

      dRho(:,:) = 0.0_dp
      cWorkLocal(:,:) = 0.0_dp

      ! dH in square form
      if (allocated(idHam)) then
        call unpackHPauliBlacs(env%blacs, dHam, kPoint(:,iK), neighbourList%iNeighbour,&
            & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, orb%mOrb, denseDesc,&
            & cWorkLocal, iorig=idHam)
      else
        call unpackHPauliBlacs(env%blacs, dHam, kPoint(:,iK), neighbourList%iNeighbour,&
            & nNeighbourSK, iCellVec, cellVec, iSparseStart, img2CentCell, orb%mOrb, denseDesc,&
            & cWorkLocal)
      end if

      ! dH times c_i
      call pblasfx_phemm(cWorkLocal, denseDesc%blacsOrbSqr, eigVecsTransformed,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      ! c_i times dH times c_i
      call pblasfx_pgemm(eigVecsTransformed, denseDesc%blacsOrbSqr, dRho,&
          & denseDesc%blacsOrbSqr, cWorkLocal, denseDesc%blacsOrbSqr, transa="C")

    end if

    ! derivative of eigenvalues stored in diagonal of matrix cWorkLocal, from <c|h'|c>
    if (allocated(dEi)) then
      do jj = 1, size(cWorkLocal,dim=2)
        jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
            & env%blacs%orbitalGrid%ncol)
        do ii = 1, size(cWorkLocal,dim=1)
          iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
              & env%blacs%orbitalGrid%nrow)
          if (iGlob == jGlob) then
            dEi(iGlob, iK, iS) = real(cWorkLocal(ii,jj),dp)
          end if
        end do
      end do
    end if

    if (isFreqDep) then

      allocate(cWorkLocal2(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))
      allocate(cWorkLocal3(size(eigVecsCplx,dim=1), size(eigVecsCplx,dim=2)))
      dRho(:,:) = 0.0_dp

      do iSignOmega = -1, 1, 2 ! loop over positive and negative frequencies

        call weightMatrix(env, desc, cWorkLocal2, cWorkLocal, nFilled, nEmpty, eigVals, tempElec,&
            & iS, iK, Ef, iSignOmega * omega + eta)

        ! Derivatives of eigenvectors
        call pblasfx_pgemm(eigvecsTransformed, denseDesc%blacsOrbSqr, cWorkLocal2,&
            & denseDesc%blacsOrbSqr, cWorkLocal3, denseDesc%blacsOrbSqr)

        ! Form derivative of occupied density matrix
        call pblasfx_pgemm(cWorkLocal3, denseDesc%blacsOrbSqr,eigvecsTransformed,&
            & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr, transb="C", kk=nFilled(iS, iK),&
            & beta=(1.0_dp,0.0_dp))

      end do

      deallocate(cWorkLocal2)
      deallocate(cWorkLocal3)

      cWorkLocal(:,:) = dRho

      ! Hermitian symmetry
      call pblasfx_ptranc(cWorkLocal, denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
          & alpha=(0.5_dp,0.0_dp), beta=(0.5_dp,0.0_dp))

    else

      ! Form actual perturbation U matrix for eigenvectors (potentially at finite T) by weighting
      ! the elements
      call weightMatrix(env, desc, cWorkLocal, cWorkLocal, nFilled, nEmpty, eigVals, tempElec, iS,&
          & iK, Ef)

      ! Derivatives of eigenvectors
      call pblasfx_pgemm(eigvecsTransformed, denseDesc%blacsOrbSqr, cWorkLocal,&
          & denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr)

      if (allocated(dPsi)) then
        dPsi(:, :, iK, iS) = cWorkLocal
      end if

      ! Form derivative of occupied density matrix
      call pblasfx_pgemm(dRho, denseDesc%blacsOrbSqr,eigvecsTransformed, denseDesc%blacsOrbSqr,&
          & cWorkLocal, denseDesc%blacsOrbSqr, transb="C", kk=nFilled(iS, iK))
      dRho(:,:) = cWorkLocal

      ! Hermitian symmetry
      call pblasfx_ptranc(cWorkLocal, denseDesc%blacsOrbSqr, dRho, denseDesc%blacsOrbSqr,&
          & beta=(1.0_dp,0.0_dp))

    end if

# 1698 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

# 1700 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    if (allocated(idRhoSparse)) then
      call packRhoPauliBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, dRhoSparse, idRhoSparse)
    else
      call packRhoPauliBlacs(env%blacs, denseDesc, dRho, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, dRhoSparse)
    end if
# 1719 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  end subroutine dRhoPauli


  !> Calculate the change in the density matrix due to shift in the Fermi energy
  subroutine dRhoFermiChangePauli(dRhoExtra, idRhoExtra, env, parallelKS, iKS, kPoint,&
      & kWeight, iCellVec, cellVec, neighbourList, nNEighbourSK, img2CentCell, iSparseStart, dE_F,&
      & Ef, nFilled, nEmpty, eigVecsCplx, orb, denseDesc, tempElec, eigVals, species, coord,&
      & errStatus, isHelical)

    !> Additional contribution to the density matrix to cancel effect of Fermi energy change
    real(dp), intent(inout) :: dRhoExtra(:,:)

    !> Imaginary part of additional contribution to the density matrix to cancel effect of Fermi
    !> energy change
    real(dp), intent(inout), allocatable :: idRhoExtra(:,:)

    !> Environment settings
    type(TEnvironment), intent(inout) :: env

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> Spin/kpoint channel
    integer, intent(in) :: iKS

    !> The k-points
    real(dp), intent(in) :: kPoint(:,:)

    !> Weights for k-points
    real(dp), intent(in) :: kWeight(:)

    !> Vectors (in units of the lattice constants) to cells of the lattice
    real(dp), intent(in) :: cellVec(:,:)

    !> Index for which unit cell atoms are associated with
    integer, intent(in) :: iCellVec(:)

    !> List of neighbours for each atom
    type(TNeighbourList), intent(in) :: neighbourList

    !> Number of neighbours for each of the atoms
    integer, intent(in) :: nNeighbourSK(:)

    !> Map from image atoms to the original unique atom
    integer, intent(in) :: img2CentCell(:)

    !> Index array for the start of atomic blocks in sparse arrays
    integer, intent(in) :: iSparseStart(:,:)

    !> Fermi level derivative
    real(dp), intent(in) :: dE_F(:)

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:,:)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:,:)

    !> Ground state eigenvectors
    complex(dp), intent(in) :: eigVecsCplx(:,:,:)

    !> Atomic orbital information
    type(TOrbitals), intent(in) :: orb

    !> Dense matrix descriptor
    type(TDenseDescr), intent(in) :: denseDesc

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Species of all atoms in the system
    integer, intent(in) :: species(:)

    !> Coordinates of all atoms including images
    real(dp), intent(in) :: coord(:,:)

    !> Status of routine
    type(TStatus), intent(out) :: errStatus

    !> Is the geometry helical
    logical, intent(in), optional :: isHelical

# 1809 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: jj, jGlob
# 1813 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    integer :: iK, iS
    complex(dp) :: workLocal(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
# 1816 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    complex(dp) :: workLocal2(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
    complex(dp) :: workLocal3(size(eigVecsCplx, dim=1), size(eigVecsCplx, dim=2))
# 1819 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    logical :: isHelical_

# 1822 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    ! BLACS matrix descriptor
    integer :: desc(DLEN_)

    desc(:) = denseDesc%blacsOrbSqr
# 1827 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    if (present(isHelical)) then
      isHelical_ = isHelical
    else
      isHelical_ = .false.
    end if
    if (isHelical_) then
  call errStatus%setError(-1, "Helical geometry for Pauli hamiltonians not currently possible",&
# 1834 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
      & "src/dftbp/derivs/linearresponse.F90", 1834)
# 1834 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
  return
# 1836 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    end if

    workLocal(:,:) = cmplx(0,0,dp)

    iK = parallelKS%localKS(1, iKS)
    iS = parallelKS%localKS(2, iKS)

# 1844 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    do jj = 1, size(workLocal,dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob >= nEmpty(iS,iK) .and. jGlob <= nFilled(iS,iK)) then
        workLocal(:, jj) = eigVecsCplx(:, jj, iKS) * &
            & deltamn(eigVals(jGlob, iK, iS), Ef(iS), tempElec) * dE_F(iS)
      end if
    end do

    workLocal3(:,:) = eigVecsCplx(:,:,iKS)
    call pblasfx_pgemm(workLocal, denseDesc%blacsOrbSqr, workLocal3,&
        & denseDesc%blacsOrbSqr, workLocal2, denseDesc%blacsOrbSqr, transb="C")
    workLocal(:,:) = workLocal2

    ! Hermitian symmetry
    call pblasfx_ptranc(workLocal2, denseDesc%blacsOrbSqr, workLocal, denseDesc%blacsOrbSqr,&
        & alpha=(0.5_dp,0.0_dp), beta=(0.5_dp,0.0_dp))

# 1874 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

    ! pack extra term into density matrix
# 1877 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"
    if (allocated(idRhoExtra)) then
      call packRhoPauliBlacs(env%blacs, denseDesc, workLocal, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, dRhoExtra, idRhoExtra)
    else
      call packRhoPauliBlacs(env%blacs, denseDesc, workLocal, kPoint(:,iK), kWeight(iK),&
          & neighbourList%iNeighbour, nNeighbourSK, orb%mOrb, iCellVec, cellVec, iSparseStart,&
          & img2CentCell, dRhoExtra)
    end if
# 1897 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  end subroutine dRhoFermiChangePauli

# 1901 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

# 1903 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  !> Weight <c|H|c> by inverse of eigenvalue differences
  subroutine static_RR_weight(env, desc, workOut, workIn, nFilled, nEmpty, eigVals,&
      & tempElec, iS, iK, Ef)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> BLACS matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> |c>H<c| / (ei-ej) matrix
    real(dp), intent(inout) :: workOut(:, :)

    !> |c>H<c| matrix
    real(dp), intent(inout) :: workIn(:, :)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:, :)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Spin index
    integer, intent(in) :: iS

    !> The k-point index
    integer, intent(in) :: iK

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    integer :: jj, jGlob, ii, iGlob

    ! weight matrix with inverse of energy differences
    do jj = 1, size(workIn, dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob > nFilled(iS, iK)) then
        workOut(:, jj) = 0.0_dp
        cycle
      end if
      do ii = 1, size(workIn,dim=1)
        iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
            & env%blacs%orbitalGrid%nrow)
        if (iGlob < nEmpty(iS, iK)) then
          workOut(ii, :) = 0.0_dp
          cycle
        end if
        if (abs(eigvals(jGlob,iK,iS) - eigvals(iGlob,iK,iS)) < epsilon(0.0_dp) .and.&
            & iGlob /= jGlob) then
          ! degenerate, so no contribution
          workOut(ii,jj) = 0.0_dp
        else
          workOut(ii,jj) = workIn(ii,jj) *&
              & invDiff(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), Ef(iS), tempElec)&
              & * theta(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), tempElec)
        end if
      end do
    end do

  end subroutine static_RR_weight

# 1903 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  !> Weight <c|H|c> by inverse of eigenvalue differences
  subroutine static_CC_weight(env, desc, workOut, workIn, nFilled, nEmpty, eigVals,&
      & tempElec, iS, iK, Ef)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> BLACS matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> |c>H<c| / (ei-ej) matrix
    complex(dp), intent(inout) :: workOut(:, :)

    !> |c>H<c| matrix
    complex(dp), intent(inout) :: workIn(:, :)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:, :)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Spin index
    integer, intent(in) :: iS

    !> The k-point index
    integer, intent(in) :: iK

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    integer :: jj, jGlob, ii, iGlob

    ! weight matrix with inverse of energy differences
    do jj = 1, size(workIn, dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob > nFilled(iS, iK)) then
        workOut(:, jj) = 0.0_dp
        cycle
      end if
      do ii = 1, size(workIn,dim=1)
        iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
            & env%blacs%orbitalGrid%nrow)
        if (iGlob < nEmpty(iS, iK)) then
          workOut(ii, :) = 0.0_dp
          cycle
        end if
        if (abs(eigvals(jGlob,iK,iS) - eigvals(iGlob,iK,iS)) < epsilon(0.0_dp) .and.&
            & iGlob /= jGlob) then
          ! degenerate, so no contribution
          workOut(ii,jj) = 0.0_dp
        else
          workOut(ii,jj) = workIn(ii,jj) *&
              & invDiff(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), Ef(iS), tempElec)&
              & * theta(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), tempElec)
        end if
      end do
    end do

  end subroutine static_CC_weight

# 1973 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

# 1975 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  !> Weight |c>H<c| by inverse of eigenvalue differences at finite frequency
  subroutine dynamic_RC_weight(env, desc, workOut, workIn, nFilled, nEmpty, eigVals,&
      & tempElec, iS, iK, Ef, eta)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> BLACS matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> |c>H<c| / (ei-ej) matrix
    complex(dp), intent(inout) :: workOut(:, :)

    !> |c>H<c| matrix
    real(dp), intent(inout) :: workIn(:, :)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:, :)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Spin index
    integer, intent(in) :: iS

    !> The k-point index
    integer, intent(in) :: iK

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    !> Frequency and imaginary part
    complex(dp), intent(in) :: eta

    integer :: jj, jGlob, ii, iGlob

    ! weight matrix with inverse of energy differences
    do jj = 1, size(workIn, dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob > nFilled(iS, iK)) then
        workOut(:, jj) = 0.0_dp
        cycle
      end if
      do ii = 1, size(workIn,dim=1)
        iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
            & env%blacs%orbitalGrid%nrow)
        if (iGlob < nEmpty(iS, iK)) then
          workOut(ii, :) = 0.0_dp
          cycle
        end if
        if (abs(eigvals(jGlob,iK,iS) - eigvals(iGlob,iK,iS)) < epsilon(0.0_dp) .and.&
            & iGlob /= jGlob) then
          ! degenerate, so no contribution
          workOut(ii,jj) = 0.0_dp
        else
          workOut(ii,jj) = workIn(ii,jj)&
              & * theta(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), tempElec)&
              & * invDiff(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), Ef(iS), tempElec, eta)
        end if
      end do
    end do

  end subroutine dynamic_RC_weight

# 1975 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  !> Weight |c>H<c| by inverse of eigenvalue differences at finite frequency
  subroutine dynamic_CC_weight(env, desc, workOut, workIn, nFilled, nEmpty, eigVals,&
      & tempElec, iS, iK, Ef, eta)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> BLACS matrix descriptor
    integer, intent(in) :: desc(DLEN_)

    !> |c>H<c| / (ei-ej) matrix
    complex(dp), intent(inout) :: workOut(:, :)

    !> |c>H<c| matrix
    complex(dp), intent(inout) :: workIn(:, :)

    !> Last (partly) filled level in each spin channel
    integer, intent(in) :: nFilled(:, :)

    !> First (partly) empty level in each spin channel
    integer, intent(in) :: nEmpty(:, :)

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Electron temperature
    real(dp), intent(in) :: tempElec

    !> Spin index
    integer, intent(in) :: iS

    !> The k-point index
    integer, intent(in) :: iK

    !> Fermi level
    real(dp), intent(in) :: Ef(:)

    !> Frequency and imaginary part
    complex(dp), intent(in) :: eta

    integer :: jj, jGlob, ii, iGlob

    ! weight matrix with inverse of energy differences
    do jj = 1, size(workIn, dim=2)
      jGlob = scalafx_indxl2g(jj, desc(NB_), env%blacs%orbitalGrid%mycol, desc(CSRC_),&
          & env%blacs%orbitalGrid%ncol)
      if (jGlob > nFilled(iS, iK)) then
        workOut(:, jj) = 0.0_dp
        cycle
      end if
      do ii = 1, size(workIn,dim=1)
        iGlob = scalafx_indxl2g(ii, desc(MB_), env%blacs%orbitalGrid%myrow, desc(RSRC_),&
            & env%blacs%orbitalGrid%nrow)
        if (iGlob < nEmpty(iS, iK)) then
          workOut(ii, :) = 0.0_dp
          cycle
        end if
        if (abs(eigvals(jGlob,iK,iS) - eigvals(iGlob,iK,iS)) < epsilon(0.0_dp) .and.&
            & iGlob /= jGlob) then
          ! degenerate, so no contribution
          workOut(ii,jj) = 0.0_dp
        else
          workOut(ii,jj) = workIn(ii,jj)&
              & * theta(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), tempElec)&
              & * invDiff(eigvals(jGlob,iK,iS), eigvals(iGlob,iK,iS), Ef(iS), tempElec, eta)
        end if
      end do
    end do

  end subroutine dynamic_CC_weight

# 2048 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

# 2176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/derivs/linearresponse.F90"

  !> Weight <c|H - epsilon S|c> by inverse of eigenvalue differences
  subroutine weight_dx(work, work2Local, nFilled, nOrb, iK, iS, degenTransform, eigvals,&
      & filling, maxFill)

    !> Matrix to weight
    real(dp), intent(inout) :: work(:,:)

    !> Eigenvector product with work matrix
    real(dp), intent(in) :: work2Local(:,:)

    !> Number of (partly) filled states in each [nIndepHam,kpt]
    integer, intent(in) :: nFilled(:,:)

    !> Number of orbitals
    integer, intent(in) :: nOrb

    !> Current k-point
    integer, intent(in) :: iK

    !> Current spin channel
    integer, intent(in) :: iS

    !> Transformation structure for degenerate orbitals
    type(TRotateDegen), intent(in) :: degenTransform

    !> Eigenvalue of each level, kpoint and spin channel
    real(dp), intent(in) :: eigvals(:,:,:)

    !> Filling of unperturbed ground state
    real(dp), intent(in) :: filling(:,:,:)

    !> Maximum allowed number of electrons in a single particle state
    real(dp), intent(in), optional :: maxFill

    integer :: iFilled, iEmpty
    real(dp) :: invMaxFill

    invMaxFill = 1.0_dp
    if (present(maxFill)) invMaxFill = 1.0_dp / maxFill

    do iFilled = 1, nFilled(iS, iK)
      do iEmpty = 1, nOrb
        if (iFilled == iEmpty) then
          work(iFilled, iFilled) = -0.5_dp * invMaxFill * filling(iFilled, iK, iS)&
              & * sum(work2Local(:, iFilled))
        else
          if (.not.degenTransform%isDegenerate(iFilled,iEmpty)) then
            work(iEmpty, iFilled) = invMaxFill * filling(iFilled, iK, iS)&
                & * work(iEmpty, iFilled) / (eigvals(iFilled, iK, iS) - eigvals(iEmpty, iK, iS))
          else
            ! Should already be zero by orthogonalisation
            work(iEmpty, iFilled) = 0.0_dp
            work(iFilled, iEmpty) = 0.0_dp
          end if
        end if
      end do
    end do

  end subroutine weight_dx

end module dftbp_derivs_linearresponse
