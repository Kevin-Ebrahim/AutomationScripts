# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90" 2
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"

!> Contains an Anderson mixer.
!!
!! The Anderson mixing is done by building a special average over the previous input charges and
!! over the previous charge differences separately and then linear mixing the two averaged vectors
!! with a given mixing parameter.
!! Only a specified amount of previous charges/densities are considered.
!! In order to use the mixer you have to create and reset it.
module dftbp_mixer_andersonmixer
  use dftbp_common_accuracy, only : dp
  use dftbp_math_lapackroutines, only : gesv
  use dftbp_mixer_mixer, only : TMixerCmplx, TMixerReal
  implicit none

  private
  public :: TAndersonMixerInp
  public :: TAndersonMixerReal, TAndersonMixerReal_init
  public :: TAndersonMixerCmplx, TAndersonMixerCmplx_init

  type :: TAndersonMixerInp
    !> Nr. of generations (including actual) to consider
    integer :: iGenerations = 0

    !> Mixing parameter for the general case
    real(dp) :: mixParam = 0.0_dp

    !> Mixing parameter for the first iGenerations-1 cycles
    real(dp) :: initMixParam = 0.01_dp

    !> Convergence dependent mixing parameters.
    !! Given as 2 by n array of tolerance and mixing factors pairs.
    !! The tolerances (Euclidean norm of the charge diff. vector) must follow each
    !! Other in decreasing order. (optional, set nConvMixParam to negative or 0 to disable)
    !! Mixing parameters given here eventually override mixParam or initMixParam.
    real(dp), allocatable :: convMixParam(:,:)

    !> Nr. of convergence dependent mixing parameters
    integer :: nConvMixParam = -1

    !> Symmetry breaking parameter.
    !! Diagonal elements of the system of linear equations are multiplied by (1.0+omega0**2).
    !! [optional, negative or 0 to disable.]
    real(dp) :: omega0 = 1.0e-2_dp

  end type TAndersonMixerInp


# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"
  !> Contains the necessary data for an Anderson mixer
  !!
  !! For efficiency reasons this derived type also contains the data for the limited memory storage,
  !! which stores a given number of recent vector pairs. The storage should be accessed as an array
  !! with the help of the indx(:) array. Indx(1) gives the index for the most recent stored vector
  !! pairs. (LIFO)
  type, extends (TMixerCmplx) :: TAndersonMixerCmplx
    private

    !> General mixing parameter
    real(dp) :: mixParam

    !> Initial mixing parameter
    real(dp) :: initMixParam

    !> Convergence dependent mixing parameters
    real(dp), allocatable :: convMixParam(:,:)

    !> Symmetry breaking parameter
    real(dp) :: omega02

    !> Should symmetry be broken?
    logical :: tBreakSym

    !> Nr. of convergence dependent mixing parameters
    integer :: nConvMixParam

    !> Max. nr. of stored prev. vectors
    integer :: mPrevVector

    !> Nr. of stored previous vectors
    integer :: nPrevVector

    !> Nr. of elements in the vectors
    integer :: nElem

    !> Index array for the storage
    integer, allocatable :: indx(:)

    !> Stored previous input charges
    complex(dp), allocatable :: prevQInput(:,:)

    !> Stored prev. charge differences
    complex(dp), allocatable :: prevQDiff(:,:)

    contains
      procedure :: reset => TAndersonMixerCmplx_reset
      procedure :: mix1D => TAndersonMixerCmplx_mix
  end type TAndersonMixerCmplx

# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"
  !> Contains the necessary data for an Anderson mixer
  !!
  !! For efficiency reasons this derived type also contains the data for the limited memory storage,
  !! which stores a given number of recent vector pairs. The storage should be accessed as an array
  !! with the help of the indx(:) array. Indx(1) gives the index for the most recent stored vector
  !! pairs. (LIFO)
  type, extends (TMixerReal) :: TAndersonMixerReal
    private

    !> General mixing parameter
    real(dp) :: mixParam

    !> Initial mixing parameter
    real(dp) :: initMixParam

    !> Convergence dependent mixing parameters
    real(dp), allocatable :: convMixParam(:,:)

    !> Symmetry breaking parameter
    real(dp) :: omega02

    !> Should symmetry be broken?
    logical :: tBreakSym

    !> Nr. of convergence dependent mixing parameters
    integer :: nConvMixParam

    !> Max. nr. of stored prev. vectors
    integer :: mPrevVector

    !> Nr. of stored previous vectors
    integer :: nPrevVector

    !> Nr. of elements in the vectors
    integer :: nElem

    !> Index array for the storage
    integer, allocatable :: indx(:)

    !> Stored previous input charges
    real(dp), allocatable :: prevQInput(:,:)

    !> Stored prev. charge differences
    real(dp), allocatable :: prevQDiff(:,:)

    contains
      procedure :: reset => TAndersonMixerReal_reset
      procedure :: mix1D => TAndersonMixerReal_mix
  end type TAndersonMixerReal

# 109 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"

contains

