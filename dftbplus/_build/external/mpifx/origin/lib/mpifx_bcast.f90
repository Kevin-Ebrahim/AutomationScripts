# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

!> Contains wrapper for \c MPI_BCAST.
module mpifx_bcast_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_bcast

  !> Broadcasts an MPI message to all nodes.
  !!
  !! \details All functions have the same argument list only differing in the type and rank of the
  !! second argument. The second argument can be of type integer, real, double precision, complex,
  !! double complex, logical and character. Its rank can vary from zero (scalar) up to the maximum
  !! rank.
  !!
  !! \see MPI documentation (\c MPI_BCAST)
  !!
  !! Example:
  !!
  !!     program test_bcast
  !!       use libmpifx_module
  !!
  !!       type(mpifx) :: mycomm
  !!       integer :: buffer(3)
  !!
  !!       call mycomm%init()
  !!       if (mycomm%lead) then
  !!         buffer(:) = [ 1, 2, 3 ]
  !!       end if
  !!       call mpifx_bcast(mycomm, buffer)
  !!       print "(A,I2.2,A,3I5)", "BUFFER:", mycomm%rank, ":", buffer
  !!       call mycomm%destruct()
  !!
  !!     end program test_bcast
  !!
  interface mpifx_bcast
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_i6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_s6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_d6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_c6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_z6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_l6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h3
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h4
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h5
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    module procedure mpifx_bcast_h6
# 47 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 48 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end interface

contains

# 84 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type i6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_i6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_INTEGER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_i6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_i6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type s6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_s6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(sp) :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_REAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_s6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_s6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type d6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_d6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    real(dp) :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_d6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_d6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type c6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_c6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(sp) :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_c6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_c6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type z6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_z6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    complex(dp) :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_z6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_z6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, 1, MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type l6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_l6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    logical :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, size(msg), MPI_LOGICAL, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_l6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_l6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h0).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h0(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * 1, MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h0", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h1).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h1(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h1", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h1
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h2).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h2(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h2", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h2
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h3).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h3(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h3", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h3
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h4).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h4(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h4", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h4
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h5).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h5(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h5", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h5
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !> Broadcasts an MPI message to all nodes (type h6).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  !!
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  subroutine mpifx_bcast_h6(mycomm, msg, root, error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> MPI descriptor
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Msg to be broadcasted on root and received on non-root nodes.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    character(len=*) :: msg(:,:,:,:,:,:)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Root node for the broadcast (default: mycomm%leadrank).
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(in), optional :: root
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    !> Optional error handling flag.
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer, intent(out), optional :: error
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    integer :: root0, error0
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call mpi_bcast(msg, len(msg) * size(msg), MPI_CHARACTER, root0, mycomm%id, error0)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
    call handle_errorflag(error0, "MPI_BCAST in mpifx_bcast_h6", error)
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
  end subroutine mpifx_bcast_h6
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"


# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"
# 98 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_bcast.fpp"

end module mpifx_bcast_module
