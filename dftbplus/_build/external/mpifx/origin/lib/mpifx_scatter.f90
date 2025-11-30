# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

!> Contains wrapper for \c MPI_SCATTER
module mpifx_scatter_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_scatter

  !> Scatters scalars/arrays on a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second and third arguments. The second and third
  !! arguments can be of type integer (i), real (s), double precision (d),
  !! complex (c), double complex (z) and logical (l). Their rank can vary from
  !! zero (scalars) up to the maximum rank. Both arguments must be of same
  !! type. The second argument must have the size of the third times the number
  !! of processes taking part in the scattering. The second argument must have
  !! either the same rank as the third one or one rank more. In latter case
  !! the last dimension of it must be of the size of the number of processes
  !! in the scattering.
  !!
  !! \see MPI documentation (\c MPI_SCATTER)
  !!
  !! Example:
  !!
  !!     program test_scatter
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       integer, allocatable :: send1(:), send2(:,:)
  !!       integer :: recv0
  !!       integer, allocatable :: recv1(:)
  !!       integer :: ii
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!
  !!       ! I1 -> I0
  !!       if (mycomm%lead) then
  !!         allocate(send1(mycomm%size))
  !!         send1(:) = [ (ii, ii = 1, size(send1)) ]
  !!         write(*, *) mycomm%rank, "Send1 buffer:", send1
  !!       else
  !!         allocate(send1(0))
  !!       end if
  !!       recv0 = 0
  !!       call mpifx_scatter(mycomm, send1, recv0)
  !!       write(*, *) mycomm%rank, "Recv0 buffer:", recv0
  !!
  !!       ! I1 -> I1
  !!       if (mycomm%lead) then
  !!         deallocate(send1)
  !!         allocate(send1(2 * mycomm%size))
  !!         send1(:) = [ (ii, ii = 1, size(send1)) ]
  !!         write(*, *)  mycomm%rank, "Send1 buffer:", send1
  !!       end if
  !!       allocate(recv1(2))
  !!       recv1(:) = 0
  !!       call mpifx_scatter(mycomm, send1, recv1)
  !!       write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!
  !!       ! I2 -> I1
  !!       if (mycomm%lead) then
  !!         allocate(send2(2, mycomm%size))
  !!         send2(:,:) = reshape(send1,  [ 2, mycomm%size ])
  !!         write(*, *) mycomm%rank, "Send2 buffer:", send2
  !!       else
  !!         allocate(send2(0,0))
  !!       end if
  !!       recv1(:) = 0
  !!       call mpifx_scatter(mycomm, send2, recv1)
  !!       write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_scatter
  !!
  interface mpifx_scatter
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i1i1
    module procedure mpifx_scatter_i1i0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i2i2
    module procedure mpifx_scatter_i2i1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i3i3
    module procedure mpifx_scatter_i3i2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i4i4
    module procedure mpifx_scatter_i4i3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i5i5
    module procedure mpifx_scatter_i5i4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_i6i6
    module procedure mpifx_scatter_i6i5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s1s1
    module procedure mpifx_scatter_s1s0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s2s2
    module procedure mpifx_scatter_s2s1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s3s3
    module procedure mpifx_scatter_s3s2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s4s4
    module procedure mpifx_scatter_s4s3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s5s5
    module procedure mpifx_scatter_s5s4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_s6s6
    module procedure mpifx_scatter_s6s5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d1d1
    module procedure mpifx_scatter_d1d0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d2d2
    module procedure mpifx_scatter_d2d1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d3d3
    module procedure mpifx_scatter_d3d2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d4d4
    module procedure mpifx_scatter_d4d3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d5d5
    module procedure mpifx_scatter_d5d4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_d6d6
    module procedure mpifx_scatter_d6d5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c1c1
    module procedure mpifx_scatter_c1c0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c2c2
    module procedure mpifx_scatter_c2c1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c3c3
    module procedure mpifx_scatter_c3c2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c4c4
    module procedure mpifx_scatter_c4c3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c5c5
    module procedure mpifx_scatter_c5c4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_c6c6
    module procedure mpifx_scatter_c6c5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z1z1
    module procedure mpifx_scatter_z1z0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z2z2
    module procedure mpifx_scatter_z2z1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z3z3
    module procedure mpifx_scatter_z3z2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z4z4
    module procedure mpifx_scatter_z4z3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z5z5
    module procedure mpifx_scatter_z5z4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_z6z6
    module procedure mpifx_scatter_z6z5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l1l1
    module procedure mpifx_scatter_l1l0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l2l2
    module procedure mpifx_scatter_l2l1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l3l3
    module procedure mpifx_scatter_l3l2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l4l4
    module procedure mpifx_scatter_l4l3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l5l5
    module procedure mpifx_scatter_l5l4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_l6l6
    module procedure mpifx_scatter_l6l5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h1h1
    module procedure mpifx_scatter_h1h0
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h2h2
    module procedure mpifx_scatter_h2h1
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h3h3
    module procedure mpifx_scatter_h3h2
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h4h4
    module procedure mpifx_scatter_h4h3
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h5h5
    module procedure mpifx_scatter_h5h4
# 88 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    module procedure mpifx_scatter_h6h6
    module procedure mpifx_scatter_h6h5
# 92 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end interface mpifx_scatter

contains

