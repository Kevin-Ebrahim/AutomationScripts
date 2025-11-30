# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

!> Contains routined for MPI shared memory windows.
module mpifx_win_module
  use mpi_f08, only : MPI_ADDRESS_KIND, mpi_barrier, mpi_comm, MPI_INFO_NULL, MPI_MODE_NOCHECK,&
      & mpi_win, mpi_win_allocate_shared, mpi_win_fence, mpi_win_free, mpi_win_lock_all,&
      & mpi_win_shared_query, mpi_win_sync, mpi_win_unlock_all
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_constants_module, only : MPIFX_SIZE_T
  use iso_c_binding, only : c_ptr, c_f_pointer
  use iso_fortran_env, only : int32, int64
  implicit none
  private

  public :: mpifx_win

  !> MPI shared memory window with some additional information.
  type mpifx_win
    private
    type(mpi_win) :: win  !< MPI window handle.
    type(mpi_comm) :: comm  !< MPI communicator handle.
  contains

# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_i_i4
    generic :: allocate_shared => mpifx_win_allocate_shared_i_i4
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_i_i8
    generic :: allocate_shared => mpifx_win_allocate_shared_i_i8
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_s_i4
    generic :: allocate_shared => mpifx_win_allocate_shared_s_i4
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_s_i8
    generic :: allocate_shared => mpifx_win_allocate_shared_s_i8
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_d_i4
    generic :: allocate_shared => mpifx_win_allocate_shared_d_i4
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_d_i8
    generic :: allocate_shared => mpifx_win_allocate_shared_d_i8
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_c_i4
    generic :: allocate_shared => mpifx_win_allocate_shared_c_i4
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_c_i8
    generic :: allocate_shared => mpifx_win_allocate_shared_c_i8
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_z_i4
    generic :: allocate_shared => mpifx_win_allocate_shared_z_i4
# 29 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    procedure, private :: mpifx_win_allocate_shared_z_i8
    generic :: allocate_shared => mpifx_win_allocate_shared_z_i8
# 33 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 34 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

    !> Locks a shared memory segment for remote access.
    !!
    !! Notes based on the MPI3.1 documentation: Start RMA access epoch for all processes in win,
    !! (lock of type MPI_LOCK_SHARED). During the epoch, any window member processses calling
    !! lock_all can access the window memory on all processes (using RMA ops). Routine is not
    !! collective — All is a from being a lock on all members of the win group.
    !! Accesses protected by a shared lock are not concurrent in the window.
    procedure :: lock_all => mpifx_win_lock_all

    !> Unlocks a shared memory window.
    !! Ends the RMA access epoch at all processes with access to the window.
    procedure :: unlock_all => mpifx_win_unlock_all

    !> Synchronizes shared memory across MPI ranks after remote access.
    procedure :: sync => mpifx_win_sync

    !> Ensures consistency of stores between fence calls.
    procedure :: fence => mpifx_win_fence

    !> Deallocates memory associated with a shared memory segment.
    procedure :: free => mpifx_win_free

  end type mpifx_win

contains

# 119 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

  !> Locks a shared memory segment for remote access. Starts a remote access epoch.
  !!
  !! \param self      Handle of the shared memory window.
  !! \param checkLock Optional check if other locks are also applied to the window.
  !! \param error     Optional error code on return.
  !!
  !! \see MPI documentation (\c MPI_WIN_LOCK_ALL)
  !!
  subroutine mpifx_win_lock_all(self, checkLock, error)
    class(mpifx_win), intent(inout) :: self
    logical, intent(in), optional :: checkLock
    integer, intent(out), optional :: error

    integer :: error0
    ! May be MPI implementation dependent, but if true no other process holds (or attempts to
    ! acquire) a conflicting lock, while the caller(s) holds the window lock:
    logical :: assert

    call getoptarg(.false., assert, checkLock)

    if (assert) then
      call mpi_win_lock_all(0, self%win, error0)
    else
      call mpi_win_lock_all(MPI_MODE_NOCHECK, self%win, error0)
    end if
    call handle_errorflag(error0, "MPI_WIN_LOCK_ALL in mpifx_win_lock_all", error)

  end subroutine mpifx_win_lock_all


  !> Unlocks a shared memory segment. Finishes a remote access epoch.
  !!
  !! \param self  Handle of the shared memory window.
  !! \param error  Optional error code on return.
  !!
  !! \see MPI documentation (\c MPI_WIN_UNLOCK_ALL)
  !!
  subroutine mpifx_win_unlock_all(self, error)
    class(mpifx_win), intent(inout) :: self
    integer, intent(out), optional :: error

    integer :: error0

    call mpi_win_unlock_all(self%win, error0)
    call handle_errorflag(error0, "MPI_WIN_UNLOCK_ALL in mpifx_win_unlock_all", error)

  end subroutine mpifx_win_unlock_all


  !> Synchronizes shared memory across MPI ranks after remote access.
  !> Completes all memory stores in a remote access epoch.
  !!
  !! \param self  Handle of the shared memory window.
  !! \param error  Optional error code on return.
  !!
  !! \see MPI documentation (\c MPI_WIN_SYNC)
  !!
  subroutine mpifx_win_sync(self, error)
    class(mpifx_win), intent(inout) :: self
    integer, intent(out), optional :: error

    integer :: error0, error1

    call mpi_win_sync(self%win, error0)
    call handle_errorflag(error0, "MPI_WIN_SYNC in mpifx_win_sync", error)

    call mpi_barrier(self%comm, error1)
    call handle_errorflag(error1, "MPI_BARRIER in mpifx_win_sync", error)

  end subroutine mpifx_win_sync


  !> Ensure consistency of stores between fence calls
  !!
  !! \param self  Handle of the shared memory window.
  !! \param assert  Hint to the MPI library to assume certain condition (e.g., MPI_MODE_NOSTORE).
  !! \param error  Optional error code on return.
  !!
  !! \see MPI documentation (\c MPI_WIN_FENCE)
  !!
  subroutine mpifx_win_fence(self, assert, error)
    class(mpifx_win), intent(inout) :: self
    integer, intent(in), optional :: assert
    integer, intent(out), optional :: error

    integer :: error0, assert_

    assert_ = 0
    if (present(assert)) then
      assert_ = assert
    end if

    call mpi_win_fence(assert_, self%win, error0)
    call handle_errorflag(error0, "MPI_WIN_FENCE in mpifx_win_fence", error)

  end subroutine mpifx_win_fence


  !> Deallocates memory associated with a shared memory segment.
  !!
  !! \param self  Handle of the shared memory window.
  !! \param error  Optional error code on return.
  !!
  !! \see MPI documentation (\c MPI_WIN_FREE)
  !!
  subroutine mpifx_win_free(self, error)
    class(mpifx_win), intent(inout) :: self
    integer, intent(out), optional :: error

    integer :: error0

    call mpi_win_free(self%win, error0)
    call handle_errorflag(error0, "MPI_WIN_FREE in mpifx_win_free", error)

  end subroutine mpifx_win_free


# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type integer in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type integer occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_i_i4(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_i_i4", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_i_i4",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_i_i4
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type integer in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type integer occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_i_i8(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_i_i8", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_i_i8",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_i_i8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type real(sp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type real(sp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_s_i4(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(sp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(sp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_s_i4", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_s_i4",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_s_i4
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type real(sp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type real(sp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_s_i8(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(sp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(sp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_s_i8", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_s_i8",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_s_i8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type real(dp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type real(dp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_d_i4(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(dp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(dp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_d_i4", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_d_i4",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_d_i4
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type real(dp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type real(dp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_d_i8(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(dp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    real(dp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_d_i8", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_d_i8",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_d_i8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type complex(sp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type complex(sp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_c_i4(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(sp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(sp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_c_i4", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_c_i4",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_c_i4
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type complex(sp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type complex(sp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_c_i8(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(sp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(sp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_c_i8", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_c_i8",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_c_i8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 238 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type complex(dp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type complex(dp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_z_i4(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(dp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int32), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(dp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_z_i4", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_z_i4",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_z_i4
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 240 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> Initialized a window handle and returns a pointer to the address associated with a shared
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !> memory segment.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param self  Handle of the shared memory window on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param mycomm  MPI communicator.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_length  Number of elements of type complex(dp) in the entire shared memory window.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param global_pointer  Pointer to the shared data array of length 'global_length' on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_length  Number of elements of type complex(dp) occupied by the current rank.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param local_pointer Pointer to the local chunk of the data array of length 'local_length' on
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \param error  Optional error code on return.
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !! \see MPI documentation (\c MPI_WIN_ALLOCATE_SHARED)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  !!
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  subroutine mpifx_win_allocate_shared_z_i8(self, mycomm, global_length, global_pointer,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      & local_length, local_pointer, error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_win), intent(out) :: self
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    class(mpifx_comm), intent(in) :: mycomm
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in) :: global_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(dp), pointer, intent(out) :: global_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(int64), intent(in), optional :: local_length
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    complex(dp), pointer, intent(out), optional :: local_pointer(:)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer, intent(out), optional :: error
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer :: disp_unit, error0, error1
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    integer(MPI_ADDRESS_KIND) :: global_mem_size, local_mem_size
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    type(c_ptr) :: global_baseptr, local_baseptr
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    disp_unit = storage_size(global_pointer) / 8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    local_mem_size = 0
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_length)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(local_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    else if (mycomm%lead) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      local_mem_size = int(global_length, kind=MPI_ADDRESS_KIND) * disp_unit
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    self%comm%mpi_val = mycomm%id
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_allocate_shared(local_mem_size, disp_unit, MPI_INFO_NULL, self%comm,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & local_baseptr, self%win, error0)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error0,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & "MPI_WIN_ALLOCATE_SHARED in mpifx_win_allocate_shared_z_i8", error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call mpi_win_shared_query(self%win, mycomm%leadrank, global_mem_size, disp_unit,&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & global_baseptr, error1)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call handle_errorflag(error1, "MPI_WIN_SHARED_QUERY in mpifx_win_allocate_shared_z_i8",&
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
        & error)
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    call c_f_pointer(global_baseptr, global_pointer, [global_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    if (present(local_pointer)) then
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
      call c_f_pointer(local_baseptr, local_pointer, [local_length])
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
    end if
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"
  end subroutine mpifx_win_allocate_shared_z_i8
# 241 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 243 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_win.fpp"

end module mpifx_win_module
