# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"



# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

!> Contains wrapper for \c MPI_allgatherv
module mpifx_allgatherv_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_allgatherv

  !> Gathers scalars/arrays of different lengths on all nodes.
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
  !! \see MPI documentation (\c MPI_allgatherv)
  !!
  !! Example:
  !!
  !!     program test_allgatherv
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
  !!       ! recv1 size is 1+2+3+...+mycomm%size
  !!       nrecv = mycomm%size*(mycomm%size+1)/2
  !!       allocate(recv1(nrecv))
  !!       recv1(:) = 0
  !!       allocate(recvcounts(mycomm%size))
  !!       do ii = 1, mycomm%size
  !!         recvcounts(ii) = ii
  !!       end do
  !!
  !!       write(*, *) mycomm%rank, "Send1 buffer:", send1(:)
  !!       call mpifx_allgatherv(mycomm, send1, recv1, recvcounts)
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!       end if
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_allgatherv
  !!
  interface mpifx_allgatherv
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i1i1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i2i2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i3i3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i4i4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i5i5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_i6i6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_i0i1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s1s1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s2s2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s3s3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s4s4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s5s5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_s6s6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_s0s1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d1d1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d2d2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d3d3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d4d4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d5d5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_d6d6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_d0d1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c1c1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c2c2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c3c3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c4c4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c5c5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_c6c6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_c0c1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z1z1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z2z2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z3z3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z4z4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z5z5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_z6z6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_z0z1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l1l1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l2l2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l3l3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l4l4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l5l5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_l6l6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_l0l1
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h1h1
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h2h2
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h3h3
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h4h4
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h5h5
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 176 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        module procedure mpifx_allgatherv_h6h6
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      module procedure mpifx_allgatherv_h0h1
# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end interface mpifx_allgatherv


contains

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i1i1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i1i1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i1i1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i1i1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i2i2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i2i2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i2i2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i2i2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i3i3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i3i3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i3i3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i3i3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i4i4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i4i4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i4i4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i4i4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i5i5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i5i5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i5i5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i5i5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type i6i6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i6i6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_INTEGER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_INTEGER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i6i6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i6i6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type i0i1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_i0i1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_INTEGER, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_INTEGER,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_i0i1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_i0i1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s1s1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s1s1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s1s1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s1s1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s2s2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s2s2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s2s2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s2s2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s3s3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s3s3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s3s3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s3s3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s4s4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s4s4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s4s4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s4s4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s5s5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s5s5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s5s5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s5s5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type s6s6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s6s6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_REAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_REAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s6s6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s6s6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type s0s1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_s0s1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(sp), intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_REAL, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_REAL,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_s0s1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_s0s1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d1d1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d1d1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d1d1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d1d1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d2d2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d2d2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d2d2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d2d2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d3d3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d3d3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d3d3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d3d3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d4d4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d4d4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d4d4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d4d4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d5d5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d5d5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d5d5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d5d5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type d6d6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d6d6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_PRECISION, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d6d6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d6d6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type d0d1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_d0d1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    real(dp), intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_DOUBLE_PRECISION, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_DOUBLE_PRECISION,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_d0d1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_d0d1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c1c1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c1c1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c1c1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c1c1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c2c2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c2c2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c2c2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c2c2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c3c3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c3c3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c3c3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c3c3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c4c4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c4c4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c4c4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c4c4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c5c5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c5c5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c5c5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c5c5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type c6c6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c6c6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c6c6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c6c6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type c0c1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_c0c1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(sp), intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_COMPLEX, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_COMPLEX,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_c0c1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_c0c1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z1z1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z1z1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z1z1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z1z1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z2z2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z2z2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z2z2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z2z2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z3z3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z3z3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z3z3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z3z3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z4z4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z4z4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z4z4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z4z4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z5z5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z5z5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z5z5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z5z5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type z6z6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z6z6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_DOUBLE_COMPLEX, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z6z6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z6z6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type z0z1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_z0z1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    complex(dp), intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_DOUBLE_COMPLEX, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_DOUBLE_COMPLEX,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_z0z1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_z0z1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l1l1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l1l1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l1l1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l1l1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l2l2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l2l2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l2l2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l2l2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l3l3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l3l3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l3l3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l3l3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l4l4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l4l4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l4l4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l4l4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l5l5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l5l5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l5l5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l5l5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type l6l6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l6l6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_LOGICAL, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_LOGICAL, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l6l6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l6l6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type l0l1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_l0l1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    logical, intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_LOGICAL, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_LOGICAL,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_l0l1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_l0l1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h1h1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h1h1(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h1h1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h1h1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h2h2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h2h2(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h2h2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h2h2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h3h3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h3h3(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h3h3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h3h3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h4h4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h4h4(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h4h4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h4h4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h5h5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h5h5(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h5h5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h5h5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results of variable length on all processes (type h6h6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h6h6(mycomm, send, recv, recvcounts, displs, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: error0, ii
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, size(send), MPI_CHARACTER, recv, recvcounts, displs0, &
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        & MPI_CHARACTER, mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h6h6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h6h6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !> Gathers results on one process (type h0h1).
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param mycomm  MPI communicator.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param send  Quantity to be sent for gathering.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param recvcounts Counts of received data from each process
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param displs Entry i specifies where to place data from process rank i-1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!               (default: computed from recvcounts assuming order with rank)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !! \param error  Error code on exit.
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  !!
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  subroutine mpifx_allgatherv_h0h1(mycomm, send, recv, recvcounts, displs, error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(in) :: send
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    character(len=*), intent(out) :: recv(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in) :: recvcounts(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(in), optional :: displs(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, intent(out), optional :: error
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer :: ii, error0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    integer, allocatable :: displs0(:)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    allocate(displs0(mycomm%size))
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    if (present(displs)) then
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0 = displs
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    else
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      displs0(1) = 0
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      do ii = 2, mycomm%size
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
        displs0(ii) = displs0(ii-1) + recvcounts(ii-1)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
      end do
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    end if
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call mpi_allgatherv(send, 1, MPI_CHARACTER, recv, recvcounts, displs0, &
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
         & MPI_CHARACTER,  mycomm%id, error0)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
    call handle_errorflag(error0, "MPI_ALLGATHERV in mpifx_allgatherv_h0h1", error)
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"
  end subroutine mpifx_allgatherv_h0h1
# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"


# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgatherv.fpp"

end module mpifx_allgatherv_module
