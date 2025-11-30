# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

!> Contains wrapper for \c MPI_GATHER
module mpifx_gather_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_gather

  !> Gathers scalars/arrays on a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second and third arguments. The second and third
  !! arguments can be of type integer (i), real (s), double precision (d),
  !! complex (c), double complex (z) and logical (l). Their rank can vary from
  !! zero (scalars) up to the maximum rank. Both arguments must be of same
  !! type. The third argument must have the size of the second times the number
  !! of processes taking part in the gathering. The third argument must have
  !! either the same rank as the second one or one rank more. In latter case
  !! the last dimension of it must be of the size of the number of processes
  !! in the gathering.
  !!
  !! \see MPI documentation (\c MPI_GATHER)
  !!
  !! Example:
  !!
  !!     program test_gather
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       integer :: send0
  !!       integer, allocatable :: send1(:)
  !!       integer, allocatable :: recv1(:), recv2(:,:)
  !!       character(100) :: formstr
  !!       character(*), parameter :: label = "(I2.2,'-',I3.3,'|',1X"
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!
  !!       ! I0 -> I1
  !!       send0 = mycomm%rank * 2    ! Arbitrary number to send
  !!       if (mycomm%lead) then
  !!         allocate(recv1(1 * mycomm%size))
  !!         recv1(:) = 0
  !!       else
  !!         allocate(recv1(0))
  !!       end if
  !!       write(*, *) mycomm%rank, "Send0 buffer:", send0
  !!       call mpifx_gather(mycomm, send0, recv1)
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Recv1 buffer:", recv1(:)
  !!       end if
  !!       deallocate(recv1)
  !!
  !!       ! I1 -> I1
  !!       allocate(send1(2))
  !!       send1(:) = [ mycomm%rank, mycomm%rank + 1 ]  ! Arbitrary numbers
  !!       if (mycomm%lead) then
  !!         allocate(recv1(size(send1) * mycomm%size))
  !!         recv1(:) = 0
  !!       else
  !!         allocate(recv1(0))
  !!       end if
  !!       write(*, *) mycomm%rank, "Send1 buffer:", send1(:)
  !!       call mpifx_gather(mycomm, send1, recv1)
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Recv1 buffer:", recv1
  !!       end if
  !!
  !!       ! I1 -> I2
  !!       send1(:) = [ mycomm%rank, mycomm%rank + 1 ]
  !!       if (mycomm%lead) then
  !!         allocate(recv2(size(send1), mycomm%size))
  !!         recv2(:,:) = 0
  !!       end if
  !!       write(*, *) mycomm%rank, "Send1 buffer:", send1(:)
  !!       call mpifx_gather(mycomm, send1, recv2)
  !!       if (mycomm%lead) then
  !!         write(*, *) mycomm%rank, "Recv2 buffer:", recv2
  !!       end if
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_gather
  !!
  interface mpifx_gather
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i0i1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i1i1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i1i2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i2i2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i2i3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i3i3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i3i4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i4i4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i4i5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i5i5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i5i6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_i6i6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s0s1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s1s1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s1s2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s2s2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s2s3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s3s3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s3s4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s4s4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s4s5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s5s5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s5s6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_s6s6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d0d1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d1d1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d1d2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d2d2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d2d3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d3d3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d3d4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d4d4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d4d5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d5d5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d5d6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_d6d6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c0c1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c1c1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c1c2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c2c2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c2c3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c3c3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c3c4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c4c4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c4c5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c5c5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c5c6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_c6c6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z0z1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z1z1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z1z2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z2z2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z2z3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z3z3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z3z4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z4z4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z4z5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z5z5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z5z6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_z6z6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l0l1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l1l1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l1l2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l2l2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l2l3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l3l3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l3l4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l4l4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l4l5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l5l5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l5l6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_l6l6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h0h1
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h1h1
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h1h2
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h2h2
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h2h3
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h3h3
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h3h4
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h4h4
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h4h5
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h5h5
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h5h6
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
      module procedure mpifx_gather_h6h6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end interface mpifx_gather

contains

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"


# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i0i1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i0i1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_INTEGER, recv, 1, MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i0i1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i0i1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i1i1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i1i1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i1i1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i1i1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i1i2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i1i2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i1i2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i1i2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i2i2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i2i2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i2i2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i2i2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i2i3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i2i3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i2i3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i2i3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i3i3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i3i3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i3i3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i3i3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i3i4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i3i4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i3i4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i3i4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i4i4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i4i4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i4i4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i4i4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i4i5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i4i5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i4i5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i4i5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i5i5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i5i5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i5i5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i5i5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i5i6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i5i6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i5i6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i5i6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type i6i6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_i6i6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_i6i6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_i6i6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s0s1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s0s1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_REAL, recv, 1, MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s0s1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s0s1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s1s1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s1s1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s1s1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s1s1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s1s2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s1s2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s1s2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s1s2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s2s2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s2s2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s2s2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s2s2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s2s3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s2s3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s2s3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s2s3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s3s3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s3s3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s3s3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s3s3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s3s4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s3s4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s3s4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s3s4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s4s4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s4s4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s4s4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s4s4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s4s5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s4s5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s4s5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s4s5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s5s5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s5s5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s5s5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s5s5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s5s6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s5s6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s5s6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s5s6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type s6s6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_s6s6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_s6s6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_s6s6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d0d1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d0d1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_DOUBLE_PRECISION, recv, 1, MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d0d1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d0d1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d1d1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d1d1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d1d1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d1d1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d1d2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d1d2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d1d2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d1d2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d2d2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d2d2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d2d2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d2d2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d2d3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d2d3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d2d3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d2d3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d3d3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d3d3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d3d3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d3d3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d3d4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d3d4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d3d4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d3d4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d4d4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d4d4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d4d4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d4d4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d4d5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d4d5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d4d5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d4d5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d5d5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d5d5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d5d5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d5d5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d5d6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d5d6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d5d6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d5d6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type d6d6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_d6d6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_d6d6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_d6d6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c0c1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c0c1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_COMPLEX, recv, 1, MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c0c1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c0c1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c1c1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c1c1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c1c1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c1c1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c1c2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c1c2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c1c2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c1c2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c2c2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c2c2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c2c2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c2c2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c2c3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c2c3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c2c3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c2c3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c3c3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c3c3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c3c3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c3c3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c3c4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c3c4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c3c4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c3c4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c4c4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c4c4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c4c4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c4c4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c4c5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c4c5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c4c5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c4c5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c5c5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c5c5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c5c5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c5c5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c5c6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c5c6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c5c6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c5c6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type c6c6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_c6c6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_c6c6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_c6c6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z0z1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z0z1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_DOUBLE_COMPLEX, recv, 1, MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z0z1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z0z1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z1z1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z1z1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z1z1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z1z1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z1z2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z1z2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z1z2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z1z2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z2z2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z2z2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z2z2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z2z2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z2z3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z2z3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z2z3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z2z3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z3z3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z3z3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z3z3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z3z3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z3z4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z3z4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z3z4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z3z4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z4z4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z4z4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z4z4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z4z4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z4z5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z4z5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z4z5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z4z5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z5z5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z5z5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z5z5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z5z5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z5z6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z5z6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z5z6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z5z6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type z6z6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_z6z6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_z6z6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_z6z6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l0l1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l0l1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_LOGICAL, recv, 1, MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l0l1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l0l1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l1l1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l1l1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l1l1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l1l1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l1l2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l1l2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l1l2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l1l2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l2l2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l2l2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l2l2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l2l2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l2l3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l2l3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l2l3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l2l3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l3l3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l3l3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l3l3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l3l3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l3l4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l3l4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l3l4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l3l4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l4l4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l4l4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l4l4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l4l4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l4l5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l4l5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l4l5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l4l5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l5l5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l5l5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l5l5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l5l5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l5l6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l5l6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l5l6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l5l6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type l6l6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_l6l6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_l6l6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_l6l6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h0h1).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h0h1(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, 1, MPI_CHARACTER, recv, 1, MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h0h1", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h0h1
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h1h1).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h1h1(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h1h1", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h1h1
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h1h2).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h1h2(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_CHARACTER, recv, size(send), MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h1h2", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h1h2
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h2h2).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h2h2(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h2h2", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h2h2
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h2h3).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h2h3(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_CHARACTER, recv, size(send), MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h2h3", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h2h3
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h3h3).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h3h3(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h3h3", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h3h3
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h3h4).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h3h4(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_CHARACTER, recv, size(send), MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h3h4", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h3h4
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h4h4).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h4h4(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h4h4", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h4h4
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h4h5).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h4h5(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_CHARACTER, recv, size(send), MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h4h5", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h4h5
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h5h5).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h5h5(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h5h5", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h5h5
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h5h6).
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (indefined on other nodes)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h5h6(mycomm, send, recv, root, error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, size(send), MPI_CHARACTER, recv, size(send), MPI_CHARACTER, root0, mycomm%id,&
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & error0)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h5h6", error)
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h5h6
# 197 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !> Gathers results on one process (type h6h6).
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param mycomm  MPI communicator.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param send  Quantity to be sent for gathering.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param recv  Received data on receive node (undefined on other nodes)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !! \param error  Error code on exit.
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  !!
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  subroutine mpifx_gather_h6h6(mycomm, send, recv, root, error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(in), optional :: root
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer, intent(out), optional :: error
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    integer :: root0, error0
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call mpi_gather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, root0,&
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
        & mycomm%id, error0)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
    call handle_errorflag(error0, "MPI_GATHER in mpifx_gather_h6h6", error)
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
  end subroutine mpifx_gather_h6h6
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 199 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"

# 201 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_gather.fpp"


end module mpifx_gather_module
