# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"



# 130 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


!> Contains wrapper for \c MPI_gatherv
module mpifx_gatherv_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_gatherv

  !> Gathers scalars/arrays of different lengths on a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second and third arguments. The second and third
  !! arguments can be of type integer (i), real (s), double precision (d),
  !! complex (c), double complex (z) and logical (l). Their rank can vary from
  !! zero (scalars) up to the maximum rank. Both arguments must be of same
  !! type. The third argument must have the size of the second times the number
  !! of processes taking part in the gathering. The fourth argument must be
  !! an array of integers corresponding to the array sizes received from each
  !! processor. The displacements at which to place the incoming data can be
  !! given as an optional argument. By default they are computed from recvcounts,
  !! assuming ordering with processor rank.
  !!
  !! \see MPI documentation (\c MPI_gatherv)
  !!
  !! Example:
  !!
  !!     program test_gatherv
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       real, allocatable :: send1(:)
  !!       real, allocatable :: recv1(:)
  !!       integer, allocatable :: recvcounts(:)
  !!       integer :: ii, nrecv
  !!       character(100) :: formstr
  !!       character(*), parameter :: label = "(I2.2,'-',I3.3,'|',1X"
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!
  !!       ! I1 -> I1
  !!       allocate(send1(mycomm%rank+1))
  !!       send1 = 1.0*mycomm%rank
  !!       if (mycomm%lead) then
  !!         ! recv1 size is 1+2+3+...+mycomm%size
  !!         nrecv = mycomm%size*(mycomm%size+1)/2
  !!         allocate(recv1(nrecv))
  !!         recv1(:) = 0
  !!         allocate(recvcounts(mycomm%size))
  !!         do ii = 1, mycomm%size
  !!           recvcounts(ii) = ii
  !!         end do
  !!       else
  !!         allocate(recv1(0))
  !!       end if
  !!
  !!       write(*, *) mycomm%rank, "Send1 buffer:", send1(:)
  !!       call mpifx_gatherv(mycomm, send1, recv1, recvcounts)
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!       end if
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_gatherv
  !!
  interface mpifx_gatherv
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i1i1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i2i2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i3i3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i4i4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i5i5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_i6i6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_i0i1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s1s1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s2s2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s3s3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s4s4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s5s5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_s6s6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_s0s1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d1d1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d2d2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d3d3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d4d4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d5d5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_d6d6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_d0d1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c1c1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c2c2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c3c3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c4c4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c5c5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_c6c6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_c0c1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z1z1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z2z2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z3z3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z4z4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z5z5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_z6z6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_z0z1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l1l1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l2l2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l3l3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l4l4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l5l5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_l6l6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_l0l1
# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h1h1
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h2h2
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h3h3
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h4h4
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h5h5
# 204 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 205 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        module procedure mpifx_gatherv_h6h6
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      module procedure mpifx_gatherv_h0h1
# 209 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end interface mpifx_gatherv


contains

# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i1i1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i1i1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i1i1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i1i1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i2i2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i2i2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i2i2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i2i2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i3i3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i3i3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i3i3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i3i3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i4i4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i4i4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i4i4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i4i4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i5i5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i5i5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i5i5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i5i5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type i6i6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i6i6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_INTEGER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i6i6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i6i6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type i0i1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_i0i1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_INTEGER, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_INTEGER,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_i0i1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_i0i1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s1s1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s1s1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s1s1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s1s1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s2s2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s2s2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s2s2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s2s2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s3s3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s3s3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s3s3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s3s3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s4s4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s4s4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s4s4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s4s4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s5s5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s5s5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s5s5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s5s5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type s6s6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s6s6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_REAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s6s6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s6s6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type s0s1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_s0s1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(sp), intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_REAL, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_REAL,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_s0s1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_s0s1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d1d1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d1d1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d1d1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d1d1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d2d2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d2d2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d2d2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d2d2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d3d3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d3d3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d3d3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d3d3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d4d4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d4d4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d4d4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d4d4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d5d5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d5d5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d5d5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d5d5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type d6d6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d6d6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_PRECISION, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d6d6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d6d6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type d0d1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_d0d1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    real(dp), intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_DOUBLE_PRECISION,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_d0d1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_d0d1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c1c1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c1c1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c1c1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c1c1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c2c2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c2c2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c2c2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c2c2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c3c3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c3c3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c3c3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c3c3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c4c4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c4c4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c4c4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c4c4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c5c5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c5c5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c5c5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c5c5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type c6c6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c6c6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c6c6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c6c6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type c0c1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_c0c1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(sp), intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_COMPLEX, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_COMPLEX,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_c0c1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_c0c1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z1z1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z1z1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z1z1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z1z1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z2z2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z2z2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z2z2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z2z2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z3z3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z3z3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z3z3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z3z3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z4z4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z4z4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z4z4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z4z4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z5z5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z5z5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z5z5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z5z5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type z6z6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z6z6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_DOUBLE_COMPLEX, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z6z6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z6z6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type z0z1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_z0z1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    complex(dp), intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_DOUBLE_COMPLEX,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_z0z1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_z0z1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l1l1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l1l1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l1l1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l1l1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l2l2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l2l2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l2l2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l2l2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l3l3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l3l3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l3l3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l3l3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l4l4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l4l4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l4l4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l4l4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l5l5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l5l5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l5l5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l5l5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type l6l6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l6l6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_LOGICAL, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l6l6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l6l6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type l0l1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_l0l1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_LOGICAL, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_LOGICAL,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_l0l1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_l0l1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 215 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 218 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h1h1).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h1h1(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h1h1", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h1h1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h2h2).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h2h2(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h2h2", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h2h2
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h3h3).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h3h3(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h3h3", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h3h3
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h4h4).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h4h4(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h4h4", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h4h4
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h5h5).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h5h5(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h5h5", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h5h5
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 220 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results of variable length on one process (type h6h6).
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h6h6(mycomm, send, recv, recvcounts, displs, root, error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: root0, error0, ii, locLast(1), aborterror
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    logical, allocatable :: testBuffer(:)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        locLast = maxloc(displs0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        ! test for overlapping regions being written to
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        allocate(testBuffer(size(recv)))
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        testBuffer = .false.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 1, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          ! potentially in random order, so mark effected parts of the buffer
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          if (any(testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1))) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            write(*, "(A)") "Overlapping regions in mpifx_gatherv!"
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            call mpi_abort(MPI_COMM_WORLD, -1, aborterror)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            if (aborterror /= 0) then
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
              write(*, "(A)") "Stopping code did not succeed, hope for the best."
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
            end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          testBuffer(displs0(ii):displs0(ii)+recvcounts(ii)-1) = .true.
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        deallocate(testBuffer)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        & MPI_CHARACTER, root0, mycomm%id, error0)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h6h6", error)
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h6h6
# 221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !> Gathers results on one process (type h0h1).
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param mycomm  MPI communicator.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !! \param error  Error code on exit.
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  !!
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  subroutine mpifx_gatherv_h0h1(mycomm, send, recv, recvcounts, displs, root, error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(in) :: send
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    character(len=*), intent(out) :: recv(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(in), optional :: root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, intent(out), optional :: error
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer :: ii, root0, error0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    integer, allocatable :: displs0(:)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  if (present(root)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = root
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    root0 = mycomm%leadrank
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    if (mycomm%rank == root0) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      allocate(displs0(mycomm%size))
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      if (present(displs)) then
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0 = displs
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      else
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        displs0(1) = 0
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        do ii = 2, mycomm%size
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
          displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
        end do
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
      end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    end if
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call mpi_gatherv(send, 1, MPI_CHARACTER, recv, recvcounts, displs0, &
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
         & MPI_CHARACTER,  root0, mycomm%id, error0)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
    call handle_errorflag(error0, "MPI_GATHERV in mpifx_gatherv_h0h1", error)
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"
  end subroutine mpifx_gatherv_h0h1
# 225 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"


# 228 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gatherv.fpp"

end module mpifx_gatherv_module
