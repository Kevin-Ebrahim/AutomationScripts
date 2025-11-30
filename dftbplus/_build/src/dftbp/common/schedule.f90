# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90" 2

# 11 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
# 16 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

# 18 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
# 20 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

!> Contains routines helpful for mpi-parallelisation.
module dftbp_common_schedule
  use dftbp_common_accuracy, only : dp
  use dftbp_common_environment, only : TEnvironment
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  use dftbp_extlibs_mpifx, only : MPI_SUM, mpifx_allgatherv, mpifx_allreduceip
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  implicit none

  private
  public :: distributeRangeInChunks, distributeRangeInChunks2, distributeRangeWithWorkload
  public :: assembleChunks, getChunkRanges, getIndicesWithWorkload, gatherChunks
  public :: getStartAndEndIndex

# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleR0Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleR1Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleR2Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleR3Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleR4Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleC1Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleC2Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleC3Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleC4Chunks
  end interface assembleChunks
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface assembleChunks
    module procedure assembleI1Chunks
  end interface assembleChunks
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface gatherChunks
    module procedure gatherR1Chunks
  end interface gatherChunks
# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface gatherChunks
    module procedure gatherC1Chunks
  end interface gatherChunks
# 42 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
  interface gatherChunks
    module procedure gatherI1Chunks
  end interface gatherChunks
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

contains


  !> Distributes a range in chunks over processes within a process group.
  subroutine distributeRangeInChunks(env, globalFirst, globalLast, localFirst, localLast)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> First element to process locally
    integer, intent(out) :: localFirst

    !> Last element to process locally
    integer, intent(out) :: localLast

# 69 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call getChunkRanges(env%mpi%groupComm%size, env%mpi%groupComm%rank, globalFirst, globalLast,&
        & localFirst, localLast)
# 75 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine distributeRangeInChunks


  !> Distributes a ranges in a double loop in chunks over processes within a process group.
  !>
  !> It will chop the loop with the wider range into chunks and leave the other intact.
  !>
  subroutine distributeRangeInChunks2(env, globalFirst1, globalLast1, globalFirst2, globalLast2,&
      & localFirst1, localLast1, localFirst2, localLast2)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range for the outer loop
    integer, intent(in) :: globalFirst1

    !> Last element of the range for the outer loop
    integer, intent(in) :: globalLast1

    !> First element of the range for the inner loop
    integer, intent(in) :: globalFirst2

    !> Last element of the range for the inner loop
    integer, intent(in) :: globalLast2

    !> First element to process locally
    integer, intent(out) :: localFirst1

    !> Last element to process locally
    integer, intent(out) :: localLast1

    !> First element to process locally
    integer, intent(out) :: localFirst2

    !> Last element to process locally
    integer, intent(out) :: localLast2

# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    if (globalLast1 - globalFirst1 >= globalLast2 - globalFirst2) then
      call getChunkRanges(env%mpi%groupComm%size, env%mpi%groupComm%rank, globalFirst1,&
          & globalLast1, localFirst1, localLast1)
      localFirst2 = globalFirst2
      localLast2 = globalLast2
    else
      localFirst1 = globalFirst1
      localLast1 = globalLast1
      call getChunkRanges(env%mpi%groupComm%size, env%mpi%groupComm%rank, globalFirst2,&
          & globalLast2, localFirst2, localLast2)
    end if
# 131 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine distributeRangeInChunks2


  !> Distributes a range among processes within a process group
  !> and take into account that each item may have a different workload
  subroutine distributeRangeWithWorkload(env, globalFirst, globalLast, workload, indices)

    !> Computational environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> Number of elements each item has to process
    integer, intent(in) :: workload(:)

    !> Index array to be iterated over
    integer, allocatable, intent(out) :: indices(:)

    integer :: ii

# 157 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call getIndicesWithWorkload(env%mpi%groupComm%size, env%mpi%groupComm%rank, globalFirst,&
        & globalLast, workload, indices)
# 163 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine distributeRangeWithWorkload


# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleR0Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    real(dp), intent(inout) :: chunks

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleR0Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleR1Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    real(dp), intent(inout) :: chunks(:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleR1Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleR2Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    real(dp), intent(inout) :: chunks(:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleR2Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleR3Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    real(dp), intent(inout) :: chunks(:,:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleR3Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleR4Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    real(dp), intent(inout) :: chunks(:,:,:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleR4Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleC1Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    complex(dp), intent(inout) :: chunks(:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleC1Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleC2Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    complex(dp), intent(inout) :: chunks(:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleC2Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleC3Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    complex(dp), intent(inout) :: chunks(:,:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleC3Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleC4Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    complex(dp), intent(inout) :: chunks(:,:,:,:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleC4Chunks

# 168 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Assembles the chunks by summing up contributions within a process group.
  subroutine assembleI1Chunks(env,chunks)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array to assemble
    integer, intent(inout) :: chunks(:)

# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    call mpifx_allreduceip(env%mpi%groupComm, chunks, MPI_SUM)
# 181 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine assembleI1Chunks

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Gathers chunks within a process group in a global array.
  subroutine gatherR1Chunks(env, globalFirst, globalLast, chunks, composite)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> Array to gather
    real(dp), intent(in) :: chunks(:)

    !> Gathered array
    real(dp), intent(out) :: composite(:)

    integer, allocatable :: locSize(:), vOffset(:)
    integer :: localFirst, localLast, iProc

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    allocate(locSize(env%mpi%groupComm%size))
    allocate(vOffSet(env%mpi%groupComm%size))

    do iProc = 1, env%mpi%groupComm%size
      call getChunkRanges(env%mpi%groupComm%size, iProc-1, globalFirst, globalLast, localFirst, &
        & localLast)
      locSize(iProc) = localLast - localFirst + 1
      vOffSet(iProc) = localFirst - 1
    enddo
    call mpifx_allgatherv(env%mpi%globalComm, chunks, composite, locSize, vOffset)
# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine gatherR1Chunks

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Gathers chunks within a process group in a global array.
  subroutine gatherC1Chunks(env, globalFirst, globalLast, chunks, composite)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> Array to gather
    complex(dp), intent(in) :: chunks(:)

    !> Gathered array
    complex(dp), intent(out) :: composite(:)

    integer, allocatable :: locSize(:), vOffset(:)
    integer :: localFirst, localLast, iProc

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    allocate(locSize(env%mpi%groupComm%size))
    allocate(vOffSet(env%mpi%groupComm%size))

    do iProc = 1, env%mpi%groupComm%size
      call getChunkRanges(env%mpi%groupComm%size, iProc-1, globalFirst, globalLast, localFirst, &
        & localLast)
      locSize(iProc) = localLast - localFirst + 1
      vOffSet(iProc) = localFirst - 1
    enddo
    call mpifx_allgatherv(env%mpi%globalComm, chunks, composite, locSize, vOffset)
# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine gatherC1Chunks

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  !> Gathers chunks within a process group in a global array.
  subroutine gatherI1Chunks(env, globalFirst, globalLast, chunks, composite)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> Array to gather
    integer, intent(in) :: chunks(:)

    !> Gathered array
    integer, intent(out) :: composite(:)

    integer, allocatable :: locSize(:), vOffset(:)
    integer :: localFirst, localLast, iProc

# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    allocate(locSize(env%mpi%groupComm%size))
    allocate(vOffSet(env%mpi%groupComm%size))

    do iProc = 1, env%mpi%groupComm%size
      call getChunkRanges(env%mpi%groupComm%size, iProc-1, globalFirst, globalLast, localFirst, &
        & localLast)
      locSize(iProc) = localLast - localFirst + 1
      vOffSet(iProc) = localFirst - 1
    enddo
    call mpifx_allgatherv(env%mpi%globalComm, chunks, composite, locSize, vOffset)
# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine gatherI1Chunks

# 227 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"


  !> Calculate the chunk ranges for a given MPI-communicator.
  subroutine getChunkRanges(groupSize, myRank, globalFirst, globalLast, localFirst, localLast)

    !> Size of the group over which the chunks should be distributed
    integer, intent(in) :: groupSize

    !> Rank of the current process
    integer, intent(in) :: myRank

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> First element to process locally
    integer, intent(out) :: localFirst

    !> Last element to process locally
    integer, intent(out) :: localLast

    integer :: rangeLength, nLocal, remainder

    rangeLength = globalLast - globalFirst + 1
    nLocal = rangeLength / groupSize
    remainder = mod(rangeLength, groupSize)
    if (myRank < remainder) then
      nLocal = nLocal + 1
      localFirst = globalFirst + myRank * nLocal
    else
      localFirst = globalFirst + remainder * (nLocal + 1) + (myRank - remainder) * nLocal
    end if
    localLast = min(localFirst + nLocal - 1, globalLast)

  end subroutine getChunkRanges


  !> Calculate the indices for a given MPI-communicator considerung different workload
  subroutine getIndicesWithWorkload(groupSize, myRank, globalFirst, globalLast, workload, indices)

    !> Size of the group over which the chunks should be distributed
    integer, intent(in) :: groupSize

    !> Rank of the current process
    integer, intent(in) :: myRank

    !> First element of the range
    integer, intent(in) :: globalFirst

    !> Last element of the range
    integer, intent(in) :: globalLast

    !> Workload for each item
    integer, intent(in) :: workload(:)

    !> Index array to be iterated over
    integer, allocatable, intent(out) :: indices(:)

    integer :: numIndices, rank, ii
    integer, allocatable :: rankWorkload(:), indices_(:)

    allocate(indices_(globalLast - globalFirst + 1))
    allocate(rankWorkload(groupSize))

    rankWorkload(:) = 0
    indices_(:) = 0
    numIndices = 0

    do ii = globalFirst, globalLast
      rank = minloc(rankWorkload, dim=1)
      rankWorkload(rank) = rankWorkload(rank) + max(1, workload(ii))
      if (rank == myRank + 1) then
        numIndices = numIndices + 1
        indices_(numIndices) = ii
      end if
    end do

    allocate(indices(numIndices))
    indices(1:numIndices) = indices_(1:numIndices)

  end subroutine getIndicesWithWorkload


  !> Returns the start and end index of an MPI process that calculates parts of a loop.
  subroutine getStartAndEndIndex(env, nElements, iStart, iEnd)

    !> Environment settings
    type(TEnvironment), intent(in) :: env

    !> Array size to split
    integer, intent(in) :: nElements

    !> Start and end index of current element range
    integer, intent(out) :: iStart, iEnd

# 325 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"
    !! Size of split index regions
    integer :: splitSize

    !! Number of elements that exceed integer times nProcs
    integer :: offset
# 331 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"



# 335 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"


    splitSize = nElements / env%mpi%globalComm%size

    ! start and end indices assuming equal split sizes
    iStart = env%mpi%globalComm%rank * splitSize + 1
    iEnd = iStart + splitSize - 1

    ! distribute possible remainder to the ranges at the end
    offset = env%mpi%globalComm%size - mod(nElements, env%mpi%globalComm%size)
    if (env%mpi%globalComm%rank + 1 > offset) then
      iStart = iStart + env%mpi%globalComm%rank - offset
      iEnd = iEnd + env%mpi%globalComm%rank - offset + 1
    end if
# 353 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/common/schedule.F90"

  end subroutine getStartAndEndIndex


end module dftbp_common_schedule
