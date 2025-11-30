# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 8 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 49 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 104 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 108 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 165 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 169 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 211 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 276 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 281 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 325 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 380 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 384 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  
# 425 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
!> Some extension routines to the scalapack library making it more usable.
!!
!! \details Some of the types exported by this module are defined in other
!! modules. Therefore, see also the documentation of the following modules:
!!
!!   * \ref linecomm_module "linecomm_module"
!!
module scalapackfx_tools_module
  use scalapackfx_common_module
  use blacsfx_module
  use scalapackfx_module
  use linecomm_module
  implicit none
  private

  public :: scalafx_cpl2g, scalafx_cpg2l, scalafx_addl2g, scalafx_addg2l
  public :: scalafx_islocal
  public :: writearray_lead, writearray_follow
  public :: readarray_lead, readarray_follow
  public :: blocklist, size
  public :: linecomm

  interface scalafx_cpl2g
    module procedure cpl2g_real, cpl2g_dreal, cpl2g_complex, cpl2g_dcomplex
    module procedure cpl2g_int
  end interface scalafx_cpl2g

  interface scalafx_cpg2l
    module procedure cpg2l_real, cpg2l_dreal, cpg2l_complex, cpg2l_dcomplex
    module procedure cpg2l_int
  end interface scalafx_cpg2l

  interface scalafx_addl2g
    module procedure addl2g_real, addl2g_dreal, addl2g_complex, addl2g_dcomplex
    module procedure addl2g_int
  end interface scalafx_addl2g

  interface scalafx_addg2l
    module procedure addg2l_real, addg2l_dreal, addg2l_complex, addg2l_dcomplex
    module procedure addg2l_int
  end interface scalafx_addg2l

  interface writearray_lead
    module procedure writearray_lead_int
    module procedure writearray_lead_real, writearray_lead_dreal
    module procedure writearray_lead_complex, writearray_lead_dcomplex
  end interface writearray_lead

  interface writearray_follow
    module procedure writearray_follow_int
    module procedure writearray_follow_real, writearray_follow_dreal
    module procedure writearray_follow_complex, writearray_follow_dcomplex
  end interface writearray_follow

  interface readarray_lead
    module procedure readarray_lead_int
    module procedure readarray_lead_real, readarray_lead_dreal
    module procedure readarray_lead_complex, readarray_lead_dcomplex
  end interface readarray_lead

  interface readarray_follow
    module procedure readarray_follow_int
    module procedure readarray_follow_real, readarray_follow_dreal
    module procedure readarray_follow_complex, readarray_follow_dcomplex
  end interface readarray_follow
  

  !> List of the local blocks of a distributed matrix.
  !!
  !! \details This structure can be helpful when modifying a distributed
  !! matrix directly on the local nodes. For example, in order to multiply
  !! every column of a distributed matrix by a column dependent factor, 
  !! you could use the blocklist the following way:
  !!
  !!     type(blocklist) :: blocks
  !!     integer :: ii, jj, jglob, jloc, bsize
  !!     :
  !!     call blocks%init(mygrid, descaa, "c")
  !!     do ii = 1, size(blocks)
  !!       call blocks%getblock(ii, jglob, jloc, bsize)
  !!       do jj = 0, bsize  - 1
  !!         aa(:,jloc + jj) =  aa(:,jloc + jj) * ff(jglob + jj)
  !!       end do
  !!     end do
  !!
  type :: blocklist
    private
    integer :: nn, nb, nproc, myproc, srcproc, nblock
  contains
    !> Initializes the instance.
    procedure :: init => blocklist_init

    !> Returns the size of the blocklist.
    procedure :: getsize => blocklist_getsize

    !> Returns the indices (local and global) of a local block.
    procedure :: getblock => blocklist_getblock
  end type blocklist

  interface size
    module procedure blocklist_getsize
  end interface size

