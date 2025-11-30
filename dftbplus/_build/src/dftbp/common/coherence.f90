# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90" 2
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp" 1
# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/error.fypp"
# 10 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90" 2

# 13 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 17 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"


# 21 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

!> Contains MPI coherence tests across a comm world
module dftbp_common_coherence
  use dftbp_common_accuracy, only : dp
  use dftbp_common_environment, only : TEnvironment
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  use dftbp_extlibs_mpifx, only : MPI_LAND, mpifx_allreduce, mpifx_bcast
# 32 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  implicit none

  private
  public :: exactCoherence, toleranceCoherence, checkExactCoherence, checkToleranceCoherence

  !> Check for coherence of data across processor(s)
  interface exactCoherence
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceR0
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceR1
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceR2
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceR3
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceC1
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceI0
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceI1
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceL0
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceL1
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceS0
# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end interface exactCoherence

  !> Check for coherence of data to a tolerance across processor(s)
  interface toleranceCoherence
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceR0
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceR1
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceR2
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceR3
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceC0
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceC1
# 49 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end interface toleranceCoherence

  !> Check exact coherence of data across processor(s) with error handling
  interface checkExactCoherence
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorR0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorR1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorR2
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorR3
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorC1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorI0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorI1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorL0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorL1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure coherenceWithErrorS0
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end interface checkExactCoherence

  !> Check coherence of data across processor(s) to a tolerance, with error handling
  interface checkToleranceCoherence
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorR0
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorR1
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorR2
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorR3
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorC0
# 61 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    module procedure approxCoherenceWithErrorC1
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end interface checkToleranceCoherence


contains

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceR0(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp) :: dataLocal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 112 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (dataLocal == data) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceR0

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorR0(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceR0(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorR0

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceR1(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal == data)) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceR1

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorR1(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceR1(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorR1

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceR2(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:,:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:,:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal == data)) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceR2

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorR2(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:,:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceR2(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorR2

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceR3(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:,:,:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:,:,:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal == data)) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceR3

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorR3(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    real(dp), intent(in) :: data(:,:,:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceR3(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorR3

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceC1(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    complex(dp), intent(in) :: data(:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      complex(dp), allocatable :: dataLocal(:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal == data)) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceC1

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorC1(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    complex(dp), intent(in) :: data(:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceC1(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorC1

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceI0(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    integer, intent(in) :: data
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      integer :: dataLocal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 112 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (dataLocal == data) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceI0

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorI0(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    integer, intent(in) :: data
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceI0(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorI0

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceI1(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    integer, intent(in) :: data(:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      integer, allocatable :: dataLocal(:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal == data)) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceI1

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorI1(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    integer, intent(in) :: data(:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceI1(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorI1

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceL0(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    logical, intent(in) :: data
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      logical :: dataLocal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (dataLocal .eqv. data) then
# 108 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceL0

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorL0(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    logical, intent(in) :: data
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceL0(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorL0

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceL1(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    logical, intent(in) :: data(:)
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      logical, allocatable :: dataLocal(:)
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (all(dataLocal .eqv. data)) then
# 108 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceL1

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorL1(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 155 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    logical, intent(in) :: data(:)
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceL1(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorL1

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function coherenceS0(env, data) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(len=*), intent(in) :: data
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 86 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      character(len=len(data)) :: dataLocal
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      !> Is the local data the same as the lead version?
      logical :: res

      logical :: resLocal

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
# 112 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (dataLocal == data) then
# 116 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function coherenceS0

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for exact coherence with error handling
  subroutine coherenceWithErrorS0(env, data, message, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
# 153 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(len=*), intent(in) :: data
# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    if (env%tAPICalculation) then
       if (.not. coherenceS0(env, data)) then
  block
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in " //trim(adjustl(message))// " across nodes"
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 166 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
       end if
    end if

  end subroutine coherenceWithErrorS0

# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceR0(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp) :: dataLocal
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 213 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (abs(dataLocal - data) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceR0

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorR0(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceR0(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorR0

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceR1(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:)

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (maxval(abs(dataLocal - data)) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceR1

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorR1(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:)

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceR1(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorR1

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceR2(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:,:)

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:,:)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (maxval(abs(dataLocal - data)) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceR2

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorR2(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:,:)

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceR2(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorR2

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceR3(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:,:,:)

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      real(dp), allocatable :: dataLocal(:,:,:)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (maxval(abs(dataLocal - data)) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceR3

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorR3(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    real(dp), intent(in) :: data(:,:,:)

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceR3(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorR3

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceC0(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    complex(dp), intent(in) :: data

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      complex(dp) :: dataLocal
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 213 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (abs(dataLocal - data) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceC0

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorC0(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    complex(dp), intent(in) :: data

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceC0(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorC0

# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  !> Comparison of data in global comm world
  function approxCoherenceC1(env, data, tol) result(res)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    complex(dp), intent(in) :: data(:)

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Is the local data the same as the lead version?
    logical :: res

    logical :: resLocal

# 198 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      complex(dp), allocatable :: dataLocal(:)
# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

      real(dp) :: tol_

      if (present(tol)) then
        tol_ = tol
      else
        tol_ = epsilon(0.0_dp)
      end if

      resLocal = .false.
      dataLocal = data
      call mpifx_bcast(env%mpi%globalComm, dataLocal)
# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      if (maxval(abs(dataLocal - data)) <= tol_) then
# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        resLocal = .true.
      end if
      call mpifx_allreduce(env%mpi%globalComm, resLocal, res, MPI_LAND)

  end function approxCoherenceC1

# 244 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

  !> Wrapper for coherence within a specified tolerance, with error handling
  subroutine approxCoherenceWithErrorC1(env, data, message, tol, err)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> Data to check for coherence
    complex(dp), intent(in) :: data(:)

    !> String detailing data
    character(len=*), intent(in) :: message

    !> Tolerance for comparison, if absent use eps
    real(dp), intent(in), optional :: tol

    !> Error code return, 0 if no problems
    integer, intent(out), optional :: err

    real(dp) :: tol_
    character(len=15) :: tol_str

    if (present(tol)) then
       tol_ = tol
    else
       tol_ = epsilon(0._dp)
    endif

    if (env%tAPICalculation) then
      if (.not. approxCoherenceC1(env, data, tol_)) then
        Write(tol_str, '(E12.5)') tol_
  block
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_common_accuracy, only : lc
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    use dftbp_io_message, only : error, warning
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    !> Error handling string
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    character(lc) :: stringTmp
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    write(stringTmp,"(A)")"Coherence failure in "//trim(adjustl(message))//" across nodes for a tolerance of:&
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
        & "//trim(adjustl(tol_str))
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    if (present(err)) then
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      err = -1
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call warning(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      return
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    else
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      call error(stringTmp)
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
    end if
# 275 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
  end block
# 277 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"
      end if
    end if

  end subroutine approxCoherenceWithErrorC1

# 283 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/coherence.F90"

end module dftbp_common_coherence
