# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

!> Contains wrapper for \c MPI_SEND
module mpifx_send_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : default_tag, dp, sp, getoptarg, handle_errorflag
  implicit none
  private

  public :: mpifx_send


  !> Sends a message to a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second argument. The second argument can be of
  !! type integer (i), real (s), double precision (d), complex (c),
  !! double complex (z), logical (b) and character (h). Its rank can vary from
  !! zero (scalar) up to the maximum rank.
  !!
  !! \see MPI documentation (\c MPI_SEND)
  !!
  !! Example:
  !!
  !!     program hello
  !!     use libmpifx_module
  !!     implicit none
  !!
  !!     character(100) :: msg
  !!     type(mpifx) :: mycomm
  !!     integer :: source
  !!
  !!     call mpifx_init()
  !!     call mycomm%init()
  !!     if (.not. mycomm%lead) then
  !!       write(msg, "(A,I0,A)") "Hello from process ", mycomm%rank, "!"
  !!       call mpifx_send(mycomm, msg, mycomm%leadrank)
  !!     else
  !!       write(*, "(A)") "Lead node:"
  !!       do source = 1, mycomm%size - 1
  !!         call mpifx_recv(mycomm, msg, source)
  !!         write(*,"(A,A)") "Message received: ", trim(msg)
  !!       end do
  !!     end if
  !!     call mpifx_finalize()
  !!
  !!   end program hello
  !!
  interface mpifx_send
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_i6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_s6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_d6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_c6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_z6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_l6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    module procedure mpifx_send_h6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end interface mpifx_send

contains

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_i6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_INTEGER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_i6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_i6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_s6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(sp), intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_REAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_s6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_s6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_d6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    real(dp), intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_PRECISION, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_d6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_d6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_c6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(sp), intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_c6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_c6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_z6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    complex(dp), intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_DOUBLE_COMPLEX, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_z6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_z6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, 1, MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_l6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    logical, intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, size(msg), MPI_LOGICAL, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_l6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_l6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h0(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * 1, MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h0", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h1(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h1", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h1
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h2(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h2", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h2
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h3(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h3", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h3
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h4(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h4", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h4
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h5(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h5", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h5
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !> Sends a message to a given process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param mycomm  MPI descriptor.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param msg  Msg to be sent.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param dest  Destination process.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param tag  Optional message tag (default: 0).
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !! \param error  Optional error handling flag.
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  !!
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  subroutine mpifx_send_h6(mycomm, msg, dest, tag, error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    character(len=*), intent(in) :: msg(:,:,:,:,:,:)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in) :: dest
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(in), optional :: tag
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer, intent(out), optional :: error
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    integer :: tag0, error0
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call getoptarg(default_tag, tag0, tag)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call mpi_send(msg, len(msg) * size(msg), MPI_CHARACTER, dest, tag0, mycomm%id, error0)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
    call handle_errorflag(error0, "MPI_SEND in mpifx_send_h6", error)
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"

# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
  end subroutine mpifx_send_h6
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"


# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_send.fpp"



end module mpifx_send_module
