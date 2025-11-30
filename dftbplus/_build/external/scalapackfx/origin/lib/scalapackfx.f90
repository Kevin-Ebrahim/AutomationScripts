# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp" 2

!> High level Fortran wrappers for the SCALAPACK library.
module scalapackfx_module
  use scalapackfx_common_module
  use blacsfx_module
  use scalapack_module
  implicit none
  private

  public :: DLEN_, DT_, CTXT_, M_, N_, MB_, NB_, RSRC_, CSRC_, LLD_
  public :: scalafx_ppotrf
  public :: scalafx_ppotri
  public :: scalafx_ptrtri
  public :: scalafx_pgetrf
  public :: scalafx_pgetri
  public :: scalafx_psygst
  public :: scalafx_phegst
  public :: scalafx_psyev
  public :: scalafx_psygv
  public :: scalafx_pheev
  public :: scalafx_phegv
  public :: scalafx_psyevd
  public :: scalafx_psygvd
  public :: scalafx_pheevd
  public :: scalafx_phegvd
  public :: scalafx_psyevr
  public :: scalafx_pheevr
  public :: scalafx_psygvr
  public :: scalafx_phegvr
  public :: scalafx_ptrsm
  public :: scalafx_pposv
  public :: scalafx_getdescriptor
  public :: scalafx_getlocalshape
  public :: scalafx_getremoteshape
  public :: scalafx_infog2l
  public :: scalafx_indxl2g
  public :: scalafx_localindices
  public :: scalafx_creatematrix
  public :: scalafx_pgesvd
  public :: scalafx_numroc
  public :: scalafx_indxg2p
  public :: scalafx_infog2p

  !> Cholesky factorization of a symmetric/Hermitian positive definite matrix.
  interface scalafx_ppotrf
    module procedure scalafx_ppotrf_real, scalafx_ppotrf_dreal
    module procedure scalafx_ppotrf_complex, scalafx_ppotrf_dcomplex
  end interface scalafx_ppotrf

  !> Inverse of a Cholesky decomposed symmetric/Hermitian matrix.
  interface scalafx_ppotri
    module procedure scalafx_ppotri_real, scalafx_ppotri_dreal
    module procedure scalafx_ppotri_complex, scalafx_ppotri_dcomplex
  end interface scalafx_ppotri

  !> Inverse of a triangular matrix
  interface scalafx_ptrtri
    module procedure scalafx_ptrtri_real, scalafx_ptrtri_dreal
    module procedure scalafx_ptrtri_complex, scalafx_ptrtri_dcomplex
  end interface scalafx_ptrtri

  !> LU decomposition of a general matrix with pivoting.
  interface scalafx_pgetrf
    module procedure scalafx_pgetrf_real, scalafx_pgetrf_dreal
    module procedure scalafx_pgetrf_complex, scalafx_pgetrf_dcomplex
  end interface scalafx_pgetrf

  !> Inverse of a LU decomposed general matrix.
  interface scalafx_pgetri
    module procedure scalafx_pgetri_real, scalafx_pgetri_dreal
    module procedure scalafx_pgetri_complex, scalafx_pgetri_dcomplex
  end interface scalafx_pgetri

  !> Reduces symmetric definite generalized eigenvalue problem to standard form.
  interface scalafx_psygst
    module procedure scalafx_psygst_real, scalafx_psygst_dreal
  end interface scalafx_psygst

  !> Reduces Hermitian definite generalized eigenvalue problem to standard form.
  interface scalafx_phegst
    module procedure scalafx_phegst_complex, scalafx_phegst_dcomplex
  end interface scalafx_phegst

  !> Solves symmetric eigenvalue problem by the QR algorithm.
  interface scalafx_psyev
    module procedure scalafx_psyev_real, scalafx_psyev_dreal
  end interface scalafx_psyev

  !> Solves Hermitian eigenvalue problem by the QR algorithm.
  interface scalafx_pheev
    module procedure scalafx_pheev_complex, scalafx_pheev_dcomplex
  end interface scalafx_pheev

  !> Solves generalized symmetric eigenvalue problem by the QR algorithm.
  interface scalafx_psygv
    module procedure scalafx_psygv_real, scalafx_psygv_dreal
  end interface scalafx_psygv

  !> Solves generalized Hermitian eigenvalue problem by the QR algorithm.
  interface scalafx_phegv
    module procedure scalafx_phegv_complex, scalafx_phegv_dcomplex
  end interface scalafx_phegv

  !> Solves symmetric eigenvalue problem by the divide and conquer algorithm.
  interface scalafx_psyevd
    module procedure scalafx_psyevd_real, scalafx_psyevd_dreal
  end interface scalafx_psyevd

  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
  interface scalafx_pheevd
    module procedure scalafx_pheevd_complex, scalafx_pheevd_dcomplex
  end interface scalafx_pheevd

  !> Solves generalized symmetric eigenvalue problem by the divide and conquer
  !! algorithm.
  interface scalafx_psygvd
    module procedure scalafx_psygvd_real, scalafx_psygvd_dreal
  end interface scalafx_psygvd

  !> Solves generalized Hermitian eigenvalue problem by the divide and conquer
  !! algorithm.
  interface scalafx_phegvd
    module procedure scalafx_phegvd_complex, scalafx_phegvd_dcomplex
  end interface scalafx_phegvd

  !> Solves symmetric eigenvalue problem by the divide and conquer algorithm.
  interface scalafx_psyevr
    module procedure scalafx_psyevr_real, scalafx_psyevr_dreal
  end interface scalafx_psyevr

  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
  interface scalafx_pheevr
    module procedure scalafx_pheevr_complex, scalafx_pheevr_dcomplex
  end interface scalafx_pheevr

  !> Solves generalized symmetric eigenvalue problem by the divide and conquer
  !! algorithm.
  interface scalafx_psygvr
    module procedure scalafx_psygvr_real, scalafx_psygvr_dreal
  end interface scalafx_psygvr

  !> Solves generalized Hermitian eigenvalue problem by the divide and conquer
  !! algorithm.
  interface scalafx_phegvr
    module procedure scalafx_phegvr_complex, scalafx_phegvr_dcomplex
  end interface scalafx_phegvr

  !> Singular value decomposition
  interface scalafx_pgesvd
    module procedure scalafx_r_pgesvd_real, scalafx_r_pgesvd_dreal
    module procedure scalafx_c_pgesvd_complex, scalafx_c_pgesvd_dcomplex
  end interface scalafx_pgesvd

  !> Solves triangular matrix equation.
  interface scalafx_ptrsm
    module procedure scalafx_ptrsm_real, scalafx_ptrsm_dreal
    module procedure scalafx_ptrsm_complex, scalafx_ptrsm_dcomplex
  end interface scalafx_ptrsm

  !> Solves symmetric/hermitian matrix equation.
  interface scalafx_pposv
    module procedure scalafx_pposv_real, scalafx_pposv_dreal
    module procedure scalafx_pposv_complex, scalafx_pposv_dcomplex
  end interface scalafx_pposv

  !> Creates a distributed matrix and allocates local storage.
  interface scalafx_creatematrix
    module procedure scalafx_creatematrix_int
    module procedure scalafx_creatematrix_real, scalafx_creatematrix_dreal
    module procedure scalafx_creatematrix_complex, scalafx_creatematrix_dcomplex
  end interface scalafx_creatematrix

  !> Maps global position in a distributed matrix to local one.
  interface scalafx_infog2l
    module procedure scalafx_infog2l_single, scalafx_infog2l_array
  end interface scalafx_infog2l

!************************************************************************
!*** ppotrf
!************************************************************************

# 217 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** ppotri
!************************************************************************

# 266 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** ptrtri
!************************************************************************

# 319 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** pgetrf
!************************************************************************

# 369 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** pgetri
!************************************************************************

# 438 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** psygst / phegst
!************************************************************************

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

!************************************************************************
!*** psyev
!************************************************************************

# 570 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** pheev
!************************************************************************

# 659 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 780 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 786 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 917 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 922 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1042 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1048 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1149 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1221 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 1226 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1302 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1308 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1393 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 1398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1486 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 1491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1585 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1591 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1689 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1768 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 1853 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"



# 1859 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 1913 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


!************************************************************************
!*** pposv
!************************************************************************

# 1961 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 1966 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2002 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

contains