# 113 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"

  !> Initializes an Anderson mixer instance.
  subroutine TAndersonMixerCmplx_init(this, mixerInp)

    !> Initialized Anderson mixer on exit
    type(TAndersonMixerCmplx), intent(out) :: this

    !> TAndersonMixer Input struct
    type(TAndersonMixerInp), intent(in) :: mixerInp



    this%nElem = 0
    this%mPrevVector = mixerInp%iGenerations - 1

    allocate(this%prevQInput(this%nElem, this%mPrevVector))
    allocate(this%prevQDiff(this%nElem, this%mPrevVector))
    allocate(this%indx(this%mPrevVector))

    this%mixParam = mixerInp%mixParam
    this%initMixParam = mixerInp%initMixParam

    if (mixerInp%nConvMixParam > 0) then

      this%nConvMixParam = size(mixerInp%convMixParam, dim=2)
      allocate(this%convMixParam(2, this%nConvMixParam))
      this%convMixParam(:,:) = mixerInp%convMixParam
    else
      this%nConvMixParam = 0
    end if

    if (mixerInp%omega0 > 0) then
      this%omega02 = mixerInp%omega0**2
      this%tBreakSym = .true.
    else
      this%omega02 = 0.0_dp
      this%tBreakSym = .false.
    end if

  end subroutine TAndersonMixerCmplx_init


  !> Makes the mixer ready for a new SCC cycle.
  subroutine TAndersonMixerCmplx_reset(this, nElem)

    !> Anderson mixer instance
    class(TAndersonMixerCmplx), intent(inout) :: this

    !> Nr. of elements in the vectors to mix
    integer, intent(in) :: nElem

    integer :: ii



    if (nElem /= this%nElem) then
      this%nElem = nElem
      deallocate(this%prevQInput)
      deallocate(this%prevQDiff)
      allocate(this%prevQInput(this%nElem, this%mPrevVector))
      allocate(this%prevQDiff(this%nElem, this%mPrevVector))
    end if
    this%nPrevVector = -1
    ! Create index array for accessing elements in the LIFO way
    do ii = 1, this%mPrevVector
      this%indx(ii) = this%mPrevVector + 1 - ii
    end do

  end subroutine TAndersonMixerCmplx_reset


  !> Mixes charges according to the Anderson method.
  !!
  !! Warning: The complex-valued Anderson mixer requires flattened hermitian matrices as input.
  !!   You are free to permute the individual elements of the flattened arrays as long as the same
  !!   permutation is applied to qInpResult and qDiff.
  !!   The restriction arises from the assumption that the dot-products of density matrices are
  !!   real-valued (imaginary parts add up to zero due to the hermitian property) and the linear
  !!   system of equations remains real-valued.
  subroutine TAndersonMixerCmplx_mix(this, qInpResult, qDiff)

    !> Anderson mixer
    class(TAndersonMixerCmplx), intent(inout) :: this

    !> Input charges on entry, mixed charges on exit.
    complex(dp), intent(inout) :: qInpResult(:)

    !> Charge difference
    complex(dp), intent(in) :: qDiff(:)

    complex(dp), allocatable :: qInpMiddle(:), qDiffMiddle(:)
    real(dp) :: mixParam
    real(dp) :: rTmp
    integer :: ii




    if (this%nPrevVector < this%mPrevVector) then
      this%nPrevVector = this%nPrevVector + 1
      mixParam = this%initMixParam
    else
      mixParam = this%mixParam
    end if

    ! Determine mixing parameter
    rTmp = sqrt(sum(abs(qDiff)**2))
    do ii = this%nConvMixParam, 1, -1
      if (rTmp < this%convMixParam(1, ii)) then
        mixParam = this%convMixParam(2, ii)
        exit
      end if
    end do

    ! First iteration: store vectors and return simple mixed vector
    if (this%nPrevVector == 0) then
      call storeVectors_cmplx(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
          & this%mPrevVector)
      qInpResult(:) = qInpResult + this%initMixParam * qDiff
      return
    end if

    allocate(qInpMiddle(this%nElem))
    allocate(qDiffMiddle(this%nElem))

    ! Calculate average input charges and average charge differences
    call calcAndersonAverages_cmplx(qInpMiddle, qDiffMiddle, qInpResult, qDiff, this%prevQInput,&
        & this%prevQDiff, this%nElem, this%nPrevVector, this%indx, this%tBreakSym, this%omega02)

    ! Store vectors before overwriting qInpResult
    call storeVectors_cmplx(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
        & this%mPrevVector)

    ! Mix averaged input charge and average charge difference
    qInpResult(:) = qInpMiddle + mixParam * qDiffMiddle

  end subroutine TAndersonMixerCmplx_mix


  !> Calculates averages input charges and average charge differences according to the Anderson
  !! method.
  !!
  !! Note: The symmetry breaking is not exactly the same as in the paper of Eyert, because here it
  !! is applied to the diagonal of the "original" matrix built from the Fs and not of the "modified"
  !! matrix built from the DFs.
  subroutine calcAndersonAverages_cmplx(qInpMiddle, qDiffMiddle, qInput, qDiff, prevQInp,&
      & prevQDiff, nElem, nPrevVector, indx, tBreakSym, omega02)

    !> Contains average input charge on exit
    complex(dp), intent(out) :: qInpMiddle(:)

    !> Contains averages charge difference on exit
    complex(dp), intent(out) :: qDiffMiddle(:)

    !> Input charge in the last iteration
    complex(dp), intent(in) :: qInput(:)

    !> Charge difference in the last iteration
    complex(dp), intent(in) :: qDiff(:)

    !> Input charges of the previous iterations
    complex(dp), intent(in) :: prevQInp(:,:)

    !> Charge differences of the previous iterations
    complex(dp), intent(in) :: prevQDiff(:,:)

    !> Nr. of elements in the charge vectors
    integer, intent(in) :: nElem

    !> Nr. of previous iterations stored
    integer, intent(in) :: nPrevVector

    !> Index array describing the reverse storage order
    integer, intent(in) :: indx(:)

    !> If symmetry of linear equation system should be broken
    logical, intent(in) :: tBreakSym

    !> Symmetry breaking constant
    real(dp), intent(in) :: omega02

    complex(dp), allocatable :: tmp1(:)
    real(dp), allocatable :: aa(:,:), bb(:,:)
    real(dp) :: tmp2
    integer :: ii, jj











    allocate(aa(nPrevVector, nPrevVector))
    allocate(bb(nPrevVector, 1))
    allocate(tmp1(nElem))

    ! Build the system of linear equations
    ! a(i,j) = <F(m)|F(m)-F(m-i)> - <F(m-j)|F(m)-F(m-i)>  (F ~ qDiff)
    ! b(i)   = <F(m)|F(m)-F(m-i)>                         (m ~ current iter.)
    ! Index array serves reverse indexing: indx(1) means most recent vector
    ! (due to the hermitian property of our density matrices, the dot-products below are real)
    do ii = 1, nPrevVector
      tmp1(:) = qDiff - prevQDiff(:, indx(ii))
      tmp2 = dot_product(qDiff, tmp1)
      bb(ii, 1) = tmp2
      do jj = 1, nPrevVector
        aa(ii, jj) = tmp2 - dot_product(prevQDiff(:, indx(jj)), tmp1)
      end do
    end do

    ! Prevent equations from being linearly dependent if desired
    if (tBreakSym) then
      tmp2 = (1.0_dp + omega02)
      do ii = 1, nPrevVector
        aa(ii, ii) =  tmp2 * aa(ii, ii)
      end do
    end if

    ! Solve system of linear equations
    call gesv(aa, bb)

    ! Build averages with calculated coefficients
    qDiffMiddle(:) = 0.0_dp
    do ii = 1, nPrevVector
      qDiffMiddle(:) = qDiffMiddle + bb(ii, 1) * prevQDiff(:, indx(ii))
    end do
    qDiffMiddle(:) = qDiffMiddle + (1.0_dp - sum(bb(:, 1))) * qDiff

    qInpMiddle(:) = 0.0_dp
    do ii = 1, nPrevVector
      qInpMiddle(:) = qInpMiddle + bb(ii, 1) * prevQInp(:, indx(ii))
    end do
    qInpMiddle(:) = qInpMiddle + (1.0_dp - sum(bb(:, 1))) * qInput

  end subroutine calcAndersonAverages_cmplx


  !> Stores a vector pair in a limited storage.
  !! If the stack is full, the oldest vector pair is overwritten.
  subroutine storeVectors_cmplx(prevQInp, prevQDiff, indx, qInput, qDiff, mPrevVector)

    !> Contains previous vectors of the first type
    complex(dp), intent(inout) :: prevQInp(:,:)

    !> Contains previous vectors of the second type
    complex(dp), intent(inout) :: prevQDiff(:,:)

    !> Indexing array to the stacks
    integer, intent(inout) :: indx(:)

    !> New first vector
    complex(dp), intent(in) :: qInput(:)

    !> New second vector
    complex(dp), intent(in) :: qDiff(:)

    !> Size of the stacks
    integer, intent(in) :: mPrevVector

    integer :: tmp

    tmp = indx(mPrevVector)
    indx(2:mPrevVector) = indx(1:mPrevVector - 1)
    indx(1) = tmp
    prevQInp(:, indx(1)) = qInput
    prevQDiff(:, indx(1)) = qDiff

  end subroutine storeVectors_cmplx

