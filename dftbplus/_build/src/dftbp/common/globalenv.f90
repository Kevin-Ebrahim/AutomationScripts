# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90" 2

!> Contains fundamental global computing environment settings.
!>
!> It contains global settings and routines, which can be used already before the parsing of the
!> input has taken place and the details of the user settings for the running-environment are
!> known. Also, it can be used by routines which are not MPI-aware but wish to make I/O or abort the
!> code.
!>
module dftbp_common_globalenv
  use, intrinsic :: iso_fortran_env, only : error_unit, output_unit
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
  use mpi, only : MPI_COMM_WORLD
  use dftbp_extlibs_mpifx, only : MPI_THREAD_FUNNELED, mpifx_abort, mpifx_barrier, mpifx_comm,&
      & mpifx_finalize, mpifx_init_thread
# 24 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
  implicit none

  private
  public :: initGlobalEnv, destructGlobalEnv
  public :: abortProgram, shutdown, synchronizeAll
  public :: stdOut, stdOut0, stdErr, stdErr0, tIoProc
  public :: withScalapack, withMpi
  public :: instanceSafeBuild
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    public :: globalMpiComm
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"


  !> Unredirected standard out
  integer, parameter :: stdOut0 = output_unit

  !> Unredirected standard error
  integer, parameter :: stdErr0 = error_unit

  !> Standard out file handler
  integer, protected :: stdOut = stdOut0

  !> Standard error file handler
  integer, protected :: stdErr = stdErr0

  !> Whether current process is the global lead process
  logical, protected :: tIoProc = .true.

# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
  !> Global MPI communicator (used for aborts)
  type(mpifx_comm), protected :: globalMpiComm
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

  !> Whether code was compiled with MPI support
  logical, parameter :: withMpi = .true.

  !> Whether code was compiled with Scalapack
  logical, parameter :: withScalapack = .true.

# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
  !> Whether MPI finalization should be performed at the end
  logical :: doMpiFinalization = .true.
# 67 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

  !> Whether code was compiled with many-body dispersion support
  logical, parameter :: withMbd = .false.

  !> Whether the code had been built with instance safe components only
  logical, parameter :: instanceSafeBuild = .false.



contains

  !> Initializes global environment (must be the first statement of a program)
  subroutine initGlobalEnv(outputUnit, mpiComm, errorUnit, devNull)

    !> Customised global standard output
    integer, intent(in), optional :: outputUnit

    !> Customised global MPI communicator
    integer, intent(in), optional :: mpiComm

    !> Customised global standard error
    integer, intent(in), optional :: errorUnit

    !> Unit of the null device (needed for follow processes to suppress their output)
    integer, intent(in), optional :: devNull


    integer :: outputUnit0, errorUnit0, devNull0

# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    integer :: mpiComm0
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

    if (present(outputUnit)) then
      outputUnit0 = outputUnit
    else
      outputUnit0 = stdOut0
    end if

    if (present(errorUnit)) then
      errorUnit0 = errorUnit
    else
      errorUnit0 = stdErr0
    end if

# 113 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    if (present(mpiComm)) then
      mpiComm0 = mpiComm
      doMpiFinalization = .false.
    else
      mpiComm0 = MPI_COMM_WORLD
      call mpifx_init_thread(requiredThreading=MPI_THREAD_FUNNELED)
    end if

    call globalMpiComm%init(commid=mpiComm0)
    if (globalMpiComm%lead) then
      stdOut = outputUnit0
      stdErr = errorUnit0
    else
      if (present(devNull)) then
        devNull0 = devNull
      else
        open(newunit=devNull0, file="/dev/null", action="write")
      end if
      stdOut = devNull0
      stdErr = devNull0
    end if
    tIoProc = globalMpiComm%lead
# 139 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

  end subroutine initGlobalEnv


  !> Finalizes global environment (must be the last statement of a program)
  subroutine destructGlobalEnv()

# 147 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    if (doMpiFinalization) then
      call mpifx_finalize()
    end if
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

  end subroutine destructGlobalEnv


  !> Gracefully shuts down environment and stops execution.
  !>
  !> Note: this routine must be called collectively by all processes.
  !>
  subroutine shutdown()

    call synchronizeAll()
    call destructGlobalEnv()
    stop

  end subroutine shutdown


  !> Aborts program execution immediately.
  !>
  !> Note: if this routine is called by any the processes, execution immediately stops
  !> without waiting for any other processes.
  !>
  subroutine abortProgram(errorCode)

    !> Error code to emit (default: 1)
    integer, intent(in), optional :: errorCode

    integer :: errorCode0
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    integer :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

    if (.not. present(errorCode)) then
      errorCode0 = 1
    else
      errorCode0 = errorCode
    end if

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    call mpifx_abort(globalMpiComm, errorCode0, error)
    if (error /= 0) then
      write(stdErr0, "(A,I0,A)") "Process ", globalMpiComm%rank, " could not be aborted."
    end if
# 195 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    error stop

  end subroutine abortProgram


  !> Waits until all processes reach this point
  subroutine synchronizeAll()

# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"
    call mpifx_barrier(globalMpiComm)
# 206 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/globalenv.F90"

  end subroutine synchronizeAll


end module dftbp_common_globalenv