# 133 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 173 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i1i1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i1i1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i1i1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i1i1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i1i0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i1i0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_INTEGER, recv, 1, MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i1i0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i1i0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i2i2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i2i2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i2i2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i2i2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i2i1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i2i1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i2i1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i2i1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i3i3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i3i3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i3i3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i3i3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i3i2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i3i2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i3i2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i3i2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i4i4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i4i4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i4i4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i4i4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i4i3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i4i3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i4i3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i4i3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i5i5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i5i5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i5i5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i5i5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i5i4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i5i4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i5i4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i5i4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type i6i6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i6i6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i6i6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i6i6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type i6i5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_i6i5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_i6i5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_i6i5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s1s1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s1s1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s1s1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s1s1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s1s0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s1s0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_REAL, recv, 1, MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s1s0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s1s0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s2s2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s2s2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s2s2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s2s2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s2s1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s2s1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s2s1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s2s1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s3s3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s3s3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s3s3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s3s3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s3s2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s3s2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s3s2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s3s2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s4s4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s4s4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s4s4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s4s4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s4s3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s4s3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s4s3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s4s3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s5s5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s5s5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s5s5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s5s5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s5s4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s5s4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s5s4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s5s4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type s6s6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s6s6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s6s6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s6s6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type s6s5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_s6s5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_s6s5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_s6s5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d1d1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d1d1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d1d1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d1d1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d1d0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d1d0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_DOUBLE_PRECISION, recv, 1, MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d1d0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d1d0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d2d2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d2d2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d2d2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d2d2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d2d1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d2d1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d2d1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d2d1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d3d3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d3d3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d3d3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d3d3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d3d2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d3d2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d3d2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d3d2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d4d4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d4d4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d4d4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d4d4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d4d3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d4d3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d4d3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d4d3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d5d5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d5d5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d5d5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d5d5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d5d4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d5d4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d5d4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d5d4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type d6d6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d6d6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d6d6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d6d6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type d6d5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_d6d5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_d6d5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_d6d5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c1c1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c1c1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c1c1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c1c1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c1c0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c1c0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_COMPLEX, recv, 1, MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c1c0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c1c0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c2c2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c2c2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c2c2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c2c2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c2c1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c2c1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c2c1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c2c1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c3c3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c3c3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c3c3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c3c3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c3c2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c3c2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c3c2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c3c2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c4c4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c4c4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c4c4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c4c4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c4c3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c4c3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c4c3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c4c3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c5c5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c5c5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c5c5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c5c5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c5c4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c5c4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c5c4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c5c4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type c6c6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c6c6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c6c6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c6c6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type c6c5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_c6c5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_c6c5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_c6c5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z1z1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z1z1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z1z1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z1z1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z1z0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z1z0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_DOUBLE_COMPLEX, recv, 1, MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z1z0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z1z0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z2z2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z2z2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z2z2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z2z2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z2z1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z2z1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z2z1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z2z1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z3z3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z3z3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z3z3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z3z3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z3z2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z3z2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z3z2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z3z2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z4z4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z4z4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z4z4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z4z4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z4z3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z4z3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z4z3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z4z3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z5z5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z5z5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z5z5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z5z5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z5z4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z5z4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z5z4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z5z4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type z6z6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z6z6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z6z6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z6z6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type z6z5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_z6z5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_z6z5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_z6z5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l1l1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l1l1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l1l1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l1l1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l1l0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l1l0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, 1, MPI_LOGICAL, recv, 1, MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l1l0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l1l0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l2l2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l2l2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l2l2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l2l2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l2l1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l2l1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l2l1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l2l1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l3l3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l3l3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l3l3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l3l3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l3l2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l3l2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l3l2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l3l2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l4l4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l4l4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l4l4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l4l4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l4l3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l4l3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l4l3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l4l3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l5l5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l5l5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l5l5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l5l5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l5l4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l5l4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l5l4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l5l4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type l6l6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l6l6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l6l6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l6l6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type l6l5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_l6l5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, size(recv), MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_l6l5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_l6l5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h1h1).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h1h1(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h1h1", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h1h1
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h1h0).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h1h0(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * 1, MPI_CHARACTER, recv, len(recv) * 1, MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h1h0", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h1h0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h2h2).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h2h2(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h2h2", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h2h2
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h2h1).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h2h1(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h2h1", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h2h1
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h3h3).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h3h3(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h3h3", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h3h3
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h3h2).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h3h2(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h3h2", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h3h2
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h4h4).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h4h4(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h4h4", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h4h4
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h4h3).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h4h3(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h4h3", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h4h3
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h5h5).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h5h5(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h5h5", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h5h5
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h5h4).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h5h4(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h5h4", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h5h4
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters object from one process (type h6h6).
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h6h6(mycomm, send, recv, root, error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h6h6", error)
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h6h6
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !> Scatters results on one process (type h6h5).
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param mycomm  MPI communicator.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param send  Quantity to be sent for scattering.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !! \param error  Error code on exit.
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  !!
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  subroutine mpifx_scatter_h6h5(mycomm, send, recv, root, error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(in), optional :: root
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer, intent(out), optional :: error
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    integer :: root0, error0
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call mpi_scatter(send, len(recv) * size(recv), MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
        & mycomm%id, error0)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatter_h6h5", error)
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
  end subroutine mpifx_scatter_h6h5
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatter.fpp"

end module mpifx_scatter_module