# 2006 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2007 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2008 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the Cholesky factorization of a Hermitian positive definite matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of the matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?potrf).
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotrf_real(aa, desca, uplo, nn, ia, ja, info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, info0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotrf(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotrf in scalafx_ppotrf_real", info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotrf_real
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotri_real(aa, desca, uplo, ia, ja, nn, info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotri(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotri in scalafx_ppotri_real", info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotri_real
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrtri_real(aa, desca, uplo, diag, ia, ja, nn, info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether A is unit triangular ("U") or not ("N"). Default: "N".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_).
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, diag0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrtri(uplo0, diag0, nn0, aa, ia0, ja0, desca, info0)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ptrtri in scalafx_ptrtri_real", info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrtri_real
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> LU factorization of a general matrix with pivoting
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetrf_real(aa, desca, ipiv, ia, ja, mm, nn, info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> LU decomposition on exit, pivoted by ipiv
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, mm0, nn0, info0
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetrf(mm0, nn0, aa, ia0, ja0, desca, ipiv, info0)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetrf in scalafx_pgetrf_real", info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetrf_real
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Inversion of a LU-factorized general matrix with pivoting
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetri_real(aa, desca, ipiv, ia, ja, nn, work, iwork, info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Inverse exit, pivoted by ipiv
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Integer work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: work0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwork, liwork, info0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, rtmp, -1, itmp, -1, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_real", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= itmp(1)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(itmp(1)))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, work0, lwork, iwork0, liwork, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_real", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy argument present
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetri_real
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Reduces Hermitian-definite generalized eigenvalue problem to standard form.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ibtype  Type of the problem (1, 2, 3).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side of the eigenvalue equation (B).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desb  Descriptor of matrix B.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param scale  Scaling factors on return.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the submatrices A and B
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: desca(M_)).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?sygst/p?hegst).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygst_real(ibtype, aa, desca, bb, descb, scale, uplo, &
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & nn, ia, ja, ib, jb, info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: ibtype
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in) :: bb(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: scale
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, ib0, jb0, info0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psygst(ibtype, uplo0, nn0, aa, ia0, ja0, desca, bb,&
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib0, jb0, descb, scale, info0)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "$4 in scalafx_$4_real", info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygst_real
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves symmetric eigenvalue problem by the MRRR algorithm.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and colums of the submatrix A (default: desca(M_))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syevr).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyevr_real(aa, desca, ww, zz, descz, vl, vu, il, iu, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobz, uplo, nn, ia, ja, iz, jz, work, iwork, mm, nz, info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in), optional :: vl, vu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: il, iu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, iz, jz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: mm, nz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: liwork, lwork, lwmin, liwmin, info0, nn0, ia0, ja0, iz0, jz0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nz0, il0, iu0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: vl0, vu0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0, range
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: work0(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (present(il) .or. present(iu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(il)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    il0 = il
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    il0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = nn0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range = "I"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    elseif (present(vl) .or. present(vu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (range == "I") then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        call error("Eigenvalue subset must be specified by index or by&
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
            & energy range, but not by both.")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (.not. (present(vl) .and. present(vu))) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        call error("When eigenvalue subset is defined by energy range, both, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
            & upper and lower limit must be present.")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      vl0 = vl
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      vu0 = vu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range ="V"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range = "A"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (range /= "V" .and. present(nz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call error("Optional argument nz only valid if subset is selected by &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          &energy range")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevr(jobz0, range, uplo0, nn0, aa, ia0, ja0, desca, vl0, vu0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & il0, iu0, mm0, nz0, ww, zz, iz0, jz0, descz, rtmp, -1, itmp, -1, info0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevr (workspace query) in scalafx_psyevr_real", &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of psyevr() and take that.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(rtmp(1))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    liwmin = itmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_sp
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevr(jobz0, range, uplo0, nn0, aa, ia0, ja0, desca, vl0, vu0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & il0, iu0, mm0, nz0, ww, zz, iz0, jz0, descz, work0, lwork, iwork0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & liwork, info0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevr (diagonalization) in scalafx_psyevr_real", &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm = mm0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (range == "V") then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nz = nz0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyevr_real
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real generalized eigenvalue problem by the divide and conquer
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! algorithm.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syevd, p?trsm in
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values. See the scalafx_psyevd_real() routine for details.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?sygst, p?syevd, p?trsm).
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygvd_real(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, iwork, allocfix, skipchol, info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix, skipchol
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyevd(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, iwork=iwork, allocfix=allocfix, &
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygvd_real
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves symmetric eigenvalue problem by the divide and conquer algorithm.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Unfortunately, SCALAPACK seems to return the wrong real work space
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     sizes for many cases. This routine (when allocfix had been set to true)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     tries to improve on it by two ways:
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It queries also the QR routine (p?syev) for workspace size and takes
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       this, if bigger than returned by p?syevd. That should ensure
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       that the pdormtr() routine does not encounter any difficulties.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It additionally enlarges the real workspace size by the amount of
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       memory needed by the pdlasrt() routine, to make sure this would not
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       fail either.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Those fixes are empirical, may lead to oversized workspace allocations
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     and probably would not even fix the allocation problem, but are the best
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     we could find so far.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syevd).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyevd_real(aa, desca, ww, zz, descz, jobz, uplo, ia,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ja, iz, jz, work, iwork, allocfix, info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lwmin, liwmin, info0, ia0, ja0, iz0, jz0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1), rtmp2(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: work0(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: allocfix0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(allocfix)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = allocfix
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = .false.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp, -1, itmp, 1, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psevd in scalafx_psyevd", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of psyev() and take that one if bigger in the hope
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! pdormtr() would work. Additionally extend workspace in the hope pdlasrt()
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! work as well.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (allocfix0) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz, &
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp2, -1, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call handle_infoflag(info0, "psev in scalafx_psyevd", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = max(int(rtmp(1)), int(rtmp2(1)))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = lwmin + MAX(nn, size(aa, dim=1) * (desca(NB_) + size(aa, dim=2)))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = int(rtmp(1))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_sp
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, iwork0, liwork, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevd in scalafx_psyevd_real", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyevd_real
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

  !> Solves symmetric generalized eigenvalue problem by the QR algorithm.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syev, p?trsm in
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heev, p?trsm).
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygv_real(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, skipchol, info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyev(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygv_real
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real generalized eigenvalue problem by the MRRR algorithm.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syevr, p?trsm in
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back. Currently all eigenvalues calculated.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the matrix A (default: desca(M_))
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?sygst, p?syevr, p?trsm).
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygvr_real(aa, desca, bb, descb, ww, zz, descz, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & vl, vu, il, iu, jobz, uplo, nn, ia, ja, ib, jb, iz, jz, work, iwork, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & skipchol, mm, nz, info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in), optional :: vl, vu
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: il, iu
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb, iz, jz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: mm, nz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, ncol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, nn=nn, ia=ib, ja=jb, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, nn=nn, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ia=ia, ja=ja, ib=ib, jb=jb, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyevr(aa, desca, ww, zz, descz, vl=vl, vu=vu, il=il, iu=iu, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & jobz=jobz0, uplo=uplo0, nn=nn, ia=ia, ja=ja, iz=iz, jz=jz, work=work, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & iwork=iwork, mm=mm0, nz=nz, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (present(nz)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        ncol = nz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        ncol = mm0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", mm=nn, nn=ncol, ia=ib, ja=jb, ib=iz, jb=jz)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm = mm0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygvr_real
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real eigenvalue problem.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syev).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyev_real(aa, desca, ww, zz, descz, jobz, uplo, ia, ja,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & iz, jz, work, info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: zz(:,:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, lwork, info0, ia0, ja0, iz0, jz0
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: work0(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate real workspace
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp, -1, info0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psev in scalafx_psyev", info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_sp
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, info0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyev in scalafx_psyev_real", info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyev_real
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Singular value decomposition
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to decompose (A).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uu  Left singular vectors (U).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descu  Descriptor of the left singular vectors.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param sigma  Singular values on exit.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param vt  Right singular vectors, transposed (Vt).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descvt  Descriptor of the right singular vectors.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for U matrix (default: "V")
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for vt matrix (default: "V")
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iu  First row of the submatrix U (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ju  First column of the submatrix U (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ivt  First row of the submatrix vt (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jvt  First column of the submatrix vt (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of columns of the matrix A (default: desca(M_))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows of the matrix A (default: desca(N_))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (real routines p[sd]gesvd).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_r_pgesvd_real(aa, desca, uu, descu, sigma, vt, descvt,&
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobu, jobvt, ia, ja, iu, ju, ivt, jvt, mm, nn, work, info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: uu(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descu(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: sigma(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: vt(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descvt(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobu, jobvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iu, ju, ivt, jvt, mm, nn
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: work(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nn0, lwork, lwmin, info0, ia0, ja0, iu0, ju0, ivt0, jvt0
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobu0, jobvt0
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: work0(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobu)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = jobu
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = "V"
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobvt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = jobvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = "V"
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ju)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = ju
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ivt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = ivt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jvt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = jvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0, ju0, descu, &
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & vt, ivt0, jvt0, descvt, rtmp, -1, info0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_real", info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(rtmp(1))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_sp
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! SVD
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0, ju0, descu, &
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & vt, ivt0, jvt0, descvt, work0, lwork, info0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_real", info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end subroutine scalafx_r_pgesvd_real
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves A X = B problem for a positive definite symmetric/hermitian A.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left side matrix
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?osvd).
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pposv_real(aa, desca, bb, descb, uplo, nn, nrhs, ia, ja, ib, jb, info)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, nrhs, ia, ja, ib, jb
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, nrhs0, ia0, ja0, ib0, jb0, info0
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = min(desca(M_), desca(N_))
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nrhs)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = nrhs
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = descb(N_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (descb(M_) > nn0) call error("B matrix rows too large for A matrix solution")
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pposv(uplo0, nn0, nrhs0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, info0)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pposv in scalafx_pposv_real", info)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pposv_real
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves triangular matrix equation.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left hand side of equation (A)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side (B).
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param side  Side of A (default: "L")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param transa  Transposition flag (default "N")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param diag  Specifieds whether matrix A is unit triangular (default: "N")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param alpha  Prefactor of B (default: 1.0)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of the submatrix B (default: descb(M_))
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of the submatrix B (default: descb(N_))
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?trsm).
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrsm_real(aa, desca, bb, descb, side, uplo, transa, diag,&
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & alpha, mm, nn, ia, ja, ib, jb)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: side, uplo, transa, diag
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in), optional :: alpha
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: alpha0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(side)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = side
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = "L"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(transa)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = transa
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = "N"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(alpha)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = alpha
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = real(1.0, sp)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = descb(M_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = descb(N_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrsm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrsm_real
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2037 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Creates a distributed matrix and allocates local storage.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mb  Row block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nb  Column block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desc  Matrix descriptor on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mtxloc  Allocated local matrix on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rsrc  Process row, over which first row is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead row).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param csrc  Process column, over which first column is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead column).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_creatematrix_real(mygrid, mm, nn, mb, nb, mtxloc,&
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: mm, nn, mb, nb
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable, intent(out) :: mtxloc(:,:)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: desc(DLEN_)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nrowloc, ncolloc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(mtxloc(nrowloc, ncolloc))
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_creatematrix_real
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2006 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2007 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2008 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the Cholesky factorization of a Hermitian positive definite matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of the matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?potrf).
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotrf_dreal(aa, desca, uplo, nn, ia, ja, info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, info0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotrf(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotrf in scalafx_ppotrf_dreal", info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotrf_dreal
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotri_dreal(aa, desca, uplo, ia, ja, nn, info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotri(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotri in scalafx_ppotri_dreal", info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotri_dreal
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrtri_dreal(aa, desca, uplo, diag, ia, ja, nn, info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether A is unit triangular ("U") or not ("N"). Default: "N".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_).
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, diag0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrtri(uplo0, diag0, nn0, aa, ia0, ja0, desca, info0)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ptrtri in scalafx_ptrtri_dreal", info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrtri_dreal
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> LU factorization of a general matrix with pivoting
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetrf_dreal(aa, desca, ipiv, ia, ja, mm, nn, info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> LU decomposition on exit, pivoted by ipiv
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, mm0, nn0, info0
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetrf(mm0, nn0, aa, ia0, ja0, desca, ipiv, info0)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetrf in scalafx_pgetrf_dreal", info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetrf_dreal
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Inversion of a LU-factorized general matrix with pivoting
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetri_dreal(aa, desca, ipiv, ia, ja, nn, work, iwork, info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Inverse exit, pivoted by ipiv
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Integer work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: work0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwork, liwork, info0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, rtmp, -1, itmp, -1, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_dreal", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= itmp(1)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(itmp(1)))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, work0, lwork, iwork0, liwork, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_dreal", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy argument present
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetri_dreal
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Reduces Hermitian-definite generalized eigenvalue problem to standard form.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ibtype  Type of the problem (1, 2, 3).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side of the eigenvalue equation (B).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desb  Descriptor of matrix B.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param scale  Scaling factors on return.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the submatrices A and B
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: desca(M_)).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?sygst/p?hegst).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygst_dreal(ibtype, aa, desca, bb, descb, scale, uplo, &
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & nn, ia, ja, ib, jb, info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: ibtype
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in) :: bb(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: scale
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, ib0, jb0, info0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psygst(ibtype, uplo0, nn0, aa, ia0, ja0, desca, bb,&
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib0, jb0, descb, scale, info0)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "$4 in scalafx_$4_dreal", info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygst_dreal
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves symmetric eigenvalue problem by the MRRR algorithm.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and colums of the submatrix A (default: desca(M_))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syevr).
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyevr_dreal(aa, desca, ww, zz, descz, vl, vu, il, iu, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobz, uplo, nn, ia, ja, iz, jz, work, iwork, mm, nz, info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in), optional :: vl, vu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: il, iu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, iz, jz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: mm, nz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: liwork, lwork, lwmin, liwmin, info0, nn0, ia0, ja0, iz0, jz0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nz0, il0, iu0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: vl0, vu0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0, range
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: work0(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (present(il) .or. present(iu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(il)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    il0 = il
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    il0 = 1
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = nn0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range = "I"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    elseif (present(vl) .or. present(vu)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (range == "I") then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        call error("Eigenvalue subset must be specified by index or by&
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
            & energy range, but not by both.")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (.not. (present(vl) .and. present(vu))) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        call error("When eigenvalue subset is defined by energy range, both, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
            & upper and lower limit must be present.")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      vl0 = vl
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      vu0 = vu
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range ="V"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      range = "A"
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (range /= "V" .and. present(nz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call error("Optional argument nz only valid if subset is selected by &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          &energy range")
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevr(jobz0, range, uplo0, nn0, aa, ia0, ja0, desca, vl0, vu0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & il0, iu0, mm0, nz0, ww, zz, iz0, jz0, descz, rtmp, -1, itmp, -1, info0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevr (workspace query) in scalafx_psyevr_dreal", &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of psyevr() and take that.
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(rtmp(1))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    liwmin = itmp(1)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_dp
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevr(jobz0, range, uplo0, nn0, aa, ia0, ja0, desca, vl0, vu0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & il0, iu0, mm0, nz0, ww, zz, iz0, jz0, descz, work0, lwork, iwork0, &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & liwork, info0)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevr (diagonalization) in scalafx_psyevr_dreal", &
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm = mm0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (range == "V") then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nz)) then
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nz = nz0
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyevr_dreal
# 2017 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real generalized eigenvalue problem by the divide and conquer
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! algorithm.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syevd, p?trsm in
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values. See the scalafx_psyevd_dreal() routine for details.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?sygst, p?syevd, p?trsm).
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygvd_dreal(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, iwork, allocfix, skipchol, info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix, skipchol
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyevd(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, iwork=iwork, allocfix=allocfix, &
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & info=info)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygvd_dreal
# 2018 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves symmetric eigenvalue problem by the divide and conquer algorithm.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Unfortunately, SCALAPACK seems to return the wrong real work space
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     sizes for many cases. This routine (when allocfix had been set to true)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     tries to improve on it by two ways:
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It queries also the QR routine (p?syev) for workspace size and takes
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       this, if bigger than returned by p?syevd. That should ensure
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       that the pdormtr() routine does not encounter any difficulties.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It additionally enlarges the real workspace size by the amount of
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       memory needed by the pdlasrt() routine, to make sure this would not
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       fail either.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Those fixes are empirical, may lead to oversized workspace allocations
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     and probably would not even fix the allocation problem, but are the best
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     we could find so far.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syevd).
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyevd_dreal(aa, desca, ww, zz, descz, jobz, uplo, ia,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ja, iz, jz, work, iwork, allocfix, info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lwmin, liwmin, info0, ia0, ja0, iz0, jz0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1), rtmp2(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: work0(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: allocfix0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(allocfix)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = allocfix
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = .false.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp, -1, itmp, 1, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psevd in scalafx_psyevd", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of psyev() and take that one if bigger in the hope
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! pdormtr() would work. Additionally extend workspace in the hope pdlasrt()
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! work as well.
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (allocfix0) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz, &
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp2, -1, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call handle_infoflag(info0, "psev in scalafx_psyevd", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = max(int(rtmp(1)), int(rtmp2(1)))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = lwmin + MAX(nn, size(aa, dim=1) * (desca(NB_) + size(aa, dim=2)))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = int(rtmp(1))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_dp
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, iwork0, liwork, info0)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyevd in scalafx_psyevd_dreal", info)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyevd_dreal
# 2019 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

  !> Solves symmetric generalized eigenvalue problem by the QR algorithm.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syev, p?trsm in
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heev, p?trsm).
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygv_dreal(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, skipchol, info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyev(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, info=info)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygv_dreal
# 2020 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real generalized eigenvalue problem by the MRRR algorithm.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?sygst, p?syevr, p?trsm in
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back. Currently all eigenvalues calculated.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the matrix A (default: desca(M_))
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?sygst, p?syevr, p?trsm).
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psygvr_dreal(aa, desca, bb, descb, ww, zz, descz, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & vl, vu, il, iu, jobz, uplo, nn, ia, ja, ib, jb, iz, jz, work, iwork, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & skipchol, mm, nz, info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in), optional :: vl, vu
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: il, iu
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb, iz, jz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: mm, nz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, ncol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, nn=nn, ia=ib, ja=jb, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psygst(1, aa, desca, bb, descb, scale, uplo=uplo0, nn=nn, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ia=ia, ja=ja, ib=ib, jb=jb, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_psyevr(aa, desca, ww, zz, descz, vl=vl, vu=vu, il=il, iu=iu, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & jobz=jobz0, uplo=uplo0, nn=nn, ia=ia, ja=ja, iz=iz, jz=jz, work=work, &
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & iwork=iwork, mm=mm0, nz=nz, info=info)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "T"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (present(nz)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        ncol = nz
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        ncol = mm0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", mm=nn, nn=ncol, ia=ib, ja=jb, ib=iz, jb=jz)
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm = mm0
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psygvr_dreal
# 2021 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves real eigenvalue problem.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?syev).
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_psyev_dreal(aa, desca, ww, zz, descz, jobz, uplo, ia, ja,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & iz, jz, work, info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: zz(:,:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, lwork, info0, ia0, ja0, iz0, jz0
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: work0(:)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate real workspace
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rtmp, -1, info0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psev in scalafx_psyev", info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_dp
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call psyev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, info0)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "psyev in scalafx_psyev_dreal", info)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_psyev_dreal
# 2022 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Singular value decomposition
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to decompose (A).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uu  Left singular vectors (U).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descu  Descriptor of the left singular vectors.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param sigma  Singular values on exit.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param vt  Right singular vectors, transposed (Vt).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descvt  Descriptor of the right singular vectors.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for U matrix (default: "V")
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for vt matrix (default: "V")
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iu  First row of the submatrix U (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ju  First column of the submatrix U (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ivt  First row of the submatrix vt (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jvt  First column of the submatrix vt (default: 1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of columns of the matrix A (default: desca(M_))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows of the matrix A (default: desca(N_))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (real routines p[sd]gesvd).
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_r_pgesvd_dreal(aa, desca, uu, descu, sigma, vt, descvt,&
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobu, jobvt, ia, ja, iu, ju, ivt, jvt, mm, nn, work, info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: uu(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descu(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: sigma(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: vt(:,:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descvt(DLEN_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobu, jobvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iu, ju, ivt, jvt, mm, nn
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: work(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nn0, lwork, lwmin, info0, ia0, ja0, iu0, ju0, ivt0, jvt0
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobu0, jobvt0
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: work0(:)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobu)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = jobu
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = "V"
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobvt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = jobvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = "V"
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ju)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = ju
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ivt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = ivt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jvt)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = jvt
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = 1
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0, ju0, descu, &
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & vt, ivt0, jvt0, descvt, rtmp, -1, info0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_dreal", info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(rtmp(1))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = 0.0_dp
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! SVD
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0, ju0, descu, &
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & vt, ivt0, jvt0, descvt, work0, lwork, info0)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_dreal", info)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end subroutine scalafx_r_pgesvd_dreal
# 2023 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves A X = B problem for a positive definite symmetric/hermitian A.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left side matrix
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?osvd).
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pposv_dreal(aa, desca, bb, descb, uplo, nn, nrhs, ia, ja, ib, jb, info)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, nrhs, ia, ja, ib, jb
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, nrhs0, ia0, ja0, ib0, jb0, info0
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = min(desca(M_), desca(N_))
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nrhs)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = nrhs
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = descb(N_)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (descb(M_) > nn0) call error("B matrix rows too large for A matrix solution")
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pposv(uplo0, nn0, nrhs0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, info0)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pposv in scalafx_pposv_dreal", info)
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pposv_dreal
# 2024 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves triangular matrix equation.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left hand side of equation (A)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side (B).
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param side  Side of A (default: "L")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param transa  Transposition flag (default "N")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param diag  Specifieds whether matrix A is unit triangular (default: "N")
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param alpha  Prefactor of B (default: 1.0)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of the submatrix B (default: descb(M_))
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of the submatrix B (default: descb(N_))
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?trsm).
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrsm_dreal(aa, desca, bb, descb, side, uplo, transa, diag,&
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & alpha, mm, nn, ia, ja, ib, jb)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: side, uplo, transa, diag
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in), optional :: alpha
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: alpha0
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(side)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = side
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = "L"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(transa)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = transa
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = "N"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(alpha)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = alpha
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = real(1.0, dp)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = descb(M_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = descb(N_)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrsm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrsm_dreal
# 2025 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2037 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Creates a distributed matrix and allocates local storage.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mb  Row block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nb  Column block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desc  Matrix descriptor on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mtxloc  Allocated local matrix on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rsrc  Process row, over which first row is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead row).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param csrc  Process column, over which first column is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead column).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_creatematrix_dreal(mygrid, mm, nn, mb, nb, mtxloc,&
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: mm, nn, mb, nb
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable, intent(out) :: mtxloc(:,:)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: desc(DLEN_)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nrowloc, ncolloc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(mtxloc(nrowloc, ncolloc))
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_creatematrix_dreal
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2006 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2007 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2008 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the Cholesky factorization of a Hermitian positive definite matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of the matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?potrf).
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotrf_complex(aa, desca, uplo, nn, ia, ja, info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, info0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotrf(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotrf in scalafx_ppotrf_complex", info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotrf_complex
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotri_complex(aa, desca, uplo, ia, ja, nn, info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotri(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotri in scalafx_ppotri_complex", info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotri_complex
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrtri_complex(aa, desca, uplo, diag, ia, ja, nn, info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether A is unit triangular ("U") or not ("N"). Default: "N".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_).
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, diag0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrtri(uplo0, diag0, nn0, aa, ia0, ja0, desca, info0)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ptrtri in scalafx_ptrtri_complex", info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrtri_complex
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> LU factorization of a general matrix with pivoting
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetrf_complex(aa, desca, ipiv, ia, ja, mm, nn, info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> LU decomposition on exit, pivoted by ipiv
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, mm0, nn0, info0
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetrf(mm0, nn0, aa, ia0, ja0, desca, ipiv, info0)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetrf in scalafx_pgetrf_complex", info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetrf_complex
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Inversion of a LU-factorized general matrix with pivoting
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetri_complex(aa, desca, ipiv, ia, ja, nn, work, iwork, info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Inverse exit, pivoted by ipiv
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Integer work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable :: work0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwork, liwork, info0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: rtmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, rtmp, -1, itmp, -1, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_complex", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= itmp(1)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(itmp(1)))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, work0, lwork, iwork0, liwork, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_complex", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy argument present
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetri_complex
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Reduces Hermitian-definite generalized eigenvalue problem to standard form.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ibtype  Type of the problem (1, 2, 3).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side of the eigenvalue equation (B).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desb  Descriptor of matrix B.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param scale  Scaling factors on return.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the submatrices A and B
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: desca(M_)).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?sygst/p?hegst).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegst_complex(ibtype, aa, desca, bb, descb, scale, uplo, &
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & nn, ia, ja, ib, jb, info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: ibtype
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(in) :: bb(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: scale
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, ib0, jb0, info0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call phegst(ibtype, uplo0, nn0, aa, ia0, ja0, desca, bb,&
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib0, jb0, descb, scale, info0)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "$4 in scalafx_$4_complex", info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegst_complex
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heevr).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheevr_complex(aa, desca, ww, zz, descz, range, vl, vu,&
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & il, iu, m, nz, jobz, uplo, ia, ja, iz, jz, work, rwork, iwork, info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in) :: range
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(in) :: vl, vu
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: il, iu
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: m, nz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lrwork, info0, ia0, ja0, iz0, jz0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwmin, lrwmin, liwmin
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: ctmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable :: work0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: rwork0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevr(jobz0, range, uplo0, nn, aa, ia0, ja0, desca, vl, vu, il, iu, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & m, nz, ww, zz, iz0, jz0, descz, ctmp, -1, rtmp, -1, itmp, -1, info0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevr in scalafx_pheevr", info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(ctmp(1))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lrwmin = int(rtmp(1))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    liwmin = itmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=sp)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_sp
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevr(jobz0, range, uplo0, nn, aa, ia0, ja0, desca, vl, vu, il, iu, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & m, nz, ww, zz, iz0, jz0, descz, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, iwork0, liwork, info0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevr in scalafx_pheevr_complex", info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheevr_complex
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the divide and conquer
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! algorithm.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heevd, p?trsm in
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values. See the scalafx_pheevd_complex() routine for details.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heevd, p?trsm).
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegvd_complex(aa, desca, bb, descb, ww, zz, descz, jobz,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & uplo, ia, ja, ib, jb, iz, jz, work, rwork, iwork, allocfix, skipchol, info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix, skipchol
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheevd(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, rwork=rwork, iwork=iwork, &
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & allocfix=allocfix, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegvd_complex
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Unfortunately, SCALAPACK seems to return the wrong real work space
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     sizes for many cases. This routine (when allocfix had been set to true)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     tries to improve on it by two ways:
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It queries also the QR routine (p?heev) for workspace size and takes
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       this, if bigger than returned by p?heevd. That should ensure
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       that the pzunmtr() routine does not encounter any difficulties.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It additionally enlarges the real workspace size by the amount of
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       memory needed by the pdlasrt() routine, to make sure this would not
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       fail either.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Those fixes are empirical, may lead to oversized workspace allocations
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     and probably would not even fix the allocation problem, but are the best
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     we could find so far.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heevd).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheevd_complex(aa, desca, ww, zz, descz, jobz, uplo, ia, ja, iz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jz, work, rwork, iwork, allocfix, info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lrwork, info0, ia0, ja0, iz0, jz0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwmin, lrwmin, liwmin
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1), rtmp2(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: ctmp(1), ctmp2(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable :: work0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: rwork0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: allocfix0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(allocfix)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = allocfix
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = .false.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp, -1, rtmp, -1, itmp, 1, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevd in scalafx_pheevd", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of pheev() and take that one if bigger in the hope
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! pdormtr() would work. Additionally extend workspace in the hope pdlasrt()
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! work as well.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (allocfix0) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp2, -1, rtmp2, -1, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call handle_infoflag(info0, "pheev in scalafx_pheevd", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (jobz0 == "N") then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        lrwmin = max(2 * nn, int(rtmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        lrwmin = max(2 * nn + 2 * nn - 2, int(rtmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = max(int(ctmp(1)), int(ctmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = max(int(rtmp(1)), lrwmin)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = lrwmin + MAX(nn, size(aa, dim=1) * (desca(NB_) + size(aa, dim=2)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = int(ctmp(1))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = int(rtmp(1))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=sp)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_sp
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, iwork0, liwork, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevd in scalafx_pheevd_complex", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheevd_complex
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the QR algorithm.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heev, p?trsm in
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (automatically)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heev, p?trsm).
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegv_complex(aa, desca, bb, descb, ww, zz, descz, jobz,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & uplo, ia, ja, ib, jb, iz, jz, work, rwork, skipchol, info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheev(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, rwork=rwork, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegv_complex
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the MRRR algorithm.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heevr, p?trsm in
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back. Currently all eigenvalues calculated.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heevr, p?trsm).
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegvr_complex(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, rwork, iwork, skipchol, info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: scale
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0, range0
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! would be arguments for range /= "A" cases :
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: vl, vu
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: il, iu
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: m
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    range0 = "A" ! all eigenvalue/vectors - need to generalise this
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheevr(aa, desca, ww, zz, descz, range0, vl, vu, il, iu, m, nz,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & jobz=jobz0, uplo=uplo0, ia=ia, ja=ja, iz=iz, jz=jz, work=work, &
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rwork=rwork, iwork=iwork, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegvr_complex
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves complex eigenvalue problem.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated automatically)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heev).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheev_complex(aa, desca, ww, zz, descz, jobz, uplo, ia, ja,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & iz, jz, work, rwork, info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: ww(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: zz(:,:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, lwork, lrwork, lrwork_tmp, info0, ia0, ja0, iz0, jz0
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: ctmp(1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable :: work0(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: rwork0(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp, -1, rtmp, -1, info0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheev in scalafx_pheev", info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(ctmp(1))) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(ctmp(1))))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Apparently pheev sometimes returns considerably smaller work space size as
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! required in the documentation. We take the bigger value to be safe.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "N") then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwork_tmp = max(2 * nn, int(rtmp(1)))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwork_tmp = max(2 * nn + 2 * nn - 2, int(rtmp(1)))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwork_tmp) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwork_tmp))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=sp)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_sp
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, info0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheev in scalafx_pheev_complex", info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheev_complex
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Singular value decomposition
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to decompose (A).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uu  Left singular vectors (U).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descu  Descriptor of the left singular vectors.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param sigma  Singular values on exit.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param vt  Right singular vectors, transposed (Vt).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descvt  Descriptor of the right singular vectors.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for U matrix (default: "V")
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for vt matrix (default: "V")
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iu  First row of the submatrix U (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ju  First column of the submatrix U (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ivt  First row of the submatrix vt (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jvt  First column of the submatrix vt (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of columns of the matrix A (default: desca(M_))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows of the matrix A (default: desca(N_))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (complex routines p[cz]gesvd).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_c_pgesvd_complex(aa, desca, uu, descu, sigma, vt, descvt,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobu, jobvt, ia, ja, iu, ju, ivt, jvt, mm, nn, work, rwork, info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: uu(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descu(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(out) :: sigma(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(out) :: vt(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descvt(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobu, jobvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iu, ju, ivt, jvt, mm, nn
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout), allocatable, optional :: work(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), intent(inout), allocatable, optional :: rwork(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nn0, lwork, lrwmin, lrwork, lwmin, info0, ia0, ja0, iu0, ju0, ivt0, jvt0
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobu0, jobvt0
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: ctmp(1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable :: work0(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp) :: rtmp(1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(sp), allocatable :: rwork0(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobu)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = jobu
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = "V"
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobvt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = jobvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = "V"
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ju)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = ju
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ivt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = ivt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jvt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = jvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ju0, descu, vt, ivt0, jvt0, descvt, ctmp, -1, rtmp, info0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_complex", info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(real(ctmp(1)))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lrwmin = int(rtmp(1))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! SVD
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ju0, descu, vt, ivt0, jvt0, descvt, work0, lwmin, rwork0, info0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_c_pgesvd_complex", info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_c_pgesvd_complex
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves A X = B problem for a positive definite symmetric/hermitian A.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left side matrix
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?osvd).
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pposv_complex(aa, desca, bb, descb, uplo, nn, nrhs, ia, ja, ib, jb, info)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, nrhs, ia, ja, ib, jb
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, nrhs0, ia0, ja0, ib0, jb0, info0
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = min(desca(M_), desca(N_))
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nrhs)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = nrhs
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = descb(N_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (descb(M_) > nn0) call error("B matrix rows too large for A matrix solution")
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pposv(uplo0, nn0, nrhs0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, info0)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pposv in scalafx_pposv_complex", info)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pposv_complex
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves triangular matrix equation.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left hand side of equation (A)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side (B).
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param side  Side of A (default: "L")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param transa  Transposition flag (default "N")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param diag  Specifieds whether matrix A is unit triangular (default: "N")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param alpha  Prefactor of B (default: 1.0)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of the submatrix B (default: descb(M_))
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of the submatrix B (default: descb(N_))
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?trsm).
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrsm_complex(aa, desca, bb, descb, side, uplo, transa, diag,&
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & alpha, mm, nn, ia, ja, ib, jb)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: side, uplo, transa, diag
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), intent(in), optional :: alpha
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp) :: alpha0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(side)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = side
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = "L"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(transa)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = transa
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = "N"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(alpha)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = alpha
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = cmplx(1, 0, sp)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = descb(M_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = descb(N_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrsm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrsm_complex
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2037 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Creates a distributed matrix and allocates local storage.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mb  Row block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nb  Column block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desc  Matrix descriptor on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mtxloc  Allocated local matrix on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rsrc  Process row, over which first row is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead row).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param csrc  Process column, over which first column is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead column).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_creatematrix_complex(mygrid, mm, nn, mb, nb, mtxloc,&
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: mm, nn, mb, nb
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(sp), allocatable, intent(out) :: mtxloc(:,:)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: desc(DLEN_)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nrowloc, ncolloc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(mtxloc(nrowloc, ncolloc))
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_creatematrix_complex
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2006 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2007 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
# 2008 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the Cholesky factorization of a Hermitian positive definite matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of the matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix (default: 1)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?potrf).
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotrf_dcomplex(aa, desca, uplo, nn, ia, ja, info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, info0
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotrf(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotrf in scalafx_ppotrf_dcomplex", info)
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotrf_dcomplex
# 2009 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ppotri_dcomplex(aa, desca, uplo, ia, ja, nn, info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ppotri(uplo0, nn0, aa, ia0, ja0, desca, info0)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ppotri in scalafx_ppotri_dcomplex", info)
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ppotri_dcomplex
# 2010 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Computes the inverse of a symmetric/Hermitian positive definite matrix.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrtri_dcomplex(aa, desca, uplo, diag, ia, ja, nn, info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Cholesky decomposed matrix A on entry, inverse on exit.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether lower ("L") or upper ("U") part of A contains the
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !! matrix. Default: "L".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Specifies whether A is unit triangular ("U") or not ("N"). Default: "N".
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_).
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, diag0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0, info0
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrtri(uplo0, diag0, nn0, aa, ia0, ja0, desca, info0)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "ptrtri in scalafx_ptrtri_dcomplex", info)
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrtri_dcomplex
# 2011 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> LU factorization of a general matrix with pivoting
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetrf_dcomplex(aa, desca, ipiv, ia, ja, mm, nn, info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> LU decomposition on exit, pivoted by ipiv
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of columns in the submatrix of A. Default: desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, mm0, nn0, info0
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetrf(mm0, nn0, aa, ia0, ja0, desca, ipiv, info0)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetrf in scalafx_pgetrf_dcomplex", info)
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetrf_dcomplex
# 2012 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Inversion of a LU-factorized general matrix with pivoting
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pgetri_dcomplex(aa, desca, ipiv, ia, ja, nn, work, iwork, info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Inverse exit, pivoted by ipiv
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Descriptor of A.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Pivot matrix
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: ipiv(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First row of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> First column of the submatrix of A. Default: 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Number of rows in the submatrix of A. Default: desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Integer work array, if provided externally
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !> Info flag. If not specified and error occurs, the subroutine stops.
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    !------------------------------------------------------------------------
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable :: work0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwork, liwork, info0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, nn0
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: rtmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, rtmp, -1, itmp, -1, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_dcomplex", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(rtmp(1))) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(rtmp(1))))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= itmp(1)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(itmp(1)))
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgetri(nn0, aa, ia0, ja0, desca, ipiv, work0, lwork, iwork0, liwork, info0)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgetri in scalafx_pgetri_dcomplex", info)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy argument present
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pgetri_dcomplex
# 2013 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Reduces Hermitian-definite generalized eigenvalue problem to standard form.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ibtype  Type of the problem (1, 2, 3).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side of the eigenvalue equation (B).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desb  Descriptor of matrix B.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param scale  Scaling factors on return.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows and columns of the submatrices A and B
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: desca(M_)).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?sygst/p?hegst).
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegst_dcomplex(ibtype, aa, desca, bb, descb, scale, uplo, &
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & nn, ia, ja, ib, jb, info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: ibtype
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(in) :: bb(:,:)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: scale
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ib, jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, ia0, ja0, ib0, jb0, info0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(M_)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call phegst(ibtype, uplo0, nn0, aa, ia0, ja0, desca, bb,&
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib0, jb0, descb, scale, info0)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "$4 in scalafx_$4_dcomplex", info)
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegst_dcomplex
# 2014 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heevr).
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheevr_dcomplex(aa, desca, ww, zz, descz, range, vl, vu,&
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & il, iu, m, nz, jobz, uplo, ia, ja, iz, jz, work, rwork, iwork, info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in) :: range
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(in) :: vl, vu
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: il, iu
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: m, nz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lrwork, info0, ia0, ja0, iz0, jz0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwmin, lrwmin, liwmin
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: ctmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable :: work0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: rwork0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevr(jobz0, range, uplo0, nn, aa, ia0, ja0, desca, vl, vu, il, iu, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & m, nz, ww, zz, iz0, jz0, descz, ctmp, -1, rtmp, -1, itmp, -1, info0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevr in scalafx_pheevr", info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(ctmp(1))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lrwmin = int(rtmp(1))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    liwmin = itmp(1)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=dp)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_dp
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevr(jobz0, range, uplo0, nn, aa, ia0, ja0, desca, vl, vu, il, iu, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & m, nz, ww, zz, iz0, jz0, descz, &
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, iwork0, liwork, info0)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevr in scalafx_pheevr_dcomplex", info)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheevr_dcomplex
# 2027 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the divide and conquer
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! algorithm.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heevd, p?trsm in
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values. See the scalafx_pheevd_dcomplex() routine for details.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heevd, p?trsm).
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegvd_dcomplex(aa, desca, bb, descb, ww, zz, descz, jobz,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & uplo, ia, ja, ib, jb, iz, jz, work, rwork, iwork, allocfix, skipchol, info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix, skipchol
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheevd(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, rwork=rwork, iwork=iwork, &
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & allocfix=allocfix, info=info)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegvd_dcomplex
# 2028 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian eigenvalue problem by the divide and conquer algorithm.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param allocfix  If yes, the routine tries to enlarge the workspace size
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     as returned by the appropriate p?syevd() routine by some empirical
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     values.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Unfortunately, SCALAPACK seems to return the wrong real work space
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     sizes for many cases. This routine (when allocfix had been set to true)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     tries to improve on it by two ways:
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It queries also the QR routine (p?heev) for workspace size and takes
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       this, if bigger than returned by p?heevd. That should ensure
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       that the pzunmtr() routine does not encounter any difficulties.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     * It additionally enlarges the real workspace size by the amount of
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       memory needed by the pdlasrt() routine, to make sure this would not
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!       fail either.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \note
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Those fixes are empirical, may lead to oversized workspace allocations
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     and probably would not even fix the allocation problem, but are the best
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     we could find so far.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heevd).
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheevd_dcomplex(aa, desca, ww, zz, descz, jobz, uplo, ia, ja, iz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jz, work, rwork, iwork, allocfix, info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: allocfix
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, liwork, lwork, lrwork, info0, ia0, ja0, iz0, jz0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: lwmin, lrwmin, liwmin
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1), rtmp2(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: ctmp(1), ctmp2(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable :: work0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: rwork0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable :: iwork0(:)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: allocfix0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(allocfix)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = allocfix
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocfix0 = .false.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate workspaces
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp, -1, rtmp, -1, itmp, 1, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevd in scalafx_pheevd", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Check workspace size of pheev() and take that one if bigger in the hope
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! pdormtr() would work. Additionally extend workspace in the hope pdlasrt()
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! work as well.
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (allocfix0) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp2, -1, rtmp2, -1, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call handle_infoflag(info0, "pheev in scalafx_pheevd", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (jobz0 == "N") then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        lrwmin = max(2 * nn, int(rtmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        lrwmin = max(2 * nn + 2 * nn - 2, int(rtmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = max(int(ctmp(1)), int(ctmp2(1)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = max(int(rtmp(1)), lrwmin)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = lrwmin + MAX(nn, size(aa, dim=1) * (desca(NB_) + size(aa, dim=2)))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lwmin = int(ctmp(1))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwmin = int(rtmp(1))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      liwmin = itmp(1)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(iwork) >= liwmin) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(iwork, iwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(iwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(iwork0)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(iwork0(liwmin))
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  liwork = size(iwork0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=dp)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_dp
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iwork0(:) = 0
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheevd(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, iwork0, liwork, info0)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheevd in scalafx_pheevd_dcomplex", info)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iwork)) then
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(iwork0, iwork)
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheevd_dcomplex
# 2029 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the QR algorithm.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heev, p?trsm in
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (automatically)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heev, p?trsm).
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegv_dcomplex(aa, desca, bb, descb, ww, zz, descz, jobz,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & uplo, ia, ja, ib, jb, iz, jz, work, rwork, skipchol, info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheev(aa, desca, ww, zz, descz, jobz=jobz0, uplo=uplo0, ia=ia,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ja=ja, iz=iz, jz=jz, work=work, rwork=rwork, info=info)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegv_dcomplex
# 2030 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves Hermitian generalized eigenvalue problem by the MRRR algorithm.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \details Invokes SCALAPACK routines p?potrf, p?hegst, p?heevr, p?trsm in
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! order to transform the general eigenvalue problem to the standard form
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! and transform the eigenvectors back. Currently all eigenvalues calculated.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A), transformed matrix on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Matrix on the right hand side (B), transformed matrix on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iwork Integer working array (if not specified, allocated
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     automatically)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param skipchol  If true, the Cholesky transformation will be skipped.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     Array bb must have the Cholesky transformed form.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routines p?potrf, p?hegst, p?heevr, p?trsm).
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_phegvr_dcomplex(aa, desca, bb, descb, ww, zz, descz, jobz, uplo,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & ia, ja, ib, jb, iz, jz, work, rwork, iwork, skipchol, info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, iz, jz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(inout), allocatable, optional :: iwork(:)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical, intent(in), optional :: skipchol
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: scale
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobz0, transa, uplo0, range0
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    logical :: skipchol0
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! would be arguments for range /= "A" cases :
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: vl, vu
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: il, iu
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: m
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    range0 = "A" ! all eigenvalue/vectors - need to generalise this
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(skipchol)) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = skipchol
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    skipchol0 = .false.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Cholesky transformation of B.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (.not. skipchol0) then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ppotrf(bb, descb, uplo=uplo0, ia=ib, ja=jb, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Reducing to standard form
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_phegst(1, aa, desca, bb, descb, scale, uplo=uplo0, ia=ia, ja=ja,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ib=ib, jb=jb, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Solving eigenvalue problem.
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_pheevr(aa, desca, ww, zz, descz, range0, vl, vu, il, iu, m, nz,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & jobz=jobz0, uplo=uplo0, ia=ia, ja=ja, iz=iz, jz=jz, work=work, &
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & rwork=rwork, iwork=iwork, info=info)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Transforming eigenvectors back
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "V") then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      if (uplo0 == "L" .or. uplo0 == "l") then
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "C"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      else
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
         transa = "N"
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call scalafx_ptrsm(bb, descb, zz, descz, side="L", uplo=uplo0,&
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
          & transa=transa, diag="N", ia=ib, ja=jb, ib=iz, jb=jz)
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_phegvr_dcomplex
# 2031 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves complex eigenvalue problem.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to diagonalize (A).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ww  Eigenvalues on exit.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param zz  Eigenvectors on exit (Z).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descz  Descriptor of the eigenvector matrix.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobz  Job type (default: "V")
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iz  First row of the submatrix Z (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jz  First column of the submatrix Z (default: 1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Complex working array (if not specified, allocated automatically)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?heev).
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pheev_dcomplex(aa, desca, ww, zz, descz, jobz, uplo, ia, ja,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & iz, jz, work, rwork, info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: ww(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: zz(:,:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descz(DLEN_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobz, uplo
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iz, jz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn, lwork, lrwork, lrwork_tmp, info0, ia0, ja0, iz0, jz0
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0, jobz0
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: ctmp(1)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable :: work0(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: rwork0(:)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = jobz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobz0 = "V"
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = iz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iz0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jz)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = jz
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jz0 = 1
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn = desca(M_)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ctmp, -1, rtmp, -1, info0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheev in scalafx_pheev", info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= int(ctmp(1))) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(int(ctmp(1))))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Apparently pheev sometimes returns considerably smaller work space size as
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! required in the documentation. We take the bigger value to be safe.
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (jobz0 == "N") then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwork_tmp = max(2 * nn, int(rtmp(1)))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      lrwork_tmp = max(2 * nn + 2 * nn - 2, int(rtmp(1)))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwork_tmp) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwork_tmp))
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Diagonalization
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Initializing workspace as SCALAPACK apparently accesses uninitialized
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! elements in it (nagfors -nan flag causes *sometimes* arithmetic exception)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    work0(:) = cmplx(0, kind=dp)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rwork0(:) = 0.0_dp
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pheev(jobz0, uplo0, nn, aa, ia0, ja0, desca, ww, zz, iz0, jz0, descz,&
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & work0, lwork, rwork0, lrwork, info0)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pheev in scalafx_pheev_dcomplex", info)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pheev_dcomplex
# 2032 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Singular value decomposition
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Matrix to decompose (A).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uu  Left singular vectors (U).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descu  Descriptor of the left singular vectors.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param sigma  Singular values on exit.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param vt  Right singular vectors, transposed (Vt).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descvt  Descriptor of the right singular vectors.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for U matrix (default: "V")
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jobu  Job type for vt matrix (default: "V")
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param iu  First row of the submatrix U (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ju  First column of the submatrix U (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ivt  First row of the submatrix vt (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jvt  First column of the submatrix vt (default: 1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of columns of the matrix A (default: desca(M_))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of rows of the matrix A (default: desca(N_))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param work  Working array (if not specified, allocated automatically)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rwork Real working array (if not specified, allocated automatically)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (complex routines p[cz]gesvd).
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_c_pgesvd_dcomplex(aa, desca, uu, descu, sigma, vt, descvt,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & jobu, jobvt, ia, ja, iu, ju, ivt, jvt, mm, nn, work, rwork, info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: uu(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descu(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(out) :: sigma(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(out) :: vt(:,:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descvt(DLEN_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: jobu, jobvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: ia, ja, iu, ju, ivt, jvt, mm, nn
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout), allocatable, optional :: work(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), intent(inout), allocatable, optional :: rwork(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: mm0, nn0, lwork, lrwmin, lrwork, lwmin, info0, ia0, ja0, iu0, ju0, ivt0, jvt0
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: jobu0, jobvt0
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: ctmp(1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable :: work0(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp) :: rtmp(1)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    real(dp), allocatable :: rwork0(:)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobu)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = jobu
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobu0 = "V"
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jobvt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = jobvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jobvt0 = "V"
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(iu)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = iu
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    iu0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ju)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = ju
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ju0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ivt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = ivt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ivt0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jvt)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = jvt
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jvt0 = 1
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = desca(M_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = desca(N_)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Allocate  workspace
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ju0, descu, vt, ivt0, jvt0, descvt, ctmp, -1, rtmp, info0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_r_pgesvd_dcomplex", info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lwmin = int(real(ctmp(1)))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    lrwmin = int(rtmp(1))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(work) >= lwmin) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(work, work0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(work)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(work0)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(work0(lwmin))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lwork = size(work0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (size(rwork) >= lrwmin) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      call move_alloc(rwork, rwork0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    else
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      deallocate(rwork)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (.not. allocated(rwork0)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(rwork0(lrwmin))
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  lrwork = size(rwork0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! SVD
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pgesvd(jobu0, jobvt0, mm0, nn0, aa, ia0, ja0, desca, sigma, uu, iu0,&
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & ju0, descu, vt, ivt0, jvt0, descvt, work0, lwmin, rwork0, info0)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pgesvd in scalafx_c_pgesvd_dcomplex", info)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Save work space allocations, if dummy arguments present
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(work)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(work0, work)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(rwork)) then
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call move_alloc(rwork0, rwork)
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_c_pgesvd_dcomplex
# 2033 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves A X = B problem for a positive definite symmetric/hermitian A.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left side matrix
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag. If not specified and SCALAPACK calls returns nozero,
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     subroutine stops.
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?osvd).
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_pposv_dcomplex(aa, desca, bb, descb, uplo, nn, nrhs, ia, ja, ib, jb, info)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: uplo
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: nn, nrhs, ia, ja, ib, jb
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: uplo0
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nn0, nrhs0, ia0, ja0, ib0, jb0, info0
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ! Handle optional flags
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = min(desca(M_), desca(N_))
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nrhs)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = nrhs
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nrhs0 = descb(N_)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    if (descb(M_) > nn0) call error("B matrix rows too large for A matrix solution")
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call pposv(uplo0, nn0, nrhs0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, info0)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call handle_infoflag(info0, "pposv in scalafx_pposv_dcomplex", info)
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_pposv_dcomplex
# 2034 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Solves triangular matrix equation.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param aa  Left hand side of equation (A)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desca  Descriptor of matrix A.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param bb  Right hand side (B).
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param descb  Descriptor of matrix B.
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param side  Side of A (default: "L")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param uplo  Upper or lower diagonal matrix (default: "L")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param transa  Transposition flag (default "N")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param diag  Specifieds whether matrix A is unit triangular (default: "N")
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param alpha  Prefactor of B (default: 1.0)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of the submatrix B (default: descb(M_))
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of the submatrix B (default: descb(N_))
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ia  First row of the submatrix A (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ja  First column of the submatrix A (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param ib  First row of the submatrix B (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param jb  First column of the submatrix B (default: 1)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \see SCALAPACK documentation (routine p?trsm).
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_ptrsm_dcomplex(aa, desca, bb, descb, side, uplo, transa, diag,&
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & alpha, mm, nn, ia, ja, ib, jb)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character, intent(in), optional :: side, uplo, transa, diag
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), intent(in), optional :: alpha
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp) :: alpha0
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(side)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = side
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    side0 = "L"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(uplo)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = uplo
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    uplo0 = "L"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(transa)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = transa
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    transa0 = "N"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(diag)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = diag
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    diag0 = "N"
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(alpha)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = alpha
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    alpha0 = cmplx(1, 0, dp)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ia)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = ia
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ia0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ja)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = ja
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ja0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(ib)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = ib
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    ib0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(jb)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = jb
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    jb0 = 1
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(mm)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = mm
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    mm0 = descb(M_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  if (present(nn)) then
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = nn
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    nn0 = descb(N_)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call ptrsm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_ptrsm_dcomplex
# 2035 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2037 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Creates a distributed matrix and allocates local storage.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of global matrix.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mb  Row block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nb  Column block size.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desc  Matrix descriptor on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mtxloc  Allocated local matrix on exit.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rsrc  Process row, over which first row is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead row).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param csrc  Process column, over which first column is distributed
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead column).
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag.
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_creatematrix_dcomplex(mygrid, mm, nn, mb, nb, mtxloc,&
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: mm, nn, mb, nb
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    complex(dp), allocatable, intent(out) :: mtxloc(:,:)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: desc(DLEN_)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nrowloc, ncolloc
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, info)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(mtxloc(nrowloc, ncolloc))
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_creatematrix_dcomplex
# 2038 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2040 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !> Creates a distributed matrix and allocates local storage.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mm  Number of rows of global matrix.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nn  Number of columns of global matrix.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mb  Row block size.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param nb  Column block size.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param desc  Matrix descriptor on exit.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param mtxloc  Allocated local matrix on exit.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param rsrc  Process row, over which first row is distributed
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead row).
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param csrc  Process column, over which first column is distributed
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!     (default: lead column).
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !! \param info  Info flag.
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  !!
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  subroutine scalafx_creatematrix_int(mygrid, mm, nn, mb, nb, mtxloc,&
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
      & desc, rsrc, csrc, info)
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in) :: mm, nn, mb, nb
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, allocatable, intent(out) :: mtxloc(:,:)
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out) :: desc(DLEN_)
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer, intent(out), optional :: info
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    integer :: nrowloc, ncolloc
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, info)
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    call scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    allocate(mtxloc(nrowloc, ncolloc))
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"

# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end subroutine scalafx_creatematrix_int
# 2041 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"


  !> Returns descriptor and size for the local part of a distributed matrix.
  !!
  !! \param mygrid  BLACS descriptor.
  !! \param mm  Number of rows of global matrix.
  !! \param nn  Number of columns of global matrix.
  !! \param mb  Row block size.
  !! \param nb  Column block size.
  !! \param desc  Matrix descriptor on exit.
  !! \param nrowloc  Number of rows for local matrix.
  !! \param ncolloc  Number of columns for local matrix.
  !! \param rsrc  Process row, over which first row is distributed
  !!     (default: lead row).
  !! \param csrc  Process column, over which first column is distributed
  !!     (default: lead column).
  !! \param info  Info flag.
  !!
  subroutine scalafx_getdescriptor(mygrid, mm, nn, mb, nb, desc, rsrc, csrc, &
      & info)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: mm, nn, mb, nb
    integer, intent(out) :: desc(DLEN_)
    integer, intent(in), optional :: rsrc, csrc
    integer, intent(out), optional :: info

    integer :: rsrc0, csrc0, info0
    integer :: nrowloc

  if (present(rsrc)) then
# 2070 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rsrc0 = rsrc
# 2070 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2070 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    rsrc0 = mygrid%leadrow
# 2070 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
  if (present(csrc)) then
# 2071 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    csrc0 = csrc
# 2071 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  else
# 2071 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
    csrc0 = mygrid%leadcol
# 2071 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fpp"
  end if
    ! At least one local row, as per definition LLD >= 1 in the descriptor.
    nrowloc = max(1, numroc(mm, mb, mygrid%myrow, rsrc0, mygrid%nrow))
    call descinit(desc, mm, nn, mb, nb, rsrc0, csrc0, mygrid%ctxt, nrowloc, &
        & info0)
    call handle_infoflag(info0, "descinit in scalafx_getdescriptor", info)

  end subroutine scalafx_getdescriptor


  !> Returns the shape of the local part of a distributed array.
  !!
  !! \param mygrid  BLACS grid descriptor.
  !! \param desc  Global matrix descriptor.
  !! \param nrowloc  Nr. of local rows.
  !! \param ncolloc  Nr. of local columns.
  !!
  subroutine scalafx_getlocalshape(mygrid, desc, nrowloc, ncolloc)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_)
    integer, intent(out) :: nrowloc, ncolloc

    nrowloc = max(1, numroc(desc(M_), desc(MB_), mygrid%myrow, desc(RSRC_), &
        & mygrid%nrow))
    ncolloc = numroc(desc(N_), desc(NB_), mygrid%mycol, desc(CSRC_), &
        & mygrid%ncol)

  end subroutine scalafx_getlocalshape


  !> Returns the shape of a remote part of a distributed array, given the processor number
  !!
  !! \param mygrid  BLACS grid descriptor.
  !! \param desc  Global matrix descriptor.
  !! \param iproc  Processor number
  !! \param nrowloc  Nr. of local rows, returns 0 if iproc outside of grid.
  !! \param ncolloc  Nr. of local columns, returns 0 if iproc outside of grid.
  !!
  subroutine scalafx_getremoteshape(mygrid, desc, iproc, nrowloc, ncolloc, storage)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_), iproc
    integer, intent(out) :: nrowloc, ncolloc
    logical, intent(in), optional :: storage

    integer :: iprow, ipcol
    logical :: isStorage

    isStorage = .false.
    if (present(storage)) then
      isStorage = storage
    end if

    if (iproc < 0 .or. iproc >= mygrid%nproc) then
      nrowloc = 0
      ncolloc = 0
    else
      call blacsfx_pcoord(myGrid, iproc, iprow, ipcol)
      if (isStorage) then
        nrowloc = max(1,numroc(desc(M_), desc(MB_), iprow, desc(RSRC_), mygrid%nrow))
      else
        nrowloc = numroc(desc(M_), desc(MB_), iprow, desc(RSRC_), mygrid%nrow)
      end if
      ncolloc = numroc(desc(N_), desc(NB_), ipcol, desc(CSRC_), mygrid%ncol)
    end if

  end subroutine scalafx_getremoteshape


  !> Maps global position in a distributed matrix to local one.
  !!
  !! \param mygrid  BLACS descriptor.
  !! \param desc  Descriptor of the distributed matrix.
  !! \param grow  Global row index.
  !! \param gcol  Global column index.
  !! \param lrow  Local row index on output.
  !! \param lcol  Local column index on output.
  !! \param rsrc  Row of the process owning the local matrix.
  !! \param csrc  Column of the process owning the local matrix.
  !!
  subroutine scalafx_infog2l_single(mygrid, desc, grow, gcol,&
      & lrow, lcol, rsrc, csrc)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_)
    integer, intent(in) :: grow, gcol
    integer, intent(out) :: lrow, lcol
    integer, intent(out) :: rsrc, csrc

    call infog2l(grow, gcol, desc, mygrid%nrow, mygrid%ncol, mygrid%myrow,&
        & mygrid%mycol, lrow, lcol, rsrc, csrc)

  end subroutine scalafx_infog2l_single

  !> Maps global positions in a distributed matrix to local one.
  !!
  !! \param mygrid  BLACS descriptor.
  !! \param desc  Descriptor of the distributed matrix.
  !! \param grow  Global row indices.
  !! \param gcol  Global column indices.
  !! \param lrow  Local row indices on output.
  !! \param lcol  Local column indices on output.
  !! \param rsrc  Rows of the process owning the local matrix.
  !! \param csrc  Columns of the process owning the local matrix.
  !! \param calcAllIndices  Whether to calculate all lrow and lcol,
  !!     even if the current process does not own them. (default: true)
  !!
  subroutine scalafx_infog2l_array(mygrid, desc, grow, gcol,&
      & lrow, lcol, rsrc, csrc, calcAllIndices)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: desc(DLEN_)
    integer, intent(in) :: grow(:), gcol(:)
    integer, intent(out) :: lrow(:), rsrc(:)
    integer, intent(out) :: lcol(:), csrc(:)
    logical, intent(in), optional :: calcAllIndices

    call scalapackfx_infog2l_helper(grow, desc(MB_), desc(RSRC_),&
        & mygrid%myrow, mygrid%nrow, lrow, rsrc, calcAllIndices)

    call scalapackfx_infog2l_helper(gcol, desc(NB_), desc(CSRC_),&
        & mygrid%mycol, mygrid%ncol, lcol, csrc, calcAllIndices)

  end subroutine scalafx_infog2l_array

  !> Helper routine for scalafx_infog2l_array.
  !!
  !! \param globalInd  Global row/column indices.
  !! \param descB  Either desc(MB_) or desc(NB_).
  !! \param descSRC  Either desc(RSRC_) or desc(CSRC_).
  !! \param myPos  Row/column of the current process.
  !! \param nPos  Number of rows/columns.
  !! \param localInd  Local row/column indices on output.
  !! \param localPos  Rows/columns of the process owning the local matrix.
  !! \param calcAllIndices  Whether to calculate all local indices,
  !!     even if the current process does not own them. (default: true)
  !!
  subroutine scalapackfx_infog2l_helper(globalInd, descB, descSRC,&
      & myPos, nPos, localInd, localPos, calcAllIndices)
    integer, intent(in) :: globalInd(:)
    integer, intent(in) :: descB, descSRC
    integer, intent(in) :: myPos, nPos
    integer, intent(out) :: localInd(:), localPos(:)
    logical, intent(in), optional :: calcAllIndices

    real(dp) :: inv
    integer, dimension(size(globalInd)) :: blk
    integer :: check, i
    logical :: calcAllIndices_

    ! Note that we explicitly multiply with a double here instead of
    ! dividing by an integer to enhance performance.
    inv = 1.0_dp / real(descB, kind=dp)
    blk = (globalInd - 1) * inv

    check = modulo(myPos - descSRC, nPos)

    localPos = mod(blk + descSRC, nPos)

    calcAllIndices_ = .true.
    if (present(calcAllIndices)) then
      calcAllIndices_ = calcAllIndices
    end if

    do i = 1, size(globalInd)
      if (calcAllIndices_ .or. myPos == localPos(i)) then
        localInd(i) = (blk(i) / nPos + 1) * descB + 1
        if (check >= mod(blk(i), nPos)) then
          if (myPos == localPos(i)) then
            localInd(i) = localInd(i) + mod(globalInd(i) - 1, descB)
          end if
          localInd(i) = localInd(i) - descB
        end if
      else
        localInd(i) = -1
      end if
    end do

  end subroutine scalapackfx_infog2l_helper

  !> Maps local row or column index onto global matrix position.
  !!
  !! \param indxloc  Local index on input.
  !! \param nb  Block size for the column/row
  !! \param iproc  Local array index
  !! \param isrcproc coordinate of the process that possesses the first row/column of the
  !! distributed matrix
  !! \param nprocs  Total number of processes over which the matrix is distributed
  !!
  function scalafx_indxl2g(indxloc, nb, iproc, isrcproc, nprocs)
    integer :: scalafx_indxl2g
    integer, intent(in) :: indxloc, nb, iproc, isrcproc, nprocs

    scalafx_indxl2g = indxl2g(indxloc, nb, iproc, isrcproc, nprocs)

  end function scalafx_indxl2g


  !> Maps global matrix position onto processor.
  !!
  !! \param indxloc  Global index on input.
  !! \param nb  Block size for the column/row
  !! \param isrcproc coordinate of the process that possesses the first row/column of thexs
  !! distributed matrix
  !! \param nprocs  Total number of processes over which the matrix is distributed
  !!
  function scalafx_indxg2p(indxglob, nb, isrcproc, nprocs)
    integer :: scalafx_indxg2p
    integer, intent(in) :: indxglob, nb, isrcproc, nprocs
    integer :: iDummy

    scalafx_indxg2p = indxg2p(indxglob, nb, iDummy, isrcproc, nprocs)

  end function scalafx_indxg2p


  !> Processor grid location holding a global matrix element. If the element is outside of the
  !! matrix, returns location (-1,-1)
  subroutine scalafx_infog2p(mygrid, desc, grow, gcol, prow, pcol)

    !> BLACS descriptor.
    type(blacsgrid), intent(in) :: mygrid

    !> Descriptor of the distributed matrix.
    integer, intent(in) :: desc(DLEN_)

    !> Global row index.
    integer, intent(in) :: grow

    !> Global column index
    integer, intent(in) :: gcol

    !> Row index in the BLACS grid
    integer, intent(out) :: prow

    !> Column index in BLACS grid
    integer, intent(out) :: pcol

    if (grow < 0 .or. grow > desc(M_) .or. gcol < 0 .or. gcol > desc(N_)) then
      prow = -1
      pcol = -1
    else
      prow = scalafx_indxg2p(grow, desc(MB_), desc(RSRC_), myGrid%nrow)
      pcol = scalafx_indxg2p(gcol, desc(NB_), desc(CSRC_), myGrid%ncol)
    end if

  end subroutine scalafx_infog2p


  !> Maps a global position in a distributed matrix to local one.
  !!
  subroutine scalafx_localindices(mygrid, desc, grow, gcol, local, lrow, lcol)

    !> BLACS descriptor.
    type(blacsgrid), intent(in) :: mygrid

    !> Descriptor of the distributed matrix.
    integer, intent(in) :: desc(DLEN_)

    !> Global row index.
    integer, intent(in) :: grow

    !> Global column index
    integer, intent(in) :: gcol

    !> Indicates whether given global index is local for the calling process.
    logical, intent(out) :: local

    !> Row index in the local matrix on the process holding that matrix, if outside the matrix
    !> returns 0
    integer, intent(out) :: lrow

    !> Column index in the local matrix on the process holding that matrix, if outside the matrix
    !> returns 0
    integer, intent(out) :: lcol

    !------------------------------------------------------------------------

    integer :: rsrc, csrc

    if (grow < 0 .or. grow > desc(M_) .or. gcol < 0 .or. gcol > desc(N_)) then
      lrow = 0
      lcol = 0
      local = .false.
    else
      call infog2l(grow, gcol, desc, mygrid%nrow, mygrid%ncol, mygrid%myrow,&
          & mygrid%mycol, lrow, lcol, rsrc, csrc)
      local = (rsrc == mygrid%myrow .and. csrc == mygrid%mycol)
    end if

  end subroutine scalafx_localindices


  !> Number of rows or columns of distributed matrix owned by a specific process.
  !!
  !! \param nn Number of columns (or rows) of global matrix.
  !! \param nb Column (or row) block size.
  !! \param iproc The coordinate of the process whose local array row or column is to be determined.
  !! \param nproc The total number processes over which the matrix is distributed.
  function scalafx_numroc(nn, nb, iproc, isrcproc, nproc)
    integer :: scalafx_numroc
    integer, intent(in) :: nn, nb, iproc, isrcproc, nproc

    scalafx_numroc = numroc(nn, nb, iproc, isrcproc, nproc)

  end function scalafx_numroc

end module scalapackfx_module
