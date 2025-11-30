# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

!> Contains wrapper for \c MPI_SCATTER
module mpifx_scatterv_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_scatterv

  !> scatters scalars/arrays of different lengths from a given node.
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
  !! in the scatterving.
  !!
  !! \see MPI documentation (\c MPI_scatterv)
  !!
  !! Example:
  !!
  !!     program test_scatterv
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       integer, allocatable :: send1(:)
  !!       integer, allocatable :: recv1(:)
  !!       integer, allocatable :: sendcounts(:)
  !!       integer :: ii, nsend
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!
  !!       ! I1 -> I1
  !!       allocate(recv1(mycomm%rank+1))
  !!       recv1 = 0
  !!       if (mycomm%lead) then
  !!         ! send1 size is 1+2+3+...+mycomm%size
  !!         nsend = mycomm%size*(mycomm%size+1)/2
  !!         allocate(send1(nsend))
  !!         do ii = 1, nsend
  !!           send1(ii) = ii
  !!         end do
  !!         allocate(sendcounts(mycomm%size))
  !!         do ii = 1, mycomm%size
  !!           sendcounts(ii) = ii
  !!         end do
  !!       else
  !!         allocate(send1(0))
  !!       end if
  !!
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Send1 buffer:", send1(:)
  !!       end if
  !!       call mpifx_scatterv(mycomm, send1, sendcounts, recv1)
  !!       write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_scatterv
  !!
  interface mpifx_scatterv
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i1i1
    module procedure mpifx_scatterv_i1i0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i2i2
    module procedure mpifx_scatterv_i2i1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i3i3
    module procedure mpifx_scatterv_i3i2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i4i4
    module procedure mpifx_scatterv_i4i3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i5i5
    module procedure mpifx_scatterv_i5i4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_i6i6
    module procedure mpifx_scatterv_i6i5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s1s1
    module procedure mpifx_scatterv_s1s0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s2s2
    module procedure mpifx_scatterv_s2s1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s3s3
    module procedure mpifx_scatterv_s3s2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s4s4
    module procedure mpifx_scatterv_s4s3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s5s5
    module procedure mpifx_scatterv_s5s4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_s6s6
    module procedure mpifx_scatterv_s6s5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d1d1
    module procedure mpifx_scatterv_d1d0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d2d2
    module procedure mpifx_scatterv_d2d1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d3d3
    module procedure mpifx_scatterv_d3d2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d4d4
    module procedure mpifx_scatterv_d4d3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d5d5
    module procedure mpifx_scatterv_d5d4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_d6d6
    module procedure mpifx_scatterv_d6d5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c1c1
    module procedure mpifx_scatterv_c1c0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c2c2
    module procedure mpifx_scatterv_c2c1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c3c3
    module procedure mpifx_scatterv_c3c2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c4c4
    module procedure mpifx_scatterv_c4c3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c5c5
    module procedure mpifx_scatterv_c5c4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_c6c6
    module procedure mpifx_scatterv_c6c5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z1z1
    module procedure mpifx_scatterv_z1z0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z2z2
    module procedure mpifx_scatterv_z2z1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z3z3
    module procedure mpifx_scatterv_z3z2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z4z4
    module procedure mpifx_scatterv_z4z3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z5z5
    module procedure mpifx_scatterv_z5z4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_z6z6
    module procedure mpifx_scatterv_z6z5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l1l1
    module procedure mpifx_scatterv_l1l0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l2l2
    module procedure mpifx_scatterv_l2l1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l3l3
    module procedure mpifx_scatterv_l3l2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l4l4
    module procedure mpifx_scatterv_l4l3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l5l5
    module procedure mpifx_scatterv_l5l4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_l6l6
    module procedure mpifx_scatterv_l6l5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h1h1
    module procedure mpifx_scatterv_h1h0
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h2h2
    module procedure mpifx_scatterv_h2h1
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h3h3
    module procedure mpifx_scatterv_h3h2
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h4h4
    module procedure mpifx_scatterv_h4h3
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h5h5
    module procedure mpifx_scatterv_h5h4
# 76 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    module procedure mpifx_scatterv_h6h6
    module procedure mpifx_scatterv_h6h5
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end interface mpifx_scatterv

contains

