# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

!> Contains wrapper for \c MPI_ALLGATHER
module mpifx_allgather_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_allgather

  !> Gathers scalars/arrays on all nodes.
  !!
  !! All functions have the same argument list only differing in the type and
  !! rank of the second and third arguments. The second and third arguments can
  !! be of type integer, real, double precision, complex, double complex and
  !! logical. Their rank can vary from zero (scalars) up to the maximum
  !! rank. Both arguments must be of same type. The third argument must have the
  !! size of the second times the number of processes taking part in the
  !! gathering. The third argument must have either the same rank as the second
  !! one or one rank more. In latter case its last dimension must be of the size
  !! of the number of processes participating in the gathering operation.
  !!
  !! See MPI documentation (mpi_allgather()) for further details.
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
  !!       send0 = mycomm%rank * 2
  !!       allocate(recv1(1 * mycomm%size))
  !!       recv1(:) = 0
  !!       write(*, *) mycomm%rank, "Send0 buffer:", send0
  !!       call mpifx_gather(mycomm, send0, recv1)
  !!       write(*, *) mycomm%rank, "Recv1 buffer:", recv1(:)
  !!       deallocate(recv1)
  !!
  !!       ! I1 -> I1
  !!       allocate(send1(2))
  !!       allocate(recv1(size(send1) * mycomm%size))
  !!       recv1(:) = 0
  !!       send1(:) = [ mycomm%rank, mycomm%rank + 1 ]
  !!       write(*, *) "Send1 buffer:", send1(:)
  !!       call mpifx_gather(mycomm, send1, recv1)
  !!       write(*, *) "Recv1 buffer:", recv1
  !!
  !!       ! I1 -> I2
  !!       allocate(recv2(size(send1), mycomm%size))
  !!       recv2(:,:) = 0
  !!       send1(:) = [ mycomm%rank, mycomm%rank + 1 ]
  !!       write(*, *) "Send1 buffer:", send1(:)
  !!       call mpifx_gather(mycomm, send1, recv2)
  !!       write(*, *) "Recv2 buffer:", recv2
  !!
  !!       call mpifx_finalize()
  !!
  !!     end program test_gather
  !!
  interface mpifx_allgather
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i0i1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i1i1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i1i2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i2i2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i2i3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i3i3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i3i4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i4i4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i4i5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i5i5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i5i6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_i6i6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s0s1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s1s1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s1s2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s2s2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s2s3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s3s3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s3s4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s4s4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s4s5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s5s5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s5s6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_s6s6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d0d1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d1d1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d1d2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d2d2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d2d3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d3d3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d3d4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d4d4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d4d5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d5d5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d5d6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_d6d6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c0c1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c1c1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c1c2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c2c2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c2c3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c3c3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c3c4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c4c4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c4c5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c5c5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c5c6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_c6c6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z0z1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z1z1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z1z2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z2z2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z2z3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z3z3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z3z4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z4z4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z4z5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z5z5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z5z6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_z6z6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l0l1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l1l1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l1l2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l2l2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l2l3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l3l3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l3l4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l4l4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l4l5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l5l5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l5l6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_l6l6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 77 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h0h1
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h1h1
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h1h2
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h2h2
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h2h3
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h3h3
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h3h4
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h4h4
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h4h5
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h5h5
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 85 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h5h6
# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 78 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
      module procedure mpifx_allgather_h6h6
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 87 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end interface mpifx_allgather

contains


# 132 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"


# 171 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"


# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i0i1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i0i1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_INTEGER, recv, 1, MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i0i1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i0i1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i1i1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i1i1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i1i1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i1i1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i1i2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i1i2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i1i2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i1i2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i2i2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i2i2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i2i2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i2i2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i2i3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i2i3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i2i3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i2i3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i3i3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i3i3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i3i3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i3i3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i3i4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i3i4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i3i4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i3i4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i4i4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i4i4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i4i4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i4i4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i4i5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i4i5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i4i5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i4i5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i5i5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i5i5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i5i5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i5i5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i5i6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i5i6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i5i6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i5i6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type i6i6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_i6i6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_INTEGER, recv, size(send), MPI_INTEGER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_i6i6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_i6i6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s0s1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s0s1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_REAL, recv, 1, MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s0s1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s0s1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s1s1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s1s1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s1s1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s1s1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s1s2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s1s2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s1s2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s1s2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s2s2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s2s2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s2s2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s2s2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s2s3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s2s3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s2s3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s2s3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s3s3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s3s3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s3s3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s3s3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s3s4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s3s4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s3s4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s3s4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s4s4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s4s4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s4s4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s4s4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s4s5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s4s5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s4s5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s4s5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s5s5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s5s5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s5s5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s5s5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s5s6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s5s6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s5s6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s5s6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type s6s6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_s6s6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(sp), intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_REAL, recv, size(send), MPI_REAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_s6s6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_s6s6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d0d1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d0d1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_DOUBLE_PRECISION, recv, 1, MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d0d1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d0d1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d1d1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d1d1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d1d1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d1d1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d1d2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d1d2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d1d2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d1d2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d2d2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d2d2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d2d2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d2d2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d2d3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d2d3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d2d3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d2d3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d3d3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d3d3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d3d3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d3d3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d3d4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d3d4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d3d4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d3d4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d4d4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d4d4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d4d4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d4d4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d4d5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d4d5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d4d5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d4d5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d5d5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d5d5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d5d5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d5d5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d5d6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d5d6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d5d6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d5d6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type d6d6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_d6d6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    real(dp), intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_PRECISION, recv, size(send), MPI_DOUBLE_PRECISION, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_d6d6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_d6d6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c0c1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c0c1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_COMPLEX, recv, 1, MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c0c1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c0c1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c1c1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c1c1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c1c1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c1c1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c1c2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c1c2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c1c2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c1c2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c2c2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c2c2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c2c2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c2c2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c2c3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c2c3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c2c3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c2c3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c3c3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c3c3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c3c3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c3c3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c3c4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c3c4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c3c4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c3c4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c4c4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c4c4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c4c4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c4c4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c4c5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c4c5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c4c5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c4c5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c5c5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c5c5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c5c5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c5c5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c5c6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c5c6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c5c6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c5c6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type c6c6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_c6c6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(sp), intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_COMPLEX, recv, size(send), MPI_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_c6c6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_c6c6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z0z1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z0z1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_DOUBLE_COMPLEX, recv, 1, MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z0z1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z0z1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z1z1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z1z1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z1z1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z1z1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z1z2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z1z2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z1z2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z1z2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z2z2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z2z2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z2z2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z2z2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z2z3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z2z3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z2z3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z2z3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z3z3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z3z3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z3z3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z3z3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z3z4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z3z4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z3z4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z3z4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z4z4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z4z4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z4z4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z4z4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z4z5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z4z5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z4z5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z4z5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z5z5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z5z5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z5z5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z5z5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z5z6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z5z6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z5z6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z5z6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type z6z6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_z6z6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    complex(dp), intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_DOUBLE_COMPLEX, recv, size(send), MPI_DOUBLE_COMPLEX, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_z6z6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_z6z6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l0l1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l0l1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, 1, MPI_LOGICAL, recv, 1, MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l0l1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l0l1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l1l1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l1l1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l1l1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l1l1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l1l2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l1l2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l1l2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l1l2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l2l2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l2l2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l2l2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l2l2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l2l3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l2l3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l2l3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l2l3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l3l3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l3l3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l3l3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l3l3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l3l4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l3l4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l3l4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l3l4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l4l4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l4l4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l4l4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l4l4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l4l5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l4l5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l4l5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l4l5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l5l5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l5l5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l5l5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l5l5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l5l6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l5l6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l5l6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l5l6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type l6l6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_l6l6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    logical, intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, size(send), MPI_LOGICAL, recv, size(send), MPI_LOGICAL, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_l6l6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_l6l6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 174 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h0h1).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h0h1(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * 1, MPI_CHARACTER, recv, len(send) * 1, MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h0h1', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h0h1
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h1h1).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h1h1(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h1h1', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h1h1
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h1h2).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h1h2(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h1h2', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h1h2
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h2h2).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h2h2(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h2h2', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h2h2
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h2h3).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h2h3(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h2h3', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h2h3
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h3h3).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h3h3(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h3h3', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h3h3
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h3h4).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h3h4(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h3h4', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h3h4
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h4h4).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h4h4(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h4h4', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h4h4
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h4h5).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h4h5(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h4h5', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h4h5
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h5h5).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h5h5(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h5h5', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h5h5
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h5h6).
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h5h6(mycomm, send, recv, error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  MPI communicator.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Quantity to be sent for gathering.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> Error code on exit.
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER,&
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & mycomm%id, error0)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h5h6', error)
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h5h6
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 175 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !> Gathers results on all processes (type h6h6).
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !! See mpi_allgather() for further details.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  !!
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  subroutine mpifx_allgather_h6h6(mycomm, send, recv, error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !> MPI communicator.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Quantity to be sent for gathering.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(in) :: send(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Received data.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    character(len=*), intent(out) :: recv(:,:,:,:,:,:)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    !>  Error code on exit.
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer, intent(out), optional :: error
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    integer :: error0
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call mpi_allgather(send, len(send) * size(send), MPI_CHARACTER, recv, len(send) * size(send), MPI_CHARACTER, mycomm%id,&
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
        & error0)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
    call handle_errorflag(error0, 'MPI_ALLGATHER in mpifx_allgather_h6h6', error)
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
  end subroutine mpifx_allgather_h6h6
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"
# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allgather.fpp"

end module mpifx_allgather_module