contains


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Blocklist
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Initializes a blocklist instance.
  !! \param self  Initialized instance on exit.
  !! \param mygrid  BLACS descriptor
  !! \param desc  Descriptor of the distributed matrix.
  !! \param rowcol  "C" for column, "R" for row blocks.
  subroutine blocklist_init(self, mygrid, desc, rowcol)
    class(blocklist), intent(inout) :: self
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_)
    character, intent(in) :: rowcol

    integer :: nblockall, nextrablock, mydist

    if (rowcol == "c" .or. rowcol == "C") then
      self%nn = desc(N_)
      self%nb = desc(NB_)
      self%nproc = mygrid%ncol
      self%myproc = mygrid%mycol
      self%srcproc = desc(CSRC_)
    else
      self%nn = desc(M_)
      self%nb = desc(MB_)
      self%nproc = mygrid%nrow
      self%myproc = mygrid%myrow
      self%srcproc = desc(RSRC_)
    end if
    nblockall = self%nn / self%nb
    self%nblock = nblockall / self%nproc
    nextrablock = mod(nblockall, self%nproc)
    mydist = mod(self%nproc + self%myproc - self%srcproc, self%nproc)
    if (mydist < nextrablock) then
      self%nblock = self%nblock + 1
    elseif (mydist == nextrablock .and. mod(self%nn, self%nb) > 0) then
      self%nblock = self%nblock +1
    end if

  end subroutine blocklist_init


  !> Returns the size of the blocklist.
  !! \param self  Instance.
  !! \returns Number of local blocks of the distributed matrix.
  function blocklist_getsize(self) result(res)
    class(blocklist), intent(in) :: self
    integer :: res

    res = self%nblock

  end function blocklist_getsize


  !> Returns the indices (local and global) of a local block.
  !! \param self  Blocklist instance.
  !! \param iblock  Number of local block.
  !! \param iglob  Index of the first element of the block in the global matrix.
  !! \param iloc  Index of the first element of the block in the local matirx.
  !! \param bsize  Size of the block (number of elements in the block).
  subroutine blocklist_getblock(self, iblock, iglob, iloc, bsize)
    class(blocklist), intent(in) :: self
    integer, intent(in) :: iblock
    integer, intent(out) :: iglob, iloc, bsize

    integer :: mydist

    if (iblock >= 1 .and. iblock <= self%nblock) then
      mydist = mod(self%nproc + self%myproc - self%srcproc, self%nproc)
      iglob = ((iblock - 1) * self%nproc + mydist) * self%nb + 1
      iloc = (iblock - 1) * self%nb + mod(iglob - 1, self%nb) + 1
      bsize = min(self%nb, self%nn - iglob + 1)
    else
      iglob = 0
      iloc = 0
      bsize = 0
    end if

  end subroutine blocklist_getblock


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Block copy/adding routines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content of a local matrix to a global one (real).
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpl2g_real(mygrid, loc, desc, ii, jj, glob)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: loc(:,:)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(inout) :: glob(:,:)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          glob(iloc, jloc) = loc(i2, j2)
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpl2g_real
# 618 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content of a local matrix to a global one (dreal).
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpl2g_dreal(mygrid, loc, desc, ii, jj, glob)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: loc(:,:)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(inout) :: glob(:,:)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          glob(iloc, jloc) = loc(i2, j2)
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpl2g_dreal
# 619 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content of a local matrix to a global one (complex).
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpl2g_complex(mygrid, loc, desc, ii, jj, glob)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: loc(:,:)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(inout) :: glob(:,:)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          glob(iloc, jloc) = loc(i2, j2)
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpl2g_complex
# 620 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content of a local matrix to a global one (dcomplex).
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpl2g_dcomplex(mygrid, loc, desc, ii, jj, glob)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: loc(:,:)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(inout) :: glob(:,:)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          glob(iloc, jloc) = loc(i2, j2)
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpl2g_dcomplex
# 621 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content of a local matrix to a global one (int).
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpl2g_int(mygrid, loc, desc, ii, jj, glob)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: loc(:,:)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(inout) :: glob(:,:)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          glob(iloc, jloc) = loc(i2, j2)
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpl2g_int
# 622 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpg2l_real(mygrid, desc, ii, jj, glob, loc)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: glob(:,:)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(out) :: loc(:,:)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) == mygrid%mycol) then
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        do i2 = 1, nr
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          if (prow(i2) == mygrid%myrow) then
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = glob(iloc(i2), jloc(j2))
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          else
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = 0.0_dp
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          end if
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end do
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        loc(:, j2) = 0.0_dp
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpg2l_real
# 624 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpg2l_dreal(mygrid, desc, ii, jj, glob, loc)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: glob(:,:)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(out) :: loc(:,:)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) == mygrid%mycol) then
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        do i2 = 1, nr
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          if (prow(i2) == mygrid%myrow) then
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = glob(iloc(i2), jloc(j2))
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          else
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = 0.0_dp
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          end if
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end do
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        loc(:, j2) = 0.0_dp
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpg2l_dreal
# 625 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpg2l_complex(mygrid, desc, ii, jj, glob, loc)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: glob(:,:)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(out) :: loc(:,:)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) == mygrid%mycol) then
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        do i2 = 1, nr
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          if (prow(i2) == mygrid%myrow) then
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = glob(iloc(i2), jloc(j2))
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          else
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = 0.0_dp
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          end if
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end do
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        loc(:, j2) = 0.0_dp
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpg2l_complex
# 626 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpg2l_dcomplex(mygrid, desc, ii, jj, glob, loc)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: glob(:,:)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(out) :: loc(:,:)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) == mygrid%mycol) then
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        do i2 = 1, nr
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          if (prow(i2) == mygrid%myrow) then
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = glob(iloc(i2), jloc(j2))
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          else
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = 0.0_dp
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          end if
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end do
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        loc(:, j2) = 0.0_dp
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpg2l_dcomplex
# 627 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine cpg2l_int(mygrid, desc, ii, jj, glob, loc)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: glob(:,:)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(out) :: loc(:,:)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) == mygrid%mycol) then
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        do i2 = 1, nr
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          if (prow(i2) == mygrid%myrow) then
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = glob(iloc(i2), jloc(j2))
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          else
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            loc(i2, j2) = 0.0_dp
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          end if
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end do
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        loc(:, j2) = 0.0_dp
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine cpg2l_int
# 628 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Adds the content of a local matrix to a global one (real).
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addl2g_real(mygrid, loc, desc, ii, jj, glob)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: loc(:,:)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(inout) :: glob(:,:)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) /= mygrid%mycol) then
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        cycle
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, nr
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow(i2) /= mygrid%myrow) then
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          cycle
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        glob(iloc(i2), jloc(j2)) = glob(iloc(i2), jloc(j2)) + loc(i2, j2)
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addl2g_real
# 630 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Adds the content of a local matrix to a global one (dreal).
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addl2g_dreal(mygrid, loc, desc, ii, jj, glob)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: loc(:,:)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(inout) :: glob(:,:)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) /= mygrid%mycol) then
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        cycle
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, nr
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow(i2) /= mygrid%myrow) then
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          cycle
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        glob(iloc(i2), jloc(j2)) = glob(iloc(i2), jloc(j2)) + loc(i2, j2)
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addl2g_dreal
# 631 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Adds the content of a local matrix to a global one (complex).
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addl2g_complex(mygrid, loc, desc, ii, jj, glob)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: loc(:,:)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(inout) :: glob(:,:)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) /= mygrid%mycol) then
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        cycle
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, nr
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow(i2) /= mygrid%myrow) then
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          cycle
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        glob(iloc(i2), jloc(j2)) = glob(iloc(i2), jloc(j2)) + loc(i2, j2)
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addl2g_complex
# 632 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Adds the content of a local matrix to a global one (dcomplex).
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addl2g_dcomplex(mygrid, loc, desc, ii, jj, glob)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: loc(:,:)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(inout) :: glob(:,:)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) /= mygrid%mycol) then
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        cycle
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, nr
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow(i2) /= mygrid%myrow) then
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          cycle
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        glob(iloc(i2), jloc(j2)) = glob(iloc(i2), jloc(j2)) + loc(i2, j2)
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addl2g_dcomplex
# 633 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Adds the content of a local matrix to a global one (int).
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addl2g_int(mygrid, loc, desc, ii, jj, glob)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: loc(:,:)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(inout) :: glob(:,:)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, nr, nc
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=1)) :: irows, iloc, prow
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, dimension(size(loc, dim=2)) :: icols, jloc, pcol
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nr = size(loc, dim=1)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    nc = size(loc, dim=2)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do i2 = 1, nr
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      irows(i2) = i2 + ii - 1
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      icols(j2) = j2 + jj - 1
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    call scalafx_infog2l(mygrid, desc, irows, icols, iloc, jloc,&
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        & prow, pcol, .false.)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, nc
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (pcol(j2) /= mygrid%mycol) then
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        cycle
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, nr
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow(i2) /= mygrid%myrow) then
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          cycle
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        glob(iloc(i2), jloc(j2)) = glob(iloc(i2), jloc(j2)) + loc(i2, j2)
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addl2g_int
# 634 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addg2l_real(mygrid, desc, ii, jj, glob, loc)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: glob(:,:)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(out) :: loc(:,:)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    loc(:,:) = 0.0_dp
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          loc(i2, j2) = loc(i2, j2) + glob(iloc, jloc)
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addg2l_real
# 636 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addg2l_dreal(mygrid, desc, ii, jj, glob, loc)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: glob(:,:)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(out) :: loc(:,:)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    loc(:,:) = 0.0_dp
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          loc(i2, j2) = loc(i2, j2) + glob(iloc, jloc)
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addg2l_dreal
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addg2l_complex(mygrid, desc, ii, jj, glob, loc)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: glob(:,:)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(out) :: loc(:,:)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    loc(:,:) = 0.0_dp
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          loc(i2, j2) = loc(i2, j2) + glob(iloc, jloc)
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addg2l_complex
# 638 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addg2l_dcomplex(mygrid, desc, ii, jj, glob, loc)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: glob(:,:)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(out) :: loc(:,:)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    loc(:,:) = 0.0_dp
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          loc(i2, j2) = loc(i2, j2) + glob(iloc, jloc)
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addg2l_dcomplex
# 639 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Copies the content from the global matrix into a local one.
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid BLACS descriptor
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the global matrix.
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param ii  Starting row in the global matrix.
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param jj  Starting column in the global matrix
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param glob  Local part of the global matrix.
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param loc  Local matrix.
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine addg2l_int(mygrid, desc, ii, jj, glob, loc)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: ii, jj
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: glob(:,:)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(out) :: loc(:,:)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: i2, j2, iloc, jloc, prow, pcol
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    loc(:,:) = 0.0_dp
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do j2 = 1, size(loc, dim=2)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      do i2 = 1, size(loc, dim=1)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        call scalafx_infog2l(mygrid, desc, i2 + ii - 1, j2 + jj - 1, &
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
            & iloc, jloc, prow, pcol)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        if (prow == mygrid%myrow .and. pcol == mygrid%mycol) then
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
          loc(i2, j2) = loc(i2, j2) + glob(iloc, jloc)
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        end if
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end do
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine addg2l_int
# 640 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"

  

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! writearray/readarray
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (lead, int).
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param elemformat  Formatting of one element (e.g. "(E23.15)"). If present
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     matrix will be written formatted, otherwise the matrix is written
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! The formatting string must contain the
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     delimiting parantheses.
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_lead_int(mygrid, fd, desc, mtxloc, rowwise, elemformat)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: mtxloc(:,:)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(*), intent(in), optional :: elemformat
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, allocatable :: buffer(:)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(:), allocatable :: lineformat
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii, ndigit, nn
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted = present(elemformat)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (formatted) then
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      ndigit = floor(log(real(linelen, dp)) / log(10.0_dp)) + 1
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nn = ndigit + len_trim(elemformat) + 2
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      allocate(character(nn) :: lineformat)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      write(lineformat, "(A,I0,A,A)") "(", linelen, trim(elemformat), ")"
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_lead(mygrid, ii, mtxloc, buffer)
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted) then
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd, lineformat) buffer
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd) buffer
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_lead_int
# 647 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (lead, real).
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param elemformat  Formatting of one element (e.g. "(E23.15)"). If present
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     matrix will be written formatted, otherwise the matrix is written
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! The formatting string must contain the
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     delimiting parantheses.
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_lead_real(mygrid, fd, desc, mtxloc, rowwise, elemformat)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: mtxloc(:,:)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(*), intent(in), optional :: elemformat
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), allocatable :: buffer(:)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(:), allocatable :: lineformat
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii, ndigit, nn
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted = present(elemformat)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (formatted) then
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      ndigit = floor(log(real(linelen, dp)) / log(10.0_dp)) + 1
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nn = ndigit + len_trim(elemformat) + 2
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      allocate(character(nn) :: lineformat)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      write(lineformat, "(A,I0,A,A)") "(", linelen, trim(elemformat), ")"
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_lead(mygrid, ii, mtxloc, buffer)
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted) then
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd, lineformat) buffer
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd) buffer
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_lead_real
# 648 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (lead, dreal).
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param elemformat  Formatting of one element (e.g. "(E23.15)"). If present
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     matrix will be written formatted, otherwise the matrix is written
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! The formatting string must contain the
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     delimiting parantheses.
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_lead_dreal(mygrid, fd, desc, mtxloc, rowwise, elemformat)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: mtxloc(:,:)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(*), intent(in), optional :: elemformat
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), allocatable :: buffer(:)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(:), allocatable :: lineformat
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii, ndigit, nn
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted = present(elemformat)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (formatted) then
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      ndigit = floor(log(real(linelen, dp)) / log(10.0_dp)) + 1
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nn = ndigit + len_trim(elemformat) + 2
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      allocate(character(nn) :: lineformat)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      write(lineformat, "(A,I0,A,A)") "(", linelen, trim(elemformat), ")"
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_lead(mygrid, ii, mtxloc, buffer)
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted) then
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd, lineformat) buffer
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd) buffer
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_lead_dreal
# 649 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (lead, complex).
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param elemformat  Formatting of one element (e.g. "(E23.15)"). If present
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     matrix will be written formatted, otherwise the matrix is written
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! The formatting string must contain the
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     delimiting parantheses.
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_lead_complex(mygrid, fd, desc, mtxloc, rowwise, elemformat)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: mtxloc(:,:)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(*), intent(in), optional :: elemformat
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), allocatable :: buffer(:)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(:), allocatable :: lineformat
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii, ndigit, nn
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted = present(elemformat)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (formatted) then
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      ndigit = floor(log(real(linelen, dp)) / log(10.0_dp)) + 1
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nn = ndigit + len_trim(elemformat) + 2
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      allocate(character(nn) :: lineformat)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      write(lineformat, "(A,I0,A,A)") "(", linelen, trim(elemformat), ")"
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_lead(mygrid, ii, mtxloc, buffer)
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted) then
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd, lineformat) buffer
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd) buffer
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_lead_complex
# 650 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (lead, dcomplex).
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param elemformat  Formatting of one element (e.g. "(E23.15)"). If present
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     matrix will be written formatted, otherwise the matrix is written
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! The formatting string must contain the
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     delimiting parantheses.
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_lead_dcomplex(mygrid, fd, desc, mtxloc, rowwise, elemformat)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: mtxloc(:,:)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(*), intent(in), optional :: elemformat
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), allocatable :: buffer(:)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    character(:), allocatable :: lineformat
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii, ndigit, nn
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted = present(elemformat)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (formatted) then
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      ndigit = floor(log(real(linelen, dp)) / log(10.0_dp)) + 1
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nn = ndigit + len_trim(elemformat) + 2
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      allocate(character(nn) :: lineformat)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      write(lineformat, "(A,I0,A,A)") "(", linelen, trim(elemformat), ")"
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_lead(mygrid, ii, mtxloc, buffer)
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted) then
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd, lineformat) buffer
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        write(fd) buffer
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_lead_dcomplex
# 651 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (follow, int).
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_follow_int(mygrid, desc, mtxloc, rowwise)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: mtxloc(:,:)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_follow(mygrid, ii, mtxloc)
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_follow_int
# 653 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (follow, real).
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_follow_real(mygrid, desc, mtxloc, rowwise)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(in) :: mtxloc(:,:)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_follow(mygrid, ii, mtxloc)
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_follow_real
# 654 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (follow, dreal).
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_follow_dreal(mygrid, desc, mtxloc, rowwise)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(in) :: mtxloc(:,:)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_follow(mygrid, ii, mtxloc)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_follow_dreal
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (follow, complex).
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_follow_complex(mygrid, desc, mtxloc, rowwise)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(in) :: mtxloc(:,:)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_follow(mygrid, ii, mtxloc)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_follow_complex
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Writes a distributed array to a file (follow, dcomplex).
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is dumped rowwise otherwise columnwise
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine writearray_follow_dcomplex(mygrid, desc, mtxloc, rowwise)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(in) :: mtxloc(:,:)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: distributor
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "r")
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%init(mygrid, desc, "c")
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call distributor%getline_follow(mygrid, ii, mtxloc)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine writearray_follow_dcomplex
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (lead, int).
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param formatted  If .true. matrix will be read formatted otherwise
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! (default: .false.)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_lead_int(mygrid, fd, desc, mtxloc, rowwise, formatted)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(inout) :: mtxloc(:,:)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise, formatted
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, allocatable :: buffer(:)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted0
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(formatted)) then
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = formatted
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = .false.
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted0) then
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd, *) buffer
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd) buffer
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_lead(mygrid, ii, buffer, mtxloc)
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_lead_int
# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (lead, real).
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param formatted  If .true. matrix will be read formatted otherwise
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! (default: .false.)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_lead_real(mygrid, fd, desc, mtxloc, rowwise, formatted)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(inout) :: mtxloc(:,:)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise, formatted
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), allocatable :: buffer(:)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted0
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(formatted)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = formatted
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = .false.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted0) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd, *) buffer
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd) buffer
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_lead(mygrid, ii, buffer, mtxloc)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_lead_real
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (lead, dreal).
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param formatted  If .true. matrix will be read formatted otherwise
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! (default: .false.)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_lead_dreal(mygrid, fd, desc, mtxloc, rowwise, formatted)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(inout) :: mtxloc(:,:)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise, formatted
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), allocatable :: buffer(:)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted0
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(formatted)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = formatted
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = .false.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted0) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd, *) buffer
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd) buffer
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_lead(mygrid, ii, buffer, mtxloc)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_lead_dreal
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (lead, complex).
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param formatted  If .true. matrix will be read formatted otherwise
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! (default: .false.)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_lead_complex(mygrid, fd, desc, mtxloc, rowwise, formatted)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(inout) :: mtxloc(:,:)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise, formatted
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), allocatable :: buffer(:)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted0
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(formatted)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = formatted
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = .false.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted0) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd, *) buffer
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd) buffer
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_lead(mygrid, ii, buffer, mtxloc)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_lead_complex
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (lead, dcomplex).
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param fd  File descriptor of an opened file.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param formatted  If .true. matrix will be read formatted otherwise
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     unformatted. The file descriptor must accordingly belong to a formatted
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     or an unformatted file! (default: .false.)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_lead_dcomplex(mygrid, fd, desc, mtxloc, rowwise, formatted)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: fd, desc(DLEN_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(inout) :: mtxloc(:,:)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise, formatted
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), allocatable :: buffer(:)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0, formatted0
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: nline, linelen, ii
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(formatted)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = formatted
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    formatted0 = .false.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(M_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      linelen = desc(N_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    allocate(buffer(linelen))
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      if (formatted0) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd, *) buffer
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
        read(fd) buffer
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_lead(mygrid, ii, buffer, mtxloc)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_lead_dcomplex
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"



# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (follow, int).
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_follow_int(mygrid, desc, mtxloc, rowwise)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(inout) :: mtxloc(:,:)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_follow(mygrid, ii, mtxloc)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_follow_int
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (follow, real).
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_follow_real(mygrid, desc, mtxloc, rowwise)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(sp), intent(inout) :: mtxloc(:,:)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_follow(mygrid, ii, mtxloc)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_follow_real
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (follow, dreal).
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_follow_dreal(mygrid, desc, mtxloc, rowwise)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    real(dp), intent(inout) :: mtxloc(:,:)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_follow(mygrid, ii, mtxloc)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_follow_dreal
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (follow, complex).
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_follow_complex(mygrid, desc, mtxloc, rowwise)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(sp), intent(inout) :: mtxloc(:,:)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_follow(mygrid, ii, mtxloc)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_follow_complex
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !> Reads a distributed array from a file (follow, dcomplex).
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mygrid  BLACS descriptor
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param desc  Descriptor of the distributed matrix
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param mtxloc  Local portion of the distributed matrix
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !! \param rowwise  If .true. matrix is assumed to be stored rowwise otherwise
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!     columnwise (default: .false.)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  !!
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  subroutine readarray_follow_dcomplex(mygrid, desc, mtxloc, rowwise)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer, intent(in) :: desc(DLEN_)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    complex(dp), intent(inout) :: mtxloc(:,:)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical, intent(in), optional :: rowwise
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    type(linecomm) :: collector
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    integer :: ii, nline
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    logical :: rowwise0
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  if (present(rowwise)) then
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = rowwise
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  else
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    rowwise0 = .false.
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end if
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    if (rowwise0) then
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "r")
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(N_)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    else
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%init(mygrid, desc, "c")
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      nline = desc(M_)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end if
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    do ii = 1, nline
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
      call collector%setline_follow(mygrid, ii, mtxloc)
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    end do
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
    
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"
  end subroutine readarray_follow_dcomplex
# 669 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx_tools.fpp"


  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Other routines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  !> Returns whether a given global position can be found in the local part
  !! of the distributed matrix.
  !!
  !! \param grid  Grid on which the matrix is distributed.
  !! \param desc  Matrix descriptor
  !! \param ii  Row of the global position
  !! \param jj  Column of the global position
  !! \param local  Whether the position is local
  !! \param iloc  Row of the position in the local matrix  (only meaningful,
  !!     if local is .true.)
  !! \param jloc  Columnt of the position in the local matrix  (only
  !!     meaningful, if local is .true.)
  !!
  subroutine scalafx_islocal(grid, desc, ii, jj, local, iloc, jloc)
    type(blacsgrid), intent(in) :: grid
    integer, intent(in) :: desc(DLEN_)
    integer, intent(in) :: ii, jj
    logical, intent(out) :: local
    integer, intent(out) :: iloc, jloc

    integer :: prow, pcol

    call scalafx_infog2l(grid, desc, ii, jj, iloc, jloc, prow, pcol)
    local = (prow == grid%myrow .and. pcol == grid%mycol)

  end subroutine scalafx_islocal

  
end module scalapackfx_tools_module