# 113 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"

  !> Initializes an Anderson mixer instance.
  subroutine TAndersonMixerReal_init(this, mixerInp)

    !> Initialized Anderson mixer on exit
    type(TAndersonMixerReal), intent(out) :: this

    !> TAndersonMixer Input struct
    type(TAndersonMixerInp), intent(in) :: mixerInp



    this%nElem = 0
    this%mPrevVector = mixerInp%iGenerations - 1

    allocate(this%prevQInput(this%nElem, this%mPrevVector))
    allocate(this%prevQDiff(this%nElem, this%mPrevVector))
    allocate(this%indx(this%mPrevVector))

    this%mixParam = mixerInp%mixParam
    this%initMixParam = mixerInp%initMixParam

    if (mixerInp%nConvMixParam > 0) then

      this%nConvMixParam = size(mixerInp%convMixParam, dim=2)
      allocate(this%convMixParam(2, this%nConvMixParam))
      this%convMixParam(:,:) = mixerInp%convMixParam
    else
      this%nConvMixParam = 0
    end if

    if (mixerInp%omega0 > 0) then
      this%omega02 = mixerInp%omega0**2
      this%tBreakSym = .true.
    else
      this%omega02 = 0.0_dp
      this%tBreakSym = .false.
    end if

  end subroutine TAndersonMixerReal_init


  !> Makes the mixer ready for a new SCC cycle.
  subroutine TAndersonMixerReal_reset(this, nElem)

    !> Anderson mixer instance
    class(TAndersonMixerReal), intent(inout) :: this

    !> Nr. of elements in the vectors to mix
    integer, intent(in) :: nElem

    integer :: ii



    if (nElem /= this%nElem) then
      this%nElem = nElem
      deallocate(this%prevQInput)
      deallocate(this%prevQDiff)
      allocate(this%prevQInput(this%nElem, this%mPrevVector))
      allocate(this%prevQDiff(this%nElem, this%mPrevVector))
    end if
    this%nPrevVector = -1
    ! Create index array for accessing elements in the LIFO way
    do ii = 1, this%mPrevVector
      this%indx(ii) = this%mPrevVector + 1 - ii
    end do

  end subroutine TAndersonMixerReal_reset


  !> Mixes charges according to the Anderson method.
  !!
  !! Warning: The complex-valued Anderson mixer requires flattened hermitian matrices as input.
  !!   You are free to permute the individual elements of the flattened arrays as long as the same
  !!   permutation is applied to qInpResult and qDiff.
  !!   The restriction arises from the assumption that the dot-products of density matrices are
  !!   real-valued (imaginary parts add up to zero due to the hermitian property) and the linear
  !!   system of equations remains real-valued.
  subroutine TAndersonMixerReal_mix(this, qInpResult, qDiff)

    !> Anderson mixer
    class(TAndersonMixerReal), intent(inout) :: this

    !> Input charges on entry, mixed charges on exit.
    real(dp), intent(inout) :: qInpResult(:)

    !> Charge difference
    real(dp), intent(in) :: qDiff(:)

    real(dp), allocatable :: qInpMiddle(:), qDiffMiddle(:)
    real(dp) :: mixParam
    real(dp) :: rTmp
    integer :: ii




    if (this%nPrevVector < this%mPrevVector) then
      this%nPrevVector = this%nPrevVector + 1
      mixParam = this%initMixParam
    else
      mixParam = this%mixParam
    end if

    ! Determine mixing parameter
    rTmp = sqrt(sum(abs(qDiff)**2))
    do ii = this%nConvMixParam, 1, -1
      if (rTmp < this%convMixParam(1, ii)) then
        mixParam = this%convMixParam(2, ii)
        exit
      end if
    end do

    ! First iteration: store vectors and return simple mixed vector
    if (this%nPrevVector == 0) then
      call storeVectors_real(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
          & this%mPrevVector)
      qInpResult(:) = qInpResult + this%initMixParam * qDiff
      return
    end if

    allocate(qInpMiddle(this%nElem))
    allocate(qDiffMiddle(this%nElem))

    ! Calculate average input charges and average charge differences
    call calcAndersonAverages_real(qInpMiddle, qDiffMiddle, qInpResult, qDiff, this%prevQInput,&
        & this%prevQDiff, this%nElem, this%nPrevVector, this%indx, this%tBreakSym, this%omega02)

    ! Store vectors before overwriting qInpResult
    call storeVectors_real(this%prevQInput, this%prevQDiff, this%indx, qInpResult, qDiff,&
        & this%mPrevVector)

    ! Mix averaged input charge and average charge difference
    qInpResult(:) = qInpMiddle + mixParam * qDiffMiddle

  end subroutine TAndersonMixerReal_mix


  !> Calculates averages input charges and average charge differences according to the Anderson
  !! method.
  !!
  !! Note: The symmetry breaking is not exactly the same as in the paper of Eyert, because here it
  !! is applied to the diagonal of the "original" matrix built from the Fs and not of the "modified"
  !! matrix built from the DFs.
  subroutine calcAndersonAverages_real(qInpMiddle, qDiffMiddle, qInput, qDiff, prevQInp,&
      & prevQDiff, nElem, nPrevVector, indx, tBreakSym, omega02)

    !> Contains average input charge on exit
    real(dp), intent(out) :: qInpMiddle(:)

    !> Contains averages charge difference on exit
    real(dp), intent(out) :: qDiffMiddle(:)

    !> Input charge in the last iteration
    real(dp), intent(in) :: qInput(:)

    !> Charge difference in the last iteration
    real(dp), intent(in) :: qDiff(:)

    !> Input charges of the previous iterations
    real(dp), intent(in) :: prevQInp(:,:)

    !> Charge differences of the previous iterations
    real(dp), intent(in) :: prevQDiff(:,:)

    !> Nr. of elements in the charge vectors
    integer, intent(in) :: nElem

    !> Nr. of previous iterations stored
    integer, intent(in) :: nPrevVector

    !> Index array describing the reverse storage order
    integer, intent(in) :: indx(:)

    !> If symmetry of linear equation system should be broken
    logical, intent(in) :: tBreakSym

    !> Symmetry breaking constant
    real(dp), intent(in) :: omega02

    real(dp), allocatable :: tmp1(:)
    real(dp), allocatable :: aa(:,:), bb(:,:)
    real(dp) :: tmp2
    integer :: ii, jj











    allocate(aa(nPrevVector, nPrevVector))
    allocate(bb(nPrevVector, 1))
    allocate(tmp1(nElem))

    ! Build the system of linear equations
    ! a(i,j) = <F(m)|F(m)-F(m-i)> - <F(m-j)|F(m)-F(m-i)>  (F ~ qDiff)
    ! b(i)   = <F(m)|F(m)-F(m-i)>                         (m ~ current iter.)
    ! Index array serves reverse indexing: indx(1) means most recent vector
    ! (due to the hermitian property of our density matrices, the dot-products below are real)
    do ii = 1, nPrevVector
      tmp1(:) = qDiff - prevQDiff(:, indx(ii))
      tmp2 = dot_product(qDiff, tmp1)
      bb(ii, 1) = tmp2
      do jj = 1, nPrevVector
        aa(ii, jj) = tmp2 - dot_product(prevQDiff(:, indx(jj)), tmp1)
      end do
    end do

    ! Prevent equations from being linearly dependent if desired
    if (tBreakSym) then
      tmp2 = (1.0_dp + omega02)
      do ii = 1, nPrevVector
        aa(ii, ii) =  tmp2 * aa(ii, ii)
      end do
    end if

    ! Solve system of linear equations
    call gesv(aa, bb)

    ! Build averages with calculated coefficients
    qDiffMiddle(:) = 0.0_dp
    do ii = 1, nPrevVector
      qDiffMiddle(:) = qDiffMiddle + bb(ii, 1) * prevQDiff(:, indx(ii))
    end do
    qDiffMiddle(:) = qDiffMiddle + (1.0_dp - sum(bb(:, 1))) * qDiff

    qInpMiddle(:) = 0.0_dp
    do ii = 1, nPrevVector
      qInpMiddle(:) = qInpMiddle + bb(ii, 1) * prevQInp(:, indx(ii))
    end do
    qInpMiddle(:) = qInpMiddle + (1.0_dp - sum(bb(:, 1))) * qInput

  end subroutine calcAndersonAverages_real


  !> Stores a vector pair in a limited storage.
  !! If the stack is full, the oldest vector pair is overwritten.
  subroutine storeVectors_real(prevQInp, prevQDiff, indx, qInput, qDiff, mPrevVector)

    !> Contains previous vectors of the first type
    real(dp), intent(inout) :: prevQInp(:,:)

    !> Contains previous vectors of the second type
    real(dp), intent(inout) :: prevQDiff(:,:)

    !> Indexing array to the stacks
    integer, intent(inout) :: indx(:)

    !> New first vector
    real(dp), intent(in) :: qInput(:)

    !> New second vector
    real(dp), intent(in) :: qDiff(:)

    !> Size of the stacks
    integer, intent(in) :: mPrevVector

    integer :: tmp

    tmp = indx(mPrevVector)
    indx(2:mPrevVector) = indx(1:mPrevVector - 1)
    indx(1) = tmp
    prevQInp(:, indx(1)) = qInput
    prevQDiff(:, indx(1)) = qDiff

  end subroutine storeVectors_real

# 387 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/mixer/andersonmixer.F90"

end module dftbp_mixer_andersonmixer
