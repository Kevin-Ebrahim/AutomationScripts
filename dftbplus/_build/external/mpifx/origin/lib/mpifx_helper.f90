# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

!> Exports constants and helper routine(s).
!! \cond HIDDEN
module mpifx_helper_module
  use mpi
  use, intrinsic :: iso_fortran_env, only : stderr => error_unit
  use mpifx_constants_module, only : MPIFX_ASSERT_FAILED, MPIFX_UNHANDLED_ERROR
  implicit none
  private

  public :: default_tag, sp, dp
  public :: handle_errorflag, assert_failed
  public :: getoptarg, setoptarg

  !> Default tag
  integer, parameter :: default_tag = 0

  !> Single precision kind.
  integer, parameter :: sp = kind(1.0)

  !> Double precision kind.
  integer, parameter :: dp = kind(1.0d0)


  interface getoptarg
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_i0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_s0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_d0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_c0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_z0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_l0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_h0
# 32 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_i1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_s1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_d1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_c1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_z1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_l1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure getoptarg_h1
# 32 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end interface getoptarg


  interface setoptarg
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_i0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_s0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_d0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_c0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_z0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_l0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_h0
# 41 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_i1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_s1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_d1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_c1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_z1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_l1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    module procedure setoptarg_h1
# 41 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end interface setoptarg


contains

  !> Handles optional error flag.
  !!
  subroutine handle_errorflag(error0, msg, error)

    !> Error flag as returned by some routine.
    integer, intent(in) :: error0

    !>  Msg to print out, if program is stopped.
    character(*), intent(in) :: msg

    !> Optional error flag.
    !!
    !! If present, error0 is passed to it, otherwise if error0 was not zero, the
    !! error message in msg is printed and the program is stopped.
    !!
    integer, intent(out), optional :: error

    integer :: aborterror

    if (present(error)) then
      error = error0
    elseif (error0 /= 0) then
      write(stderr, "(A)") "Operation failed!"
      write(stderr, "(A)") msg
      write(stderr, "(A,I0)") "Error: ", error0
      call mpi_abort(MPI_COMM_WORLD, MPIFX_UNHANDLED_ERROR, aborterror)
      if (aborterror /= 0) then
        write(stderr, "(A)") "Stopping code with 'mpi_abort' did not succeed, trying 'stop' instead"
        stop 1
      end if
    end if

  end subroutine handle_errorflag


  !> Stops code signalizing a failed assert condition
  !!
  subroutine assert_failed(file, line)
    character(*), intent(in) :: file
    integer, intent(in) :: line

    integer :: aborterror

    write(stderr, "(A)") "Assertion failed"
    write(stderr, "(A,A)") "File:", file
    write(stderr, "(A,I0)") "Line:", line
    call mpi_abort(MPI_COMM_WORLD, MPIFX_ASSERT_FAILED, aborterror)
    if (aborterror /= 0) then
        write(stderr, "(A)") "Stopping code with 'mpi_abort' did not succeed, trying 'stop' instead"
        stop 1
    end if

  end subroutine assert_failed


# 120 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 137 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_i0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_i0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_i0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_i0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_i1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_i1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_i1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    integer, intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_i1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_s0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_s0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_s0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_s0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_s1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_s1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_s1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(sp), intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_s1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_d0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_d0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_d0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_d0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_d1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_d1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_d1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    real(dp), intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_d1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_c0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_c0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_c0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_c0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_c1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_c1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_c1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(sp), intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_c1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_z0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_z0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_z0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_z0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_z1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_z1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_z1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    complex(dp), intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_z1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_l0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_l0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_l0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_l0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_l1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_l1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_l1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    logical, intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_l1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 140 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_h0(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in) :: defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(out) :: arg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in), optional :: optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_h0
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_h0(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in) :: curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(out), optional :: optval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_h0
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine getoptarg_h1(defarg, arg, optarg)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in) :: defarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(out) :: arg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in), optional :: optarg(:)
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optarg)) then
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = optarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    else
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      arg = defarg
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine getoptarg_h1
# 145 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  subroutine setoptarg_h1(curval, optval)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(in) :: curval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    character(len=*), intent(out), optional :: optval(:)
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    if (present(optval)) then
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
      optval = curval
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
    end if
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
  end subroutine setoptarg_h1
# 146 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"


# 149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"
# 150 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_helper.fpp"

end module mpifx_helper_module

!> \endcond
