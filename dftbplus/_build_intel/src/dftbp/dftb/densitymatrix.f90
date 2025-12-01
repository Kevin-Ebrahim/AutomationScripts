!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!


!> Calculate the whole single particle density matrix and energy weighted density matrix.
!! Note: Dense serial code based on suggestions from Thomas Heine.
!! Caveat: The routines create the transposed and complex conjugated of the density matrices
!! (cc* instead of the conventional c*c).
module dftbp_dftb_densitymatrix
  use dftbp_common_accuracy, only : dp, lc
  use dftbp_common_constants, only : imag, pi
  use dftbp_common_status, only : TStatus
  use dftbp_elecsolvers_dmsolvertypes, only : densityMatrixTypes
  use dftbp_math_blasroutines, only : herk
  use dftbp_type_commontypes, only : TParallelKS
  use dftbp_extlibs_scalapackfx, only : blacsgrid, blocklist, pblasfx_pgemm, pblasfx_ptranc, size

  implicit none
  private

  public :: TDensityMatrix, TDensityMatrix_init, transformDualSpaceToBvKRealSpace
  public :: makeDensityMtxRealBlacs, makeDensityMtxCplxBlacs


  !> Holds density matrix related data and control variables
  type :: TDensityMatrix

    !> Method by which the density matrix is being generated
    integer :: iDensityMatrixAlgorithm

    !! Real and complex delta (i.e. change between cycles) density matrices.

    !> Real, square dual-space deltaRho input
    real(dp), allocatable :: deltaRhoIn(:,:,:)

    !> Real, square dual-space deltaRho output
    real(dp), allocatable :: deltaRhoOut(:,:,:)

    !> Complex, square dual-space deltaRho input
    complex(dp), allocatable :: deltaRhoInCplx(:,:,:)

    !> Complex, square dual-space deltaRho output
    complex(dp), allocatable :: deltaRhoOutCplx(:,:,:)

    !> Real-space, square deltaRho input
    real(dp), allocatable :: deltaRhoInCplxHS(:,:,:,:,:,:)

    !> Real-space, square deltaRho output
    real(dp), allocatable :: deltaRhoOutCplxHS(:,:,:,:,:,:)

    !> Composite index for mapping iK/iS --> iGlobalKS for arrays present at every MPI rank
    integer, allocatable :: iKiSToiGlobalKS(:,:)

    !> The k'-points that are possibly different from the current k-points in case of a
    !! bandstructure calculation
    real(dp), allocatable :: kPointPrime(:,:)

    !> Weights of the k'-points
    real(dp), allocatable :: kWeightPrime(:)

  contains

    !> Returns the density matrix
    procedure, private :: getDensityMatrix_real
    procedure, private :: getDensityMatrix_cmplx
    generic :: getDensityMatrix => getDensityMatrix_real, getDensityMatrix_cmplx

    !> Returns the energy weighted density matrix
    procedure, private :: getEDensityMatrix_real
    procedure, private :: getEDensityMatrix_cmplx
    generic :: getEDensityMatrix => getEDensityMatrix_real, getEDensityMatrix_cmplx

  end type TDensityMatrix


  !> Used to shift occupations in density matrix build away from 0
  real(dp), parameter :: arbitraryConstant = 0.1_dp

