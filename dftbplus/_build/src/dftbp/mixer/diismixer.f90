# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90" 2
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

!> Contains an DIIS mixer
!! The DIIS mixing is done by building a weighted combination over the previous input charges to
!! minimise the residue of the error.
!! Only a specified number of previous charge vectors are considered.
!! The modification based on from Kovalenko et al. (J. Comput. Chem., 20: 928-936 1999) and Patrick
!! Briddon to add a contribution from the gradient vector as well is also used.
!! In order to use the mixer you have to create and reset it.
module dftbp_mixer_diismixer
  use dftbp_common_accuracy, only : dp
  use dftbp_math_lapackroutines, only : gesv
  use dftbp_mixer_mixer, only : TMixerCmplx, TMixerReal
  implicit none

  private

  public :: TDiisMixerInp
  public :: TDiisMixerReal, TDiisMixerReal_init
  public :: TDiisMixerCmplx, TDiisMixerCmplx_init

  type :: TDiisMixerInp
    !> Nr. of generations (including actual) to consider
    integer :: iGenerations = 0

    !> Mixing parameter for the first iGenerations cycles
    real(dp) :: initMixParam = 0.0_dp

    !> True if using DIIS from iteration 2 as well as mixing
    logical :: tFromStart = .true.

    !> If > 0, fraction of extrapolated downhill direction to include in DIIS space
    real(dp) :: alpha = 0.0_dp

  end type TDiisMixerInp


# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

  !> Contains the necessary data for an DIIS mixer.
  type, extends (TMixerCmplx) :: TDiisMixerCmplx
    private

    !> Initial mixing parameter
    real(dp) :: initMixParam

    !> Max. nr. of stored prev. vectors
    integer :: mPrevVector

    !> Nr. of stored previous vectors
    integer :: iPrevVector

    !> Nr. of elements in the vectors
    integer :: nElem

    !> Index for the storage
    integer :: indx

    !> Stored previous input charges
    complex(dp), allocatable :: prevQInput(:,:)

    !> Stored prev. charge differences
    complex(dp), allocatable :: prevQDiff(:,:)

    !> True if DIIS used from iteration 2 as well as mixing
    logical :: tFromStart

    !> Force modification for gDIIS?
    logical :: tAddIntrpGradient

    !> Alpha factor to add in new information
    real(dp) :: alpha

    !> Holds DIIS mixed gradients from older iterations for downhill direction
    complex(dp), allocatable :: deltaR(:)

    contains
      procedure :: reset => TDiisMixerCmplx_reset
      procedure :: mix1D => TDiisMixerCmplx_mix
  end type TDiisMixerCmplx
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

  !> Contains the necessary data for an DIIS mixer.
  type, extends (TMixerReal) :: TDiisMixerReal
    private

    !> Initial mixing parameter
    real(dp) :: initMixParam

    !> Max. nr. of stored prev. vectors
    integer :: mPrevVector

    !> Nr. of stored previous vectors
    integer :: iPrevVector

    !> Nr. of elements in the vectors
    integer :: nElem

    !> Index for the storage
    integer :: indx

    !> Stored previous input charges
    real(dp), allocatable :: prevQInput(:,:)

    !> Stored prev. charge differences
    real(dp), allocatable :: prevQDiff(:,:)

    !> True if DIIS used from iteration 2 as well as mixing
    logical :: tFromStart

    !> Force modification for gDIIS?
    logical :: tAddIntrpGradient

    !> Alpha factor to add in new information
    real(dp) :: alpha

    !> Holds DIIS mixed gradients from older iterations for downhill direction
    real(dp), allocatable :: deltaR(:)

    contains
      procedure :: reset => TDiisMixerReal_reset
      procedure :: mix1D => TDiisMixerReal_mix
  end type TDiisMixerReal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"


contains

# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

  !> Initializes a DIIS mixer instance.
  subroutine TDiisMixerCmplx_init(this, mixerInp)

    !> Pointer to an initialized DIIS mixer on exit
    type(TDiisMixerCmplx), intent(out) :: this

    !> TDiisMixer input structure
    type(TDiisMixerInp), intent(in) :: mixerInp



    this%nElem = 0
    this%mPrevVector = mixerInp%iGenerations

    allocate(this%prevQInput(this%nElem, this%mPrevVector))
    allocate(this%prevQDiff(this%nElem, this%mPrevVector))

    this%initMixParam = mixerInp%initMixParam
    this%tFromStart = mixerInp%tFromStart


    if (mixerInp%alpha > 0.0_dp) then
      this%tAddIntrpGradient = .true.
      this%alpha = mixerInp%alpha
      allocate(this%deltaR(this%nElem))
    else
      this%tAddIntrpGradient = .false.
      this%alpha = 0.0_dp
      allocate(this%deltaR(0))
    end if

    this%deltaR(:) = 0.0_dp

  end subroutine TDiisMixerCmplx_init


  !> Makes the mixer ready for a new SCC cycle.
  subroutine TDiisMixerCmplx_reset(this, nElem)

    !> DIIS mixer instance
    class(TDiisMixerCmplx), intent(inout) :: this

    !> Nr. of elements in the vectors to mix
    integer, intent(in) :: nElem



    if (nElem /= this%nElem) then
      this%nElem = nElem
      deallocate(this%prevQInput)
      deallocate(this%prevQDiff)
      allocate(this%prevQInput(this%nElem, this%mPrevVector))
      allocate(this%prevQDiff(this%nElem, this%mPrevVector))
      if (this%tAddIntrpGradient) then
        deallocate(this%deltaR)
        allocate(this%deltaR(this%nElem))
        this%deltaR(:) = 0.0_dp
      end if
    end if
    this%iPrevVector = 0
    this%indx = 0

  end subroutine TDiisMixerCmplx_reset


  !> Mixes charges according to the DIIS method.
  !!
  !! Warning: The complex-valued DIIS mixer requires flattened hermitian matrices as input.
  !!   You are free to permute the individual elements of the flattened arrays as long as the same
  !!   permutation is applied to qInpResult and qDiff.
  !!   The restriction arises from the assumption that the dot-products of density matrices are
  !!   real-valued (imaginary parts add up to zero due to the hermitian property) and the linear
  !!   system of equations remains real-valued.
  subroutine TDiisMixerCmplx_mix(this, qInpResult, qDiff)

    !> Pointer to the diis mixer
    class(TDiisMixerCmplx), intent(inout) :: this

    !> Input charges on entry, mixed charges on exit.
    complex(dp), intent(inout) :: qInpResult(:)

    !> Charge difference vector between output and input charges
    complex(dp), intent(in) :: qDiff(:)

    real(dp), allocatable :: aa(:,:), bb(:,:)
    integer :: ii, jj




    if (this%iPrevVector < this%mPrevVector) then
      this%iPrevVector = this%iPrevVector + 1
    end if

    call storeVectors_cmplx(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
        & this%mPrevVector)

    if (this%tFromStart .or. this%iPrevVector == this%mPrevVector) then

      allocate(aa(this%iPrevVector + 1, this%iPrevVector + 1))
      allocate(bb(this%iPrevVector + 1, 1))

      aa(:,:) = 0.0_dp
      bb(:,:) = 0.0_dp

      ! (due to the hermitian property of our density matrices, the dot-product below is real)
      do ii = 1, this%iPrevVector
        do jj = 1, this%iPrevVector
          aa(ii, jj) = dot_product(this%prevQDiff(:, ii), this%prevQDiff(:, jj))
        end do
      end do
      aa(this%iPrevVector + 1, 1:this%iPrevVector) = -1.0_dp
      aa(1:this%iPrevVector, this%iPrevVector + 1) = -1.0_dp

      bb(this%iPrevVector + 1, 1) = -1.0_dp

      ! Solve DIIS system of linear equations
      call gesv(aa, bb)

      qInpResult(:) = 0.0_dp
      do ii = 1, this%iPrevVector
        qInpResult(:) = qInpResult + bb(ii, 1) * (this%prevQInput(:, ii) + this%prevQDiff(:, ii))
      end do

      if (this%tAddIntrpGradient) then
        ! old DIIS estimate for downhill direction points towards current downhill direction as well
        ! as the actual vector, based on P. Briddon comments
        if (abs(dot_product(this%deltaR, qDiff)) > 0.0_dp) then
          ! mix in larger amounts of the gradient in future
          this%alpha = 1.5_dp * this%alpha
        else
          ! points the other way, mix in less
          this%alpha = 0.5 * this%alpha
        end if

        ! add a fraction down the DIIS estimated gradient onto the new solution
        this%deltaR(:) = 0.0_dp
        do ii = 1, this%iPrevVector
          this%deltaR(:) = this%deltaR + bb(ii, 1) * this%prevQDiff(:, ii)
        end do
        qInpResult(:) = qInpResult - this%alpha * this%deltaR
      end if

    end if

    if (this%iPrevVector < this%mPrevVector) then
      ! First few iterations return simple mixed vector
      qInpResult(:) = qInpResult + this%initMixParam * qDiff
    end if

  end subroutine TDiisMixerCmplx_mix


  !> Stores a vector pair in a limited storage.
  !! If the stack is full, oldest vector pair is overwritten.
  subroutine storeVectors_cmplx(prevQInp, prevQDiff, indx, qInput, qDiff, mPrevVector)

    !> Contains previous vectors of the first type
    complex(dp), intent(inout) :: prevQInp(:,:)

    !> Contains previous vectors of the second type
    complex(dp), intent(inout) :: prevQDiff(:,:)

    !> Indexing of data
    integer, intent(inout) :: indx

    !> New first vector
    complex(dp), intent(in) :: qInput(:)

    !> New second vector
    complex(dp), intent(in) :: qDiff(:)

    !> Size of the stacks.
    integer, intent(in) :: mPrevVector

    indx = mod(indx, mPrevVector) + 1
    prevQInp(:, indx) = qInput
    prevQDiff(:, indx) = qDiff

  end subroutine storeVectors_cmplx
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

  !> Initializes a DIIS mixer instance.
  subroutine TDiisMixerReal_init(this, mixerInp)

    !> Pointer to an initialized DIIS mixer on exit
    type(TDiisMixerReal), intent(out) :: this

    !> TDiisMixer input structure
    type(TDiisMixerInp), intent(in) :: mixerInp



    this%nElem = 0
    this%mPrevVector = mixerInp%iGenerations

    allocate(this%prevQInput(this%nElem, this%mPrevVector))
    allocate(this%prevQDiff(this%nElem, this%mPrevVector))

    this%initMixParam = mixerInp%initMixParam
    this%tFromStart = mixerInp%tFromStart


    if (mixerInp%alpha > 0.0_dp) then
      this%tAddIntrpGradient = .true.
      this%alpha = mixerInp%alpha
      allocate(this%deltaR(this%nElem))
    else
      this%tAddIntrpGradient = .false.
      this%alpha = 0.0_dp
      allocate(this%deltaR(0))
    end if

    this%deltaR(:) = 0.0_dp

  end subroutine TDiisMixerReal_init


  !> Makes the mixer ready for a new SCC cycle.
  subroutine TDiisMixerReal_reset(this, nElem)

    !> DIIS mixer instance
    class(TDiisMixerReal), intent(inout) :: this

    !> Nr. of elements in the vectors to mix
    integer, intent(in) :: nElem



    if (nElem /= this%nElem) then
      this%nElem = nElem
      deallocate(this%prevQInput)
      deallocate(this%prevQDiff)
      allocate(this%prevQInput(this%nElem, this%mPrevVector))
      allocate(this%prevQDiff(this%nElem, this%mPrevVector))
      if (this%tAddIntrpGradient) then
        deallocate(this%deltaR)
        allocate(this%deltaR(this%nElem))
        this%deltaR(:) = 0.0_dp
      end if
    end if
    this%iPrevVector = 0
    this%indx = 0

  end subroutine TDiisMixerReal_reset


  !> Mixes charges according to the DIIS method.
  !!
  !! Warning: The complex-valued DIIS mixer requires flattened hermitian matrices as input.
  !!   You are free to permute the individual elements of the flattened arrays as long as the same
  !!   permutation is applied to qInpResult and qDiff.
  !!   The restriction arises from the assumption that the dot-products of density matrices are
  !!   real-valued (imaginary parts add up to zero due to the hermitian property) and the linear
  !!   system of equations remains real-valued.
  subroutine TDiisMixerReal_mix(this, qInpResult, qDiff)

    !> Pointer to the diis mixer
    class(TDiisMixerReal), intent(inout) :: this

    !> Input charges on entry, mixed charges on exit.
    real(dp), intent(inout) :: qInpResult(:)

    !> Charge difference vector between output and input charges
    real(dp), intent(in) :: qDiff(:)

    real(dp), allocatable :: aa(:,:), bb(:,:)
    integer :: ii, jj




    if (this%iPrevVector < this%mPrevVector) then
      this%iPrevVector = this%iPrevVector + 1
    end if

    call storeVectors_real(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
        & this%mPrevVector)

    if (this%tFromStart .or. this%iPrevVector == this%mPrevVector) then

      allocate(aa(this%iPrevVector + 1, this%iPrevVector + 1))
      allocate(bb(this%iPrevVector + 1, 1))

      aa(:,:) = 0.0_dp
      bb(:,:) = 0.0_dp

      ! (due to the hermitian property of our density matrices, the dot-product below is real)
      do ii = 1, this%iPrevVector
        do jj = 1, this%iPrevVector
          aa(ii, jj) = dot_product(this%prevQDiff(:, ii), this%prevQDiff(:, jj))
        end do
      end do
      aa(this%iPrevVector + 1, 1:this%iPrevVector) = -1.0_dp
      aa(1:this%iPrevVector, this%iPrevVector + 1) = -1.0_dp

      bb(this%iPrevVector + 1, 1) = -1.0_dp

      ! Solve DIIS system of linear equations
      call gesv(aa, bb)

      qInpResult(:) = 0.0_dp
      do ii = 1, this%iPrevVector
        qInpResult(:) = qInpResult + bb(ii, 1) * (this%prevQInput(:, ii) + this%prevQDiff(:, ii))
      end do

      if (this%tAddIntrpGradient) then
        ! old DIIS estimate for downhill direction points towards current downhill direction as well
        ! as the actual vector, based on P. Briddon comments
        if (abs(dot_product(this%deltaR, qDiff)) > 0.0_dp) then
          ! mix in larger amounts of the gradient in future
          this%alpha = 1.5_dp * this%alpha
        else
          ! points the other way, mix in less
          this%alpha = 0.5 * this%alpha
        end if

        ! add a fraction down the DIIS estimated gradient onto the new solution
        this%deltaR(:) = 0.0_dp
        do ii = 1, this%iPrevVector
          this%deltaR(:) = this%deltaR + bb(ii, 1) * this%prevQDiff(:, ii)
        end do
        qInpResult(:) = qInpResult - this%alpha * this%deltaR
      end if

    end if

    if (this%iPrevVector < this%mPrevVector) then
      ! First few iterations return simple mixed vector
      qInpResult(:) = qInpResult + this%initMixParam * qDiff
    end if

  end subroutine TDiisMixerReal_mix


  !> Stores a vector pair in a limited storage.
  !! If the stack is full, oldest vector pair is overwritten.
  subroutine storeVectors_real(prevQInp, prevQDiff, indx, qInput, qDiff, mPrevVector)

    !> Contains previous vectors of the first type
    real(dp), intent(inout) :: prevQInp(:,:)

    !> Contains previous vectors of the second type
    real(dp), intent(inout) :: prevQDiff(:,:)

    !> Indexing of data
    integer, intent(inout) :: indx

    !> New first vector
    real(dp), intent(in) :: qInput(:)

    !> New second vector
    real(dp), intent(in) :: qDiff(:)

    !> Size of the stacks.
    integer, intent(in) :: mPrevVector

    indx = mod(indx, mPrevVector) + 1
    prevQInp(:, indx) = qInput
    prevQDiff(:, indx) = qDiff

  end subroutine storeVectors_real
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/diismixer.F90"

end module dftbp_mixer_diismixer