# 141 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i1i1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i1i1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i1i1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i1i1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i1i0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i1i0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, 1, MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i1i0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i1i0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i2i2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i2i2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i2i2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i2i2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i2i1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i2i1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i2i1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i2i1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i3i3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i3i3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i3i3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i3i3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i3i2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i3i2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i3i2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i3i2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i4i4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i4i4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i4i4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i4i4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i4i3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i4i3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i4i3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i4i3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i5i5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i5i5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i5i5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i5i5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i5i4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i5i4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i5i4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i5i4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type i6i6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i6i6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i6i6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i6i6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type i6i5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_i6i5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_INTEGER, recv, size(recv), MPI_INTEGER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_i6i5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_i6i5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s1s1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s1s1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s1s1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s1s1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s1s0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s1s0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, 1, MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s1s0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s1s0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s2s2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s2s2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s2s2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s2s2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s2s1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s2s1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s2s1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s2s1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s3s3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s3s3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s3s3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s3s3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s3s2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s3s2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s3s2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s3s2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s4s4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s4s4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s4s4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s4s4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s4s3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s4s3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s4s3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s4s3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s5s5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s5s5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s5s5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s5s5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s5s4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s5s4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s5s4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s5s4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type s6s6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s6s6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s6s6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s6s6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type s6s5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_s6s5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_REAL, recv, size(recv), MPI_REAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_s6s5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_s6s5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d1d1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d1d1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d1d1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d1d1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d1d0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d1d0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, 1, MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d1d0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d1d0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d2d2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d2d2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d2d2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d2d2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d2d1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d2d1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d2d1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d2d1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d3d3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d3d3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d3d3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d3d3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d3d2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d3d2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d3d2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d3d2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d4d4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d4d4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d4d4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d4d4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d4d3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d4d3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d4d3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d4d3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d5d5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d5d5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d5d5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d5d5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d5d4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d5d4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d5d4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d5d4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type d6d6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d6d6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d6d6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d6d6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type d6d5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_d6d5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_PRECISION, recv, size(recv), MPI_DOUBLE_PRECISION, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_d6d5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_d6d5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c1c1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c1c1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c1c1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c1c1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c1c0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c1c0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, 1, MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c1c0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c1c0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c2c2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c2c2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c2c2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c2c2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c2c1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c2c1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c2c1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c2c1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c3c3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c3c3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c3c3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c3c3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c3c2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c3c2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c3c2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c3c2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c4c4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c4c4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c4c4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c4c4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c4c3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c4c3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c4c3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c4c3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c5c5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c5c5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c5c5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c5c5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c5c4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c5c4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c5c4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c5c4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type c6c6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c6c6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c6c6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c6c6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type c6c5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_c6c5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_COMPLEX, recv, size(recv), MPI_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_c6c5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_c6c5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z1z1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z1z1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z1z1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z1z1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z1z0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z1z0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, 1, MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z1z0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z1z0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z2z2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z2z2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z2z2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z2z2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z2z1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z2z1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z2z1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z2z1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z3z3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z3z3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z3z3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z3z3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z3z2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z3z2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z3z2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z3z2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z4z4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z4z4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z4z4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z4z4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z4z3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z4z3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z4z3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z4z3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z5z5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z5z5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z5z5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z5z5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z5z4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z5z4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z5z4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z5z4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type z6z6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z6z6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z6z6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z6z6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type z6z5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_z6z5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_DOUBLE_COMPLEX, recv, size(recv), MPI_DOUBLE_COMPLEX, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_z6z5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_z6z5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l1l1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l1l1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l1l1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l1l1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l1l0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l1l0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, 1, MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l1l0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l1l0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l2l2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l2l2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l2l2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l2l2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l2l1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l2l1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l2l1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l2l1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l3l3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l3l3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l3l3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l3l3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l3l2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l3l2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l3l2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l3l2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l4l4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l4l4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l4l4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l4l4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l4l3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l4l3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l4l3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l4l3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l5l5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l5l5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l5l5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l5l5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l5l4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l5l4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l5l4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l5l4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type l6l6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l6l6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l6l6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l6l6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type l6l5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_l6l5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_LOGICAL, recv, size(recv), MPI_LOGICAL, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_l6l5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_l6l5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h1h1).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h1h1(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h1h1", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h1h1
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h1h0).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h1h0(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * 1, MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h1h0", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h1h0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h2h2).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h2h2(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h2h2", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h2h2
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h2h1).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h2h1(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h2h1", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h2h1
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h3h3).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h3h3(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h3h3", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h3h3
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h3h2).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h3h2(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h3h2", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h3h2
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h4h4).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h4h4(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h4h4", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h4h4
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h4h3).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h4h3(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h4h3", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h4h3
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h5h5).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h5h5(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h5h5", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h5h5
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h5h4).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h5h4(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h5h4", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h5h4
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 208 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> scatters object of variable length from one process (type h6h6).
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm MPI communicator.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send Quantity to be sent for scattering.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv Received data on receive node (undefined on other nodes)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root Root process for the result (default: mycomm%leadrank)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error Error code on exit.
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h6h6(mycomm, send, sendcounts, recv, displs, root, error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, size(recv), MPI_CHARACTER, root0,&
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h6h6", error)
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h6h6
# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !> Scatter results from one process (type h6h5).
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param mycomm  MPI communicator.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param send  Quantity to be sent for scattering.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param sendcounts Counts of sent data from each process
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param displs Entry i specifies where to take data to send to rank i
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!        (default: computed from sendcounts assuming order with rank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !! \param error  Error code on exit.
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  !!
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  subroutine mpifx_scatterv_h6h5(mycomm, send, sendcounts, recv, displs, root, error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in) :: sendcounts(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: displs(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(in), optional :: root
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, intent(out), optional :: error
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer :: root0, error0, ii
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    integer, allocatable :: displs0(:)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    if (mycomm%rank == root0) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      if (present(displs)) then
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(:) = displs
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      else
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        allocate(displs0(mycomm%size))
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        displs0(1) = 0
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        do ii = 2, mycomm%size
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
          displs0(ii) = displs0(ii-1) + sendcounts(ii-1)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        end do
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
      end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    end if
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call mpi_scatterv(send, sendcounts, displs0, MPI_CHARACTER, recv, len(recv) * size(recv), MPI_CHARACTER, root0,&
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
        & mycomm%id, error0)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
    call handle_errorflag(error0, "MPI_SCATTER in mpifx_scatterv_h6h5", error)
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
  end subroutine mpifx_scatterv_h6h5
# 214 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"


# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_scatterv.fpp"

end module mpifx_scatterv_module