contains


  !> Initialise the density matrix container
  subroutine TDensityMatrix_init(this, iDensityMatrixAlgorithm)

    !> Instance
    type(TDensityMatrix), intent(out) :: this

    !> Density matrix generation method
    integer, intent(in) :: iDensityMatrixAlgorithm

    this%iDensityMatrixAlgorithm = iDensityMatrixAlgorithm

  end subroutine TDensityMatrix_init


  !> Returns the density matrix
  subroutine getDensityMatrix_real(this, densityMatrix, eigenvecs, filling, errStatus)

    !> Instance
    class(TDensityMatrix), intent(in) :: this

    !> Resulting density matrix
    real(dp), intent(inout) :: densityMatrix(:,:)

    !> Eigenvectors of the system
    real(dp), intent(inout) :: eigenvecs(:,:)

    !> Occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Error status
    type(TStatus), intent(out) :: errStatus

    select case(this%iDensityMatrixAlgorithm)

    case (densityMatrixTypes%magma_fromEigenVecs)


  call errStatus%setError(-1, "Internal error, compiled without MAGMA, but this is requested for density matrix generation&
      & method", "src/dftbp/dftb/densitymatrix.F90", 141)
  return


    case (densityMatrixTypes%fromEigenVecs)

      call fullDensityMatrix_real(densityMatrix, eigenvecs, filling)

    case (densityMatrixTypes%elecSolverProvided)

      return

    case (densityMatrixTypes%none)

      densityMatrix(:,:) = 0.0_dp

    case default

  call errStatus%setError(-1, "Internal error, unknown density matrix generation method", "src/dftbp/dftb/densitymatrix.F90", 160)
  return

    end select

  end subroutine getDensityMatrix_real


  !> Returns the energy weighted density matrix
  subroutine getEDensityMatrix_real(this, egyDensityMatrix, eigenvecs, filling, eigenvals,&
      & errStatus)

    !> Instance
    class(TDensityMatrix), intent(in) :: this

    !> Resulting density matrix
    real(dp), intent(inout) :: egyDensityMatrix(:,:)

    !> Eigenvectors of the system
    real(dp), intent(inout) :: eigenvecs(:,:)

    !> Occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Eigenvalues of the system
    real(dp), intent(in) :: eigenvals(:)

    !> Error status
    type(TStatus), intent(out) :: errStatus

    select case(this%iDensityMatrixAlgorithm)

    case (densityMatrixTypes%magma_fromEigenVecs)


  call errStatus%setError(-1, "Internal error, compiled without MAGMA, but this is requested for energy weighted density matrix&
      & generation method", "src/dftbp/dftb/densitymatrix.F90", 200)
  return


    case (densityMatrixTypes%fromEigenVecs)

      call fullEnergyDensityMatrix_real(egyDensityMatrix, eigenvecs, filling, eigenvals)

    case (densityMatrixTypes%elecSolverProvided)

      return

    case (densityMatrixTypes%none)

      egyDensityMatrix(:,:) = 0.0_dp

    case default

  call errStatus%setError(-1, "Internal error, unknown density matrix generation method", "src/dftbp/dftb/densitymatrix.F90", 219)
  return

    end select

  end subroutine getEDensityMatrix_real


  !> Returns the density matrix
  subroutine getDensityMatrix_cmplx(this, densityMatrix, eigenvecs, filling, errStatus)

    !> Instance
    class(TDensityMatrix), intent(in) :: this

    !> Resulting density matrix
    complex(dp), intent(inout) :: densityMatrix(:,:)

    !> Eigenvectors of the system
    complex(dp), intent(inout) :: eigenvecs(:,:)

    !> Occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Error status
    type(TStatus), intent(out) :: errStatus

    select case(this%iDensityMatrixAlgorithm)

    case (densityMatrixTypes%magma_fromEigenVecs)


  call errStatus%setError(-1, "Internal error, compiled without MAGMA, but this is requested for density matrix generation&
      & method", "src/dftbp/dftb/densitymatrix.F90", 255)
  return


    case (densityMatrixTypes%fromEigenVecs)

      call fullDensityMatrix_cmplx(densityMatrix, eigenvecs, filling)

    case (densityMatrixTypes%elecSolverProvided)

      return

    case (densityMatrixTypes%none)

      densityMatrix(:,:) = 0.0_dp

    case default

  call errStatus%setError(-1, "Internal error, unknown density matrix generation method", "src/dftbp/dftb/densitymatrix.F90", 274)
  return

    end select

  end subroutine getDensityMatrix_cmplx


  !> Returns the energy-weighted density matrix
  subroutine getEDensityMatrix_cmplx(this, egyDensityMatrix, eigenvecs, filling, eigenvals,&
      & errStatus)

    !> Instance
    class(TDensityMatrix), intent(in) :: this

    !> Resulting density matrix
    complex(dp), intent(inout) :: egyDensityMatrix(:,:)

    !> Eigenvectors of the system
    complex(dp), intent(inout) :: eigenvecs(:,:)

    !> Occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Eigenvalues of the system
    real(dp), intent(in) :: eigenvals(:)

    !> Error status
    type(TStatus), intent(out) :: errStatus

    select case(this%iDensityMatrixAlgorithm)

    case (densityMatrixTypes%magma_fromEigenVecs)


  call errStatus%setError(-1, "Internal error, compiled without MAGMA, but this is requested for density matrix generation&
      & method", "src/dftbp/dftb/densitymatrix.F90", 314)
  return


    case (densityMatrixTypes%fromEigenVecs)

      call fullEnergyDensityMatrix_cmplx(egyDensityMatrix, eigenvecs, filling, eigenvals)

    case (densityMatrixTypes%elecSolverProvided)

      return

    case (densityMatrixTypes%none)

      egyDensityMatrix(:,:) = cmplx(0,0,dp)

    case default

  call errStatus%setError(-1, "Internal error, unknown density matrix generation method", "src/dftbp/dftb/densitymatrix.F90", 333)
  return

    end select

  end subroutine getEDensityMatrix_cmplx


  !> Transforms dense, square density matrix for all spins/k-points to real-space (BvK cell).
  subroutine transformDualSpaceToBvKRealSpace(rhoDual, parallelKS, kPoint, kWeight, bvKShifts,&
      & rhoBvK)

    !> Complex, dense, square dual-space rho of all spins/k-points
    complex(dp), intent(in) :: rhoDual(:,:,:)

    !> The k-points and spins to process
    type(TParallelKS), intent(in) :: parallelKS

    !> The k-points in relative units
    real(dp), intent(in) :: kPoint(:,:)

    !> Weights of k-points
    real(dp), intent(in) :: kWeight(:)

    !> The k-point compatible BvK real-space shifts in relative coordinates (units of latVecs)
    real(dp), intent(in) :: bvKShifts(:,:)

    !> Real-space, dense, square rho for BvK cell
    real(dp), intent(inout) :: rhoBvK(:,:,:,:,:,:)

    !! K-point-spin composite index and k-point/spin index
    integer :: iKS, iK, iSpin

    !! Iterates over all BvK real-space vectors
    integer :: iG

    !! Phase factor
    complex(dp) :: phase

    !! Integer BvK real-space shift translated to density matrix indices
    integer :: bvKIndex(3)

    do iG = 1, size(bvKShifts, dim=2)
      bvKIndex(:) = nint(bvKShifts(:, iG)) + 1
      do iKS = 1, parallelKS%nLocalKS
        iK = parallelKS%localKS(1, iKS)
        iSpin = parallelKS%localKS(2, iKS)
        phase = exp(-imag * dot_product(2.0_dp * pi * kPoint(:, iK), bvKShifts(:, iG)))
        rhoBvK(:,:, bvKIndex(1), bvKIndex(2), bvKIndex(3), iSpin)&
            & = rhoBvK(:,:, bvKIndex(1), bvKIndex(2), bvKIndex(3), iSpin)&
            & + kWeight(iK) * real(rhoDual(:,:, iKS) * phase, dp)
      end do
    end do

  end subroutine transformDualSpaceToBvKRealSpace


  !> Make a regular density matrix for the real wave-function case
  !> Note: In order to save memory, the eigenvectors (which should be intent(in) parameters) are
  !> overwritten and then restored again
  subroutine fullDensityMatrix_real(dm, eigenvecs, filling)

    !> The resulting nOrb*nOrb density matrix
    real(dp), intent(out) :: dm(:,:)

    !> The eigenvectors of the system
    real(dp), intent(inout) :: eigenvecs(:,:)

    !> The occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    integer :: ii, nLevels
    real(dp) :: shift





    dm(:,:) = 0.0_dp
    do ii =  size(filling), 1, -1
      nLevels = ii
      if (abs(filling(ii)) >= epsilon(1.0_dp)) then
        exit
      end if
    end do
    shift = minval(filling(1:nLevels))
    if (shift > epsilon(1.0_dp)) then
      ! all fillings are definitely positive

      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(filling(ii)) * eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels))
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(filling(ii))
      end do
      !$OMP  END PARALLEL DO

    else

      ! shift matrix so that filling operations are positive
      call herk(dm, eigenvecs(:,1:nLevels))
      shift = shift - arbitraryConstant
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(filling(ii)-shift) * eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), beta=shift)
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(filling(ii)-shift)
      end do
      !$OMP  END PARALLEL DO

    end if
  end subroutine fullDensityMatrix_real


  !> Make a regular density matrix for the complex wave-function case
  !> Note: in order to save memory, the eigenvectors (which should be intent(in) parameters) are
  !> overwritten and then restored again
  subroutine fullDensityMatrix_cmplx(dm, eigenvecs, filling)

    !> The resulting nOrb*nOrb density matrix
    complex(dp), intent(out) :: dm(:,:)

    !> The eigenvectors of the system
    complex(dp), intent(inout) :: eigenvecs(:,:)

    !> The occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    integer :: ii, nLevels
    real(dp) :: shift





    dm(:,:) = cmplx(0.0_dp,0.0_dp,dp)

    do ii =  size(filling), 1, -1
      nLevels = ii
      if (abs(filling(ii)) >= epsilon(1.0_dp)) then
        exit
      end if
    end do
    shift = minval(filling(1:nLevels))
    if (shift > epsilon(1.0_dp)) then
      ! all fillings are definitely positive
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(filling(ii))*eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels))
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(filling(ii))
      end do
      !$OMP  END PARALLEL DO

    else
      ! shift matrix so that filling operations are positive
      call herk(dm, eigenvecs(:,1:nLevels))
      shift = shift - arbitraryConstant
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(filling(ii)-shift)*eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), beta=shift)
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(filling(ii)-shift)
      end do
      !$OMP  END PARALLEL DO

    end if

  end subroutine fullDensityMatrix_cmplx


  !> Make an energy weighted density matrix for the real wave-function case
  !> Note: in order to save memory, the eigenvectors (which should be intent(in) parameters) are
  !> overwritten and then restored again
  subroutine fullEnergyDensityMatrix_real(dm, eigenvecs, filling, eigen)

    !> The resulting nOrb*nOrb density matrix
    real(dp), intent(out) :: dm(:,:)

    !> The eigenvectors of the system
    real(dp), intent(inout) :: eigenvecs(:,:)

    !> The occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Eigenvalues of the system
    real(dp), intent(in) :: eigen(:)

    integer :: ii, nLevels
    real(dp) :: shift
    real(dp) :: fillProduct(size(filling))






    dm(:,:) = 0.0_dp
    do ii =  size(filling), 1, -1
      nLevels = ii
      if (abs(filling(ii)) >= epsilon(1.0_dp)) then
        exit
      end if
    end do
    fillProduct(1:nLevels) = filling(1:nLevels) * eigen(1:nLevels)
    if ((minval(fillProduct(1:nLevels)) < 0.0_dp&
        & .eqv. maxval(fillProduct(1:nLevels)) < 0.0_dp)&
        & .and. abs(minval(fillProduct(1:nLevels))) > epsilon(1.0_dp)&
        & .and. abs(maxval(fillProduct(1:nLevels))) > epsilon(1.0_dp)) then
      ! all fillings the same sign, and fairly large

      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(abs(fillProduct(ii)))*eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), alpha=sign(1.0_dp, maxval(fillProduct(1:nLevels))))
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(abs(fillProduct(ii)))
      end do
      !$OMP  END PARALLEL DO

    else

      ! shift matrix so that filling operations are positive
      call herk(dm, eigenvecs(:,1:nLevels))
      shift = minval(fillProduct(1:nLevels)) - arbitraryConstant
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(fillProduct(ii)-shift) * eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), beta=shift)
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(fillProduct(ii)-shift)
      end do
      !$OMP  END PARALLEL DO

    end if
  end subroutine fullEnergyDensityMatrix_real


  !> Make an energy weighted density matrix for the complex wave-function case
  !> Note: in order to save memory, the eigenvectors (which should be intent(in) parameters) are
  !> overwritten and then restored again
  subroutine fullEnergyDensityMatrix_cmplx(dm, eigenvecs, filling, eigen)

    !> The resulting nOrb*nOrb density matrix
    complex(dp), intent(out) :: dm(:,:)

    !> The eigenvectors of the system
    complex(dp), intent(inout) :: eigenvecs(:,:)

    !> The occupation numbers of the orbitals
    real(dp), intent(in) :: filling(:)

    !> Eigenvalues of the system
    real(dp), intent(in) :: eigen(:)

    integer :: ii, nLevels
    real(dp) :: shift
    real(dp) :: fillProduct(size(filling))






    dm(:,:) = cmplx(0.0_dp,0.0_dp,dp)

    do ii =  size(filling), 1, -1
      nLevels = ii
      if (abs(filling(ii)) >= epsilon(1.0_dp)) then
        exit
      end if
    end do

    fillProduct(1:nLevels) = filling(1:nLevels) * eigen(1:nLevels)
    if ((minval(fillProduct(1:nLevels)) < 0.0_dp&
        & .eqv. maxval(fillProduct(1:nLevels)) < 0.0_dp)&
        & .and. abs(minval(fillProduct(1:nLevels))) > epsilon(1.0_dp)&
        & .and. abs(maxval(fillProduct(1:nLevels))) > epsilon(1.0_dp)) then
      ! all fillings the same sign, and fairly large
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(abs(fillProduct(ii))) * eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), alpha=sign(1.0_dp, maxval(fillProduct(1:nLevels))))
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(abs(fillProduct(ii)))
      end do
      !$OMP  END PARALLEL DO

    else

      ! shift matrix so that filling operations are positive
      call herk(dm, eigenvecs(:,1:nLevels))
      shift = minval(fillProduct(1:nLevels)) - arbitraryConstant
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = sqrt(fillProduct(ii)-shift)*eigenvecs(:,ii)
      end do
      !$OMP  END PARALLEL DO

      call herk(dm, eigenvecs(:,1:nLevels), beta=shift)
      !$OMP PARALLEL DO DEFAULT(SHARED) PRIVATE(ii) SCHEDULE(RUNTIME)
      do ii = 1, nLevels
        eigenvecs(:,ii) = eigenvecs(:,ii) / sqrt(fillProduct(ii)-shift)
      end do
      !$OMP  END PARALLEL DO

    end if
  end subroutine fullEnergyDensityMatrix_cmplx


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Scalapack routines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Create density or energy weighted density matrix (real) for both triangles.
  subroutine makeDensityMtxRealBlacs(myBlacs, desc, filling, eigenVecs, densityMtx, eigenVals)

    !> BLACS grid information
    type(blacsgrid), intent(in) :: myBlacs

    !> Matrix descriptor
    integer, intent(in) :: desc(:)

    !> Occupations of levels
    real(dp), target, intent(in) :: filling(:)

    !> Eigenvectors of system
    real(dp), intent(inout) :: eigenVecs(:,:)

    !> Resulting (symmetric) density matrix
    real(dp), intent(out) :: densityMtx(:,:)

    !> Eigenvalues, if energy weighted density matrix required
    real(dp), intent(in), optional :: eigenVals(:)

    integer  :: ii, jj, iGlob, iLoc, blockSize
    type(blocklist) :: blocks
    real(dp), allocatable :: work(:,:)

    densityMtx(:, :) = 0.0_dp
    work = densityMtx

    ! Scale a copy of the eigenvectors
    call blocks%init(myBlacs, desc, "c")
    if (present(eigenVals)) then
      do ii = 1, size(blocks)
        call blocks%getblock(ii, iGlob, iLoc, blockSize)
        do jj = 0, blockSize - 1
          work(:, iLoc + jj) = eigenVecs(:, iLoc + jj) * eigenVals(iGlob + jj) * filling(iGlob + jj)
        end do
      end do
    else
      do ii = 1, size(blocks)
        call blocks%getblock(ii, iGlob, iLoc, blockSize)
        do jj = 0, blockSize - 1
          work(:, iLoc + jj) = eigenVecs(:, iLoc + jj) * filling(iGlob + jj)
        end do
      end do
    end if

    ! Create matrix
    call pblasfx_pgemm(eigenVecs, desc, work, desc, densityMtx, desc, transb="T")

  end subroutine makeDensityMtxRealBlacs


  !> Create density or energy weighted density matrix (complex) for both triangles.
  subroutine makeDensityMtxCplxBlacs(myBlacs, desc, filling, eigenVecs, densityMtx, eigenVals)

    !> BLACS grid information
    type(blacsgrid), intent(in) :: myBlacs

    !> Matrix descriptor
    integer, intent(in) :: desc(:)

    !> Occupations of levels
    real(dp), target, intent(in) :: filling(:)

    !> Eigenvectors of system
    complex(dp), intent(inout) :: eigenVecs(:,:)

    !> Resulting (symmetric) density matrix
    complex(dp), intent(out) :: densityMtx(:,:)

    !> Eigenvalues, if energy weighted density matrix required
    real(dp), intent(in), optional :: eigenVals(:)

    integer  :: ii, jj, iGlob, iLoc, blockSize
    type(blocklist) :: blocks
    complex(dp), allocatable :: work(:,:)

    densityMtx(:, :) = cmplx(0,0,dp)
    work = densityMtx

    ! Scale a copy of the eigenvectors
    call blocks%init(myBlacs, desc, "c")
    if (present(eigenVals)) then
      do ii = 1, size(blocks)
        call blocks%getblock(ii, iGlob, iLoc, blockSize)
        do jj = 0, blockSize - 1
          work(:, iLoc + jj) = eigenVecs(:, iLoc + jj) * eigenVals(iGlob + jj) * filling(iGlob + jj)
        end do
      end do
    else
      do ii = 1, size(blocks)
        call blocks%getblock(ii, iGlob, iLoc, blockSize)
        do jj = 0, blockSize - 1
          work(:, iLoc + jj) = eigenVecs(:, iLoc + jj) * filling(iGlob + jj)
        end do
      end do
    end if

    ! Create matrix
    call pblasfx_pgemm(eigenVecs, desc, work, desc, densityMtx, desc, transb="C")
    ! hermitian symmetrize
    work(:,:) = densityMtx
    call pblasfx_ptranc(work, desc, densityMtx, desc, alpha=(0.5_dp,0.0_dp), beta=(0.5_dp,0.0_dp))

  end subroutine makeDensityMtxCplxBlacs



end module dftbp_dftb_densitymatrix
