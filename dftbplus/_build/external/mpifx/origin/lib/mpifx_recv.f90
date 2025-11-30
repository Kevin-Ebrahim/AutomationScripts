# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

!> Contains wrapper for \c MPI_RECV
module mpifx_recv_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, sp, getoptarg, handle_errorflag, setoptarg
  implicit none
  private

  public :: mpifx_recv


  !> Receives a message from a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second argument. The second argument can be of
  !! type integer (i), real (s), double precision (d), complex (c),
  !! double complex (z), logical (b) and character (h). Its rank can vary from
  !! zero (scalar) up to the maximum rank.
  !!
  !! \see MPI documentation (\c MPI_RECV)
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
  interface mpifx_recv
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_i6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_s6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_d6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_c6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_z6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_l6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h0
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h1
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h2
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h3
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h4
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h5
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    module procedure mpifx_recv_h6
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end interface mpifx_recv

contains

# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_i6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_INTEGER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_i6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_i6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_s6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(sp), intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_REAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_s6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_s6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_d6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    real(dp), intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_PRECISION, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_d6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_d6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_c6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(sp), intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_c6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_c6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_z6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    complex(dp), intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_DOUBLE_COMPLEX, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_z6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_z6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, 1, MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_l6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    logical, intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, size(msg), MPI_LOGICAL, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_l6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_l6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h0(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * 1, MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h0", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h1(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h1", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h1
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h2(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h2", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h2
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h3(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h3", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h3
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h4(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h4", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h4
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h5(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h5", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h5
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 101 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !> Receives a message from a given process.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param mycomm  MPI descriptor.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param msg  Msg to be received.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param source  Optional source process (default: MPI_ANY_SOURCE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param tag  Optional message tag (default: MPI_ANY_TAG).
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param status  Optional status array.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !! \param error  Optional error handling flag.
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  !!
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  subroutine mpifx_recv_h6(mycomm, msg, source, tag, status, error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    character(len=*), intent(out) :: msg(:,:,:,:,:,:)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(in), optional :: source, tag
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: status(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer, intent(out), optional :: error
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: source0, tag0, error0
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    integer :: status0(MPI_STATUS_SIZE)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_TAG, tag0, tag)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call getoptarg(MPI_ANY_SOURCE, source0, source)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call mpi_recv(msg, len(msg) * size(msg), MPI_CHARACTER, source0, tag0, mycomm%id, status0, error0)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call handle_errorflag(error0, "MPI_RECV in mpifx_recv_h6", error)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
    call setoptarg(status0, status)
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
  end subroutine mpifx_recv_h6
# 107 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"


# 110 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"
# 111 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_recv.fpp"

end module mpifx_recv_module
