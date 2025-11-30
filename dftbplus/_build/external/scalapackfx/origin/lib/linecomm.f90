# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

!> Contains the linecomm type.
module linecomm_module
  use blacsfx_module
  use scalapackfx_common_module
  use scalapackfx_module
  implicit none
  private

  public :: linecomm


  !> Type for communicating a row or a column of a distributed matrix.
  !!
  !! \details The type linecomm collects/distributes a line (row or column)
  !! of a distributed matrix into/from a buffer on the lead node.
  !! It communicate the entire line at once or blockwise, with the blocks
  !! having the size of the BLACS block size.
  !!
  !! The code below demonstrates how to write out a distributed matrix
  !! columnwise to disc with the help of linecomm:
  !!
  !!     type(linecomm) :: collector
  !!     real(dp), allocatable :: iobuffer(:)
  !!
  !!     allocate(iobuffer(desc(M_))
  !!     call collector%init(mygrid, desc, "c")
  !!     do icol = 1, desc(N_)
  !!       if (mygrid%lead) then
  !!         call collector%getline_lead(mygrid, icol, mtxloc, iobuffer)
  !!         write(fd, formatstr) iobuffer(:)
  !!       else
  !!         call collector%getline_follow(mygrid, icol, mtxloc)
  !!       end if
  !!     end do
  !!
  !! Similarly, to read from a file columnwise, you could do the following:
  !!
  !!     type(linecomm) :: distributor
  !!     real(dp), allocatable :: iobuffer(:)
  !!
  !!     allocate(iobuffer(desc(M_))
  !!     call distributor%init(desc, "c")
  !!     do icol = 1, ncol
  !!       if (mygrid%lead) then
  !!         read(fd, *) iobuffer(:)
  !!         call distributor%setline_lead(mygrid, icol, iobuffer, mtxloc)
  !!       else
  !!         call distributor%setline_follow(mygrid, icol, mtxloc)
  !!       end if
  !!     end do
  !!
  type :: linecomm
    private
    integer :: nn, nblock, blocksize, iorow, iocol
    logical :: rowcollect
    integer :: desc(DLEN_)
  contains
    procedure :: init
    procedure :: getnrblocks
    procedure :: getblocksize

# 67 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_lead_int
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_lead_real
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_lead_dreal
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_lead_complex
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_lead_dcomplex
# 70 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 67 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_follow_int
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_follow_real
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_follow_dreal
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_follow_complex
# 68 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getblock_follow_dcomplex
# 70 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

    generic :: getblock_lead => getblock_lead_int, getblock_lead_real, &
        & getblock_lead_dreal, getblock_lead_complex, &
        & getblock_lead_dcomplex
    generic :: getblock_follow => getblock_follow_int, getblock_follow_real, &
        & getblock_follow_dreal, getblock_follow_complex, getblock_follow_dcomplex

# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_lead_int
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_lead_real
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_lead_dreal
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_lead_complex
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_lead_dcomplex
# 82 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 79 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_follow_int
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_follow_real
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_follow_dreal
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_follow_complex
# 80 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: getline_follow_dcomplex
# 82 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

    generic :: getline_lead => getline_lead_int, getline_lead_real, &
        & getline_lead_dreal, getline_lead_complex, getline_lead_dcomplex
    generic :: getline_follow => getline_follow_int, getline_follow_real, &
        & getline_follow_dreal, getline_follow_complex, getline_follow_dcomplex

# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_lead_int
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_lead_real
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_lead_dreal
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_lead_complex
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_lead_dcomplex
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 90 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_follow_int
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_follow_real
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_follow_dreal
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_follow_complex
# 91 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setblock_follow_dcomplex
# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 94 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

    generic :: setblock_lead => setblock_lead_int, setblock_lead_real, &
        & setblock_lead_dreal, setblock_lead_complex, &
        & setblock_lead_dcomplex
    generic :: setblock_follow => setblock_follow_int, setblock_follow_real, &
        & setblock_follow_dreal, setblock_follow_complex, setblock_follow_dcomplex

# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_lead_int
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_lead_real
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_lead_dreal
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_lead_complex
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_lead_dcomplex
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 102 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_follow_int
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_follow_real
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_follow_dreal
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_follow_complex
# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        procedure :: setline_follow_dcomplex
# 105 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

    generic :: setline_lead => setline_lead_int, setline_lead_real, &
        & setline_lead_dreal, setline_lead_complex, setline_lead_dcomplex
    generic :: setline_follow => setline_follow_int, setline_follow_real, &
        & setline_follow_dreal, setline_follow_complex, setline_follow_dcomplex

    procedure, private :: getpositions
  end type linecomm


contains

  !> Initializes a linecomm instance.
  !!
  !! \param self  Initialized instance on exit.
  !! \param desc  Descriptor of distributed matrix.
  !! \param rowcol  If "r" or "R", a given row of the matrix is collected,
  !!     otherwise a given column.
  !! \param iorow  Row of process doing the io (default: row of lead).
  !! \param iocol  Column of process doing the io (default: column of lead).
  !!
  subroutine init(self, mygrid, desc, rowcol, iorow, iocol)
    class(linecomm), intent(out) :: self
    class(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_)
    character, intent(in) :: rowcol
    integer, intent(in), optional :: iorow, iocol

  if (present(iorow)) then
# 134 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    self%iorow = iorow
# 134 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  else
# 134 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    self%iorow = mygrid%leadrow
# 134 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end if
  if (present(iocol)) then
# 135 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    self%iocol = iocol
# 135 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  else
# 135 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    self%iocol = mygrid%leadcol
# 135 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end if
    self%rowcollect = (rowcol == "R" .or. rowcol == "r")
    self%desc(:) = desc
    if (self%rowcollect) then
      self%nn = desc(M_)
      self%blocksize = desc(MB_)
    else
      self%nn = desc(N_)
      self%blocksize = desc(NB_)
    end if
    self%nblock = self%nn / self%blocksize
    if (mod(self%nn, self%blocksize) /= 0) then
      self%nblock = self%nblock + 1
    end if

  end subroutine init


  !> Returns the nr. of blocks along the given row or column.
  !!
  !! \param self  Instance.
  !!
  function getnrblocks(self) result(res)
    class(linecomm), intent(in) :: self
    integer :: res

    res = self%nblock

  end function getnrblocks


  !> Returns the size of a block with the given index.
  !!
  !! \param self Instance.
  !! \param ib  Block index.
  !! \return  Size of the given block.
  !!
  function getblocksize(self, ib) result(res)
    class(linecomm), intent(in) :: self
    integer, intent(in) :: ib
    integer :: res

    if (ib < self%nblock) then
      res = self%blocksize
    else
      res = mod(self%nn, self%blocksize)
      if (res == 0) then
        res = self%blocksize
      end if
    end if

  end function getblocksize


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 230 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 261 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 266 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 298 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 322 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 327 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 363 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 394 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 399 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 430 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 455 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 460 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 462 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (lead, $1).
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece of the distributed matrix on exit.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    Its size should be greater than or equal to the BLACS block size
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    along that dimension. The actual number of elements for a given block
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    can be queried via the getblocksize() call.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_lead_int(self, mygrid, ii, ib, locmtx, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      & buffer)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: locmtx(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, target, intent(out) :: buffer(:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, pointer :: work(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work = locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, prow, pcol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_lead_int
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (follow, $1).
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_follow_int(self, mygrid, ii, ib, locmtx)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, target, intent(in) :: locmtx(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, pointer :: work(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, self%iorow, self%iocol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_follow_int
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns an entire row/column of a distributed matrix (lead, $1)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the collected line on exit. Its size should be
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     big enough to contain the result (greater or equal to the size of
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     the distributed matrix along that direction).
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_lead_int(self, mygrid, ii, locmtx, buffer)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: locmtx(:,:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(out) :: buffer(:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_lead(mygrid, ii, ib, locmtx, buffer(istart:iend))
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_lead_int
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the entire row/column of a distributed matrix (follow)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_follow_int(self, mygrid, ii, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: locmtx(:,:)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_follow(mygrid, ii, ib, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_follow_int
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (lead, $1).
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece to be distributed. It should contain
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the appropriate number of elements for the given block, as returned by
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the getblocksize() call. Its size can be bigger than that.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_lead_int(self, mygrid, ii, ib, buffer, locmtx)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, target, intent(in) :: buffer(:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(inout) :: locmtx(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, pointer :: work(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1) = work
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, prow, pcol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_lead_int
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (follow, $1).
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_follow_int(self, mygrid, ii, ib, locmtx)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    use iso_fortran_env
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(inout), target :: locmtx(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, pointer :: work(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, self%iorow, self%iocol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_follow_int
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets an entire row/column of a distributed matrix (lead, $1)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the line to distribute. It should contain all
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     elements along the line. Its size can be bigger.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_lead_int(self, mygrid, ii, buffer, locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: buffer(:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(inout) :: locmtx(:,:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_lead(mygrid, ii, ib, buffer(istart:iend), locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_lead_int
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the entire row/column of a distributed matrix (follow)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_follow_int(self, mygrid, ii, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(inout) :: locmtx(:,:)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_follow(mygrid, ii, ib, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_follow_int
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 462 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (lead, $1).
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece of the distributed matrix on exit.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    Its size should be greater than or equal to the BLACS block size
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    along that dimension. The actual number of elements for a given block
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    can be queried via the getblocksize() call.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_lead_real(self, mygrid, ii, ib, locmtx, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      & buffer)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(in) :: locmtx(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), target, intent(out) :: buffer(:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), pointer :: work(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work = locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, prow, pcol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_lead_real
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (follow, $1).
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_follow_real(self, mygrid, ii, ib, locmtx)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), target, intent(in) :: locmtx(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), pointer :: work(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, self%iorow, self%iocol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_follow_real
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns an entire row/column of a distributed matrix (lead, $1)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the collected line on exit. Its size should be
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     big enough to contain the result (greater or equal to the size of
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     the distributed matrix along that direction).
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_lead_real(self, mygrid, ii, locmtx, buffer)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(in) :: locmtx(:,:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(out) :: buffer(:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_lead(mygrid, ii, ib, locmtx, buffer(istart:iend))
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_lead_real
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the entire row/column of a distributed matrix (follow)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_follow_real(self, mygrid, ii, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(in) :: locmtx(:,:)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_follow(mygrid, ii, ib, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_follow_real
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (lead, $1).
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece to be distributed. It should contain
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the appropriate number of elements for the given block, as returned by
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the getblocksize() call. Its size can be bigger than that.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_lead_real(self, mygrid, ii, ib, buffer, locmtx)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), target, intent(in) :: buffer(:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(inout) :: locmtx(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), pointer :: work(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1) = work
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, prow, pcol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_lead_real
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (follow, $1).
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_follow_real(self, mygrid, ii, ib, locmtx)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    use iso_fortran_env
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(inout), target :: locmtx(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), pointer :: work(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, self%iorow, self%iocol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_follow_real
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets an entire row/column of a distributed matrix (lead, $1)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the line to distribute. It should contain all
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     elements along the line. Its size can be bigger.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_lead_real(self, mygrid, ii, buffer, locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(in) :: buffer(:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(inout) :: locmtx(:,:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_lead(mygrid, ii, ib, buffer(istart:iend), locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_lead_real
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the entire row/column of a distributed matrix (follow)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_follow_real(self, mygrid, ii, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(sp), intent(inout) :: locmtx(:,:)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_follow(mygrid, ii, ib, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_follow_real
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 462 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (lead, $1).
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece of the distributed matrix on exit.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    Its size should be greater than or equal to the BLACS block size
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    along that dimension. The actual number of elements for a given block
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    can be queried via the getblocksize() call.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_lead_dreal(self, mygrid, ii, ib, locmtx, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      & buffer)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(in) :: locmtx(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), target, intent(out) :: buffer(:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), pointer :: work(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work = locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, prow, pcol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_lead_dreal
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (follow, $1).
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_follow_dreal(self, mygrid, ii, ib, locmtx)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), target, intent(in) :: locmtx(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), pointer :: work(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, self%iorow, self%iocol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_follow_dreal
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns an entire row/column of a distributed matrix (lead, $1)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the collected line on exit. Its size should be
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     big enough to contain the result (greater or equal to the size of
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     the distributed matrix along that direction).
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_lead_dreal(self, mygrid, ii, locmtx, buffer)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(in) :: locmtx(:,:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(out) :: buffer(:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_lead(mygrid, ii, ib, locmtx, buffer(istart:iend))
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_lead_dreal
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the entire row/column of a distributed matrix (follow)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_follow_dreal(self, mygrid, ii, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(in) :: locmtx(:,:)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_follow(mygrid, ii, ib, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_follow_dreal
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (lead, $1).
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece to be distributed. It should contain
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the appropriate number of elements for the given block, as returned by
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the getblocksize() call. Its size can be bigger than that.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_lead_dreal(self, mygrid, ii, ib, buffer, locmtx)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), target, intent(in) :: buffer(:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(inout) :: locmtx(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), pointer :: work(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1) = work
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, prow, pcol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_lead_dreal
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (follow, $1).
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_follow_dreal(self, mygrid, ii, ib, locmtx)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    use iso_fortran_env
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(inout), target :: locmtx(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), pointer :: work(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, self%iorow, self%iocol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_follow_dreal
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets an entire row/column of a distributed matrix (lead, $1)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the line to distribute. It should contain all
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     elements along the line. Its size can be bigger.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_lead_dreal(self, mygrid, ii, buffer, locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(in) :: buffer(:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(inout) :: locmtx(:,:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_lead(mygrid, ii, ib, buffer(istart:iend), locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_lead_dreal
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the entire row/column of a distributed matrix (follow)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_follow_dreal(self, mygrid, ii, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    real(dp), intent(inout) :: locmtx(:,:)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_follow(mygrid, ii, ib, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_follow_dreal
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 462 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (lead, $1).
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece of the distributed matrix on exit.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    Its size should be greater than or equal to the BLACS block size
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    along that dimension. The actual number of elements for a given block
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    can be queried via the getblocksize() call.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_lead_complex(self, mygrid, ii, ib, locmtx, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      & buffer)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(in) :: locmtx(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), target, intent(out) :: buffer(:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), pointer :: work(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work = locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, prow, pcol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_lead_complex
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (follow, $1).
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_follow_complex(self, mygrid, ii, ib, locmtx)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), target, intent(in) :: locmtx(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), pointer :: work(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, self%iorow, self%iocol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_follow_complex
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns an entire row/column of a distributed matrix (lead, $1)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the collected line on exit. Its size should be
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     big enough to contain the result (greater or equal to the size of
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     the distributed matrix along that direction).
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_lead_complex(self, mygrid, ii, locmtx, buffer)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(in) :: locmtx(:,:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(out) :: buffer(:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_lead(mygrid, ii, ib, locmtx, buffer(istart:iend))
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_lead_complex
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the entire row/column of a distributed matrix (follow)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_follow_complex(self, mygrid, ii, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(in) :: locmtx(:,:)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_follow(mygrid, ii, ib, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_follow_complex
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (lead, $1).
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece to be distributed. It should contain
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the appropriate number of elements for the given block, as returned by
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the getblocksize() call. Its size can be bigger than that.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_lead_complex(self, mygrid, ii, ib, buffer, locmtx)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), target, intent(in) :: buffer(:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(inout) :: locmtx(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), pointer :: work(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1) = work
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, prow, pcol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_lead_complex
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (follow, $1).
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_follow_complex(self, mygrid, ii, ib, locmtx)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    use iso_fortran_env
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(inout), target :: locmtx(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), pointer :: work(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, self%iorow, self%iocol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_follow_complex
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets an entire row/column of a distributed matrix (lead, $1)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the line to distribute. It should contain all
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     elements along the line. Its size can be bigger.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_lead_complex(self, mygrid, ii, buffer, locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(in) :: buffer(:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(inout) :: locmtx(:,:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_lead(mygrid, ii, ib, buffer(istart:iend), locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_lead_complex
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the entire row/column of a distributed matrix (follow)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_follow_complex(self, mygrid, ii, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(sp), intent(inout) :: locmtx(:,:)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_follow(mygrid, ii, ib, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_follow_complex
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 462 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 463 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (lead, $1).
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece of the distributed matrix on exit.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    Its size should be greater than or equal to the BLACS block size
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    along that dimension. The actual number of elements for a given block
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    can be queried via the getblocksize() call.
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_lead_dcomplex(self, mygrid, ii, ib, locmtx, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      & buffer)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(in) :: locmtx(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), target, intent(out) :: buffer(:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), pointer :: work(:,:)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work = locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, prow, pcol)
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_lead_dcomplex
# 464 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the given block of the distributed matrix (follow, $1).
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getblock_follow_dcomplex(self, mygrid, ii, ib, locmtx)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), target, intent(in) :: locmtx(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), pointer :: work(:,:)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, self%iorow, self%iocol)
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getblock_follow_dcomplex
# 465 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns an entire row/column of a distributed matrix (lead, $1)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the collected line on exit. Its size should be
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     big enough to contain the result (greater or equal to the size of
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     the distributed matrix along that direction).
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_lead_dcomplex(self, mygrid, ii, locmtx, buffer)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(in) :: locmtx(:,:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(out) :: buffer(:)
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_lead(mygrid, ii, ib, locmtx, buffer(istart:iend))
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_lead_dcomplex
# 466 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Returns the entire row/column of a distributed matrix (follow)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to collect.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine getline_follow_dcomplex(self, mygrid, ii, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(in) :: locmtx(:,:)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%getblock_follow(mygrid, ii, ib, locmtx)
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine getline_follow_dcomplex
# 467 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (lead, $1).
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the given piece to be distributed. It should contain
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the appropriate number of elements for the given block, as returned by
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!    the getblocksize() call. Its size can be bigger than that.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_lead_dcomplex(self, mygrid, ii, ib, buffer, locmtx)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), target, intent(in) :: buffer(:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(inout) :: locmtx(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), pointer :: work(:,:)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    work(1:nrow,1:ncol) => buffer(1:nrow*ncol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      locmtx(lrow:lrow+nrow-1,lcol:lcol+ncol-1) = work
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    else
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gesd(mygrid, work, prow, pcol)
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_lead_dcomplex
# 468 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the given block of the distributed matrix (follow, $1).
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Row/Column index.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ib  Block index within given row/column.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setblock_follow_dcomplex(self, mygrid, ii, ib, locmtx)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    use iso_fortran_env
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii, ib
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(inout), target :: locmtx(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: prow, pcol, lrow, lcol, nrow, ncol
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), pointer :: work(:,:)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    call self%getpositions(mygrid, ii, ib, prow, pcol, lrow, lcol, nrow, &
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
        & ncol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      work => locmtx(lrow:lrow+nrow-1, lcol:lcol+ncol-1)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call blacsfx_gerv(mygrid, work, self%iorow, self%iocol)
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end if
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setblock_follow_dcomplex
# 469 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets an entire row/column of a distributed matrix (lead, $1)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param self  Instance.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param buffer  Contains the line to distribute. It should contain all
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!     elements along the line. Its size can be bigger.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_lead_dcomplex(self, mygrid, ii, buffer, locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(in) :: buffer(:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(inout) :: locmtx(:,:)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib, istart, iend
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    iend = 0
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      istart = iend + 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      iend = istart + self%getblocksize(ib) - 1
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_lead(mygrid, ii, ib, buffer(istart:iend), locmtx)
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_lead_dcomplex
# 470 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"


# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !> Sets the entire row/column of a distributed matrix (follow)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param mygrid  BLACS descriptor
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param ii  Number of the line (row or column) to set.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !! \param locmtx  Local part of the global matrix.
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  !!
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  subroutine setline_follow_dcomplex(self, mygrid, ii, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    class(linecomm), intent(in) :: self
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer, intent(in) :: ii
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    complex(dp), intent(inout) :: locmtx(:,:)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    integer :: ib
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    do ib = 1, self%nblock
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
      call self%setblock_follow(mygrid, ii, ib, locmtx)
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
    end do
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"
  end subroutine setline_follow_dcomplex
# 471 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 473 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

# 477 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/linecomm.fpp"

  !! Helper routine to get global positions for given block.
  !!
  !! \param self  Instance
  !! \param mygrid BLACS descriptor
  !! \param ii  Index of the line (row/column).
  !! \param ib  Index of the block within the line.
  !! \param prow  Row of the processor owning the block.
  !! \param pcol  Column of the processor ownig the block.
  !! \param lrow  Starting row in the local matrix for the block.
  !! \param lcol  Starting column in the local matrix for the block.
  !! \param nrow  Nr. of rows corresponding to the block.
  !! \param ncol  Nr. of columns corresponding to the block.
  !!
  subroutine getpositions(self, mygrid, ii, ib, prow, pcol, lrow, lcol, &
      & nrow, ncol)
    class(linecomm), intent(in) :: self
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: ii, ib
    integer, intent(out) :: prow, pcol, lrow, lcol, nrow, ncol

    integer :: grow, gcol

    if (self%rowcollect) then
      grow = ii
      gcol = (ib - 1) * self%desc(NB_) + 1
      nrow = 1
      ncol = self%getblocksize(ib)
    else
      grow = (ib - 1) * self%desc(MB_) + 1
      gcol = ii
      nrow = self%getblocksize(ib)
      ncol = 1
    end if
    call scalafx_infog2l(mygrid, self%desc, grow, gcol, lrow, lcol, prow, pcol)

  end subroutine getpositions


end module linecomm_module
