# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 83 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 89 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"




# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 196 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"




# 203 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 253 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"




# 260 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 355 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 360 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 440 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 445 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 483 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 528 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 534 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 573 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

!> High level Fortran wrappers for the PBLAS library.
module pblasfx_module
  use scalapackfx_common_module
  use pblas_module
  implicit none
  private

  public :: pblasfx_psyr, pblasfx_pher
  public :: pblasfx_psyrk, pblasfx_pherk
  public :: pblasfx_psyr2k, pblasfx_pher2k
  public :: pblasfx_psymv, pblasfx_phemv
  public :: pblasfx_psymm, pblasfx_phemm
  public :: pblasfx_pgemm
  public :: pblasfx_ptrmm
  public :: pblasfx_ptran, pblasfx_ptranu
  public :: pblasfx_ptranc

  interface pblasfx_psyr
    module procedure pblasfx_psyr_real, pblasfx_psyr_dreal
  end interface pblasfx_psyr

  interface pblasfx_pher
    module procedure pblasfx_pher_complex, pblasfx_pher_dcomplex
  end interface pblasfx_pher

  interface pblasfx_psyrk
    module procedure pblasfx_psyrk_real, pblasfx_psyrk_dreal
  end interface pblasfx_psyrk

  interface pblasfx_pherk
    module procedure pblasfx_pherk_complex, pblasfx_pherk_dcomplex
  end interface pblasfx_pherk

  interface pblasfx_psyr2k
    module procedure pblasfx_psyr2k_real, pblasfx_psyr2k_dreal
  end interface pblasfx_psyr2k

  interface pblasfx_pher2k
    module procedure pblasfx_pher2k_complex, pblasfx_pher2k_dcomplex
  end interface pblasfx_pher2k

  interface pblasfx_psymv
    module procedure pblasfx_psymv_real, pblasfx_psymv_dreal
  end interface pblasfx_psymv

  interface pblasfx_phemv
    module procedure pblasfx_phemv_complex, pblasfx_phemv_dcomplex
  end interface pblasfx_phemv

  interface pblasfx_psymm
    module procedure pblasfx_psymm_real, pblasfx_psymm_dreal
  end interface pblasfx_psymm

  interface pblasfx_phemm
    module procedure pblasfx_phemm_complex, pblasfx_phemm_dcomplex
  end interface pblasfx_phemm

  interface pblasfx_ptrmm
    module procedure pblasfx_ptrmm_real, pblasfx_ptrmm_dreal, &
        & pblasfx_ptrmm_complex, pblasfx_ptrmm_dcomplex
  end interface pblasfx_ptrmm

  interface pblasfx_pgemm
    module procedure pblasfx_pgemm_real, pblasfx_pgemm_dreal, &
        & pblasfx_pgemm_complex, pblasfx_pgemm_dcomplex
  end interface pblasfx_pgemm

  interface pblasfx_ptran
    module procedure pblasfx_ptran_real, pblasfx_ptran_dreal
  end interface pblasfx_ptran

  interface pblasfx_ptranu
    module procedure pblasfx_ptranu_complex, pblasfx_ptranu_dcomplex
  end interface pblasfx_ptranu

  interface pblasfx_ptranc
    module procedure pblasfx_ptranc_complex, pblasfx_ptranc_dcomplex
  end interface pblasfx_ptranc

contains


# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyr_real(xx, descx, aa, desca, uplo, nn, alpha, ix, jx, incx,&
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & ia, ja)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: xx(:,:)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ix, jx, incx, ia, ja
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ix0, jx0, incx0, ia0, ja0
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyr(uplo0, nn0, alpha0, xx, ix0, jx0, descx, incx0, aa, ia0, ja0, desca)
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyr_real
# 655 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyr_dreal(xx, descx, aa, desca, uplo, nn, alpha, ix, jx, incx,&
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & ia, ja)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: xx(:,:)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ix, jx, incx, ia, ja
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ix0, jx0, incx0, ia0, ja0
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyr(uplo0, nn0, alpha0, xx, ix0, jx0, descx, incx0, aa, ia0, ja0, desca)
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyr_dreal
# 656 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pher_complex(xx, descx, aa, desca, uplo, nn, alpha, ix, jx, incx,&
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & ia, ja)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: xx(:,:)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ix, jx, incx, ia, ja
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ix0, jx0, incx0, ia0, ja0
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pher(uplo0, nn0, alpha0, xx, ix0, jx0, descx, incx0, aa, ia0, ja0, desca)
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pher_complex
# 657 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pher_dcomplex(xx, descx, aa, desca, uplo, nn, alpha, ix, jx, incx,&
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & ia, ja)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: xx(:,:)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ix, jx, incx, ia, ja
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ix0, jx0, incx0, ia0, ja0
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pher(uplo0, nn0, alpha0, xx, ix0, jx0, descx, incx0, aa, ia0, ja0, desca)
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pher_dcomplex
# 658 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-k update.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyrk_real(aa, desca, cc, descc, uplo, trans, alpha, beta,&
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ic, jc)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: cc(:,:)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ic0, jc0
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyrk(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, beta0,&
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyrk_real
# 660 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-k update.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyrk_dreal(aa, desca, cc, descc, uplo, trans, alpha, beta,&
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ic, jc)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: cc(:,:)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ic0, jc0
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyrk(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, beta0,&
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyrk_dreal
# 661 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-k update.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pherk_complex(aa, desca, cc, descc, uplo, trans, alpha, beta,&
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ic, jc)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ic0, jc0
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pherk(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, beta0,&
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pherk_complex
# 662 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-k update.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pherk_dcomplex(aa, desca, cc, descc, uplo, trans, alpha, beta,&
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ic, jc)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ic0, jc0
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pherk(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, beta0,&
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pherk_dcomplex
# 663 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-2k update.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  Matrix to update with.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyr2k_real(aa, desca, bb, descb, cc, descc, uplo, trans, alpha, beta,&
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ib, jb, ic, jc)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: bb(:,:)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: cc(:,:)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, ic, jc
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ib0, jb0, ic0, jc0
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyr2k(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, beta0,&
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyr2k_real
# 665 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-2k update.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  Matrix to update with.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psyr2k_dreal(aa, desca, bb, descb, cc, descc, uplo, trans, alpha, beta,&
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ib, jb, ic, jc)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: bb(:,:)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: cc(:,:)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, ic, jc
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ib0, jb0, ic0, jc0
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psyr2k(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, beta0,&
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psyr2k_dreal
# 666 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-2k update.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  Matrix to update with.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pher2k_complex(aa, desca, bb, descb, cc, descc, uplo, trans, alpha, beta,&
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ib, jb, ic, jc)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: bb(:,:)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, ic, jc
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ib0, jb0, ic0, jc0
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pher2k(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, beta0,&
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pher2k_complex
# 667 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian rank-2k update.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  Matrix to update with.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param trans  "N" for normal, "T" for transposed aa (default: "N").
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pher2k_dcomplex(aa, desca, bb, descb, cc, descc, uplo, trans, alpha, beta,&
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, kk, ia, ja, ib, jb, ic, jc)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: bb(:,:)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo, trans
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, kk
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ib, jb, ic, jc
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0, trans0
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, kk0, ia0, ja0, ib0, jb0, ic0, jc0
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(trans)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = trans
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    trans0 = "N"
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    if (trans0 == "N") then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(M_)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pher2k(uplo0, trans0, nn0, kk0, alpha0, aa, ia0, ja0, desca, bb, ib0, jb0, descb, beta0,&
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pher2k_dcomplex
# 668 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psymv_real(aa, desca, xx, descx, yy, descy, uplo, alpha, beta, &
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, ia, ja, ix, jx, incx, iy, jy, incy)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: xx(:,:)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: yy(:,:)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descy(DLEN_)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ix, jx, incx, iy, jy, incy
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ia0, ja0, ix0, jx0, incx0, iy0, jy0, incy0
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(iy)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = iy
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jy)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = jy
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incy)) then
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = incy
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = 1
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psymv(uplo0, nn0, alpha0, aa, ia0, ja0, desca, xx, ix0, jx0, descx, &
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & incx0, beta0, yy, iy0, jy0, descy, incy0)
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psymv_real
# 670 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psymv_dreal(aa, desca, xx, descx, yy, descy, uplo, alpha, beta, &
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, ia, ja, ix, jx, incx, iy, jy, incy)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: xx(:,:)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: yy(:,:)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descy(DLEN_)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ix, jx, incx, iy, jy, incy
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ia0, ja0, ix0, jx0, incx0, iy0, jy0, incy0
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(iy)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = iy
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jy)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = jy
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incy)) then
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = incy
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = 1
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psymv(uplo0, nn0, alpha0, aa, ia0, ja0, desca, xx, ix0, jx0, descx, &
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & incx0, beta0, yy, iy0, jy0, descy, incy0)
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psymv_dreal
# 671 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_phemv_complex(aa, desca, xx, descx, yy, descy, uplo, alpha, beta, &
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, ia, ja, ix, jx, incx, iy, jy, incy)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: xx(:,:)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: yy(:,:)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descy(DLEN_)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha, beta
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ix, jx, incx, iy, jy, incy
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0, beta0
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ia0, ja0, ix0, jx0, incx0, iy0, jy0, incy0
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=sp)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=sp)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(iy)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = iy
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jy)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = jy
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incy)) then
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = incy
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = 1
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call phemv(uplo0, nn0, alpha0, aa, ia0, ja0, desca, xx, ix0, jx0, descx, &
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & incx0, beta0, yy, iy0, jy0, descy, incy0)
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_phemv_complex
# 672 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_phemv_dcomplex(aa, desca, xx, descx, yy, descy, uplo, alpha, beta, &
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & nn, ia, ja, ix, jx, incx, iy, jy, incy)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: xx(:,:)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descx(DLEN_)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: yy(:,:)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descy(DLEN_)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha, beta
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn, ia, ja, ix, jx, incx, iy, jy, incy
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0, beta0
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: uplo0
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: nn0, ia0, ja0, ix0, jx0, incx0, iy0, jy0, incy0
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=dp)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=dp)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(M_)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ix)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = ix
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ix0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jx)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = jx
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jx0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incx)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = incx
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incx0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(iy)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = iy
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    iy0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jy)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = jy
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jy0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(incy)) then
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = incy
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    incy0 = 1
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call phemv(uplo0, nn0, alpha0, aa, ia0, ja0, desca, xx, ix0, jx0, descx, &
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & incx0, beta0, yy, iy0, jy0, descy, incy0)
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_phemv_dcomplex
# 673 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian matrix with general matrix product
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Symmetric/Hermitian matrix.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  general matrix.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to store result
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descc  Descriptor of cc.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param side "L" for for left, "R" for right (default: "L"),
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "L" C := alpha * A * B + beta*C
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "R" C := alpha * B * A + beta*C
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psymm_real(aa, desca, bb, descb, cc, descc, side, uplo, &
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & alpha, beta, mm, nn, ia, ja, ib, jb, ic, jc)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: bb(:,:)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: cc(:,:)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb, ic, jc
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ib0, jb0, ic0, jc0
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psymm(side0, uplo0, mm0, nn0, alpha0, aa, ia0, ja0, desca, &
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psymm_real
# 675 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian matrix with general matrix product
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Symmetric/Hermitian matrix.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  general matrix.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to store result
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descc  Descriptor of cc.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param side "L" for for left, "R" for right (default: "L"),
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "L" C := alpha * A * B + beta*C
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "R" C := alpha * B * A + beta*C
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_psymm_dreal(aa, desca, bb, descb, cc, descc, side, uplo, &
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & alpha, beta, mm, nn, ia, ja, ib, jb, ic, jc)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: bb(:,:)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: cc(:,:)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb, ic, jc
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ib0, jb0, ic0, jc0
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call psymm(side0, uplo0, mm0, nn0, alpha0, aa, ia0, ja0, desca, &
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_psymm_dreal
# 676 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian matrix with general matrix product
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Symmetric/Hermitian matrix.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  general matrix.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to store result
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descc  Descriptor of cc.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param side "L" for for left, "R" for right (default: "L"),
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "L" C := alpha * A * B + beta*C
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "R" C := alpha * B * A + beta*C
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_phemm_complex(aa, desca, bb, descb, cc, descc, side, uplo, &
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & alpha, beta, mm, nn, ia, ja, ib, jb, ic, jc)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: bb(:,:)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha, beta
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb, ic, jc
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0, beta0
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ib0, jb0, ic0, jc0
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=sp)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=sp)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call phemm(side0, uplo0, mm0, nn0, alpha0, aa, ia0, ja0, desca, &
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_phemm_complex
# 677 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Symmetric/Hermitian matrix with general matrix product
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Symmetric/Hermitian matrix.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param bb  general matrix.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descb  Descriptor of bb.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to store result
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param descc  Descriptor of cc.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param side "L" for for left, "R" for right (default: "L"),
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "L" C := alpha * A * B + beta*C
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!        if "R" C := alpha * B * A + beta*C
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param uplo "U" for for upper, "L" for lower triangle matrix (default: "L").
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_phemm_dcomplex(aa, desca, bb, descb, cc, descc, side, uplo, &
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & alpha, beta, mm, nn, ia, ja, ib, jb, ic, jc)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: bb(:,:)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha, beta
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn, ia, ja, ib, jb, ic, jc
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0, beta0
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ib0, jb0, ic0, jc0
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=dp)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=dp)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call phemm(side0, uplo0, mm0, nn0, alpha0, aa, ia0, ja0, desca, &
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_phemm_dcomplex
# 678 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Matrix matrix product: alpha * A * B + beta * C.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (p?gemm routines)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pgemm_real(aa, desca, bb, descb, cc, descc, alpha, beta, &
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & transa, transb, ia, ja, ib, jb, ic, jc, mm, nn, kk)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Left operand matrix A.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Right operand matrix B.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: bb(:,:)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Added matrix C.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: cc(:,:)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of C.
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor alpha (alpha * A * B). Default: 1.0
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor beta (beta * C). Default: 0.0
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: beta
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether B should be unchanged ("N"), transposed ("T") or transposed
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transb
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of A. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of A. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of B. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of B. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of C. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ic
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of C. Default: 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jc
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows in the submatrix of A and C. Default: desca(M_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of colums in the submatrix of B and C. Default: descb(N_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns/rows in the submatrix A, B. Default: desca(N_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: kk
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, ic0, jc0, mm0, nn0, kk0
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: transa0, transb0
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = descb(N_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transb)) then
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = transb
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = "N"
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pgemm(transa0, transb0, mm0, nn0, kk0, alpha0, aa, ia0, ja0, desca, &
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pgemm_real
# 680 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Matrix matrix product: alpha * A * B + beta * C.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (p?gemm routines)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pgemm_dreal(aa, desca, bb, descb, cc, descc, alpha, beta, &
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & transa, transb, ia, ja, ib, jb, ic, jc, mm, nn, kk)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Left operand matrix A.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Right operand matrix B.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: bb(:,:)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Added matrix C.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: cc(:,:)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of C.
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor alpha (alpha * A * B). Default: 1.0
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor beta (beta * C). Default: 0.0
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: beta
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether B should be unchanged ("N"), transposed ("T") or transposed
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transb
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of A. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of A. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of B. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of B. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of C. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ic
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of C. Default: 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jc
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows in the submatrix of A and C. Default: desca(M_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of colums in the submatrix of B and C. Default: descb(N_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns/rows in the submatrix A, B. Default: desca(N_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: kk
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, ic0, jc0, mm0, nn0, kk0
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: transa0, transb0
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = descb(N_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transb)) then
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = transb
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = "N"
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pgemm(transa0, transb0, mm0, nn0, kk0, alpha0, aa, ia0, ja0, desca, &
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pgemm_dreal
# 681 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Matrix matrix product: alpha * A * B + beta * C.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (p?gemm routines)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pgemm_complex(aa, desca, bb, descb, cc, descc, alpha, beta, &
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & transa, transb, ia, ja, ib, jb, ic, jc, mm, nn, kk)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Left operand matrix A.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Right operand matrix B.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: bb(:,:)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Added matrix C.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of C.
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor alpha (alpha * A * B). Default: 1.0
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor beta (beta * C). Default: 0.0
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: beta
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether B should be unchanged ("N"), transposed ("T") or transposed
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transb
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of A. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of A. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of B. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of B. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of C. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ic
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of C. Default: 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jc
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows in the submatrix of A and C. Default: desca(M_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of colums in the submatrix of B and C. Default: descb(N_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns/rows in the submatrix A, B. Default: desca(N_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: kk
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0, beta0
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, ic0, jc0, mm0, nn0, kk0
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: transa0, transb0
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=sp)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=sp)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = descb(N_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transb)) then
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = transb
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = "N"
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pgemm(transa0, transb0, mm0, nn0, kk0, alpha0, aa, ia0, ja0, desca, &
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pgemm_complex
# 682 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Matrix matrix product: alpha * A * B + beta * C.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (p?gemm routines)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_pgemm_dcomplex(aa, desca, bb, descb, cc, descc, alpha, beta, &
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & transa, transb, ia, ja, ib, jb, ic, jc, mm, nn, kk)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Left operand matrix A.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Right operand matrix B.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: bb(:,:)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Added matrix C.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of C.
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor alpha (alpha * A * B). Default: 1.0
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor beta (beta * C). Default: 0.0
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: beta
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether B should be unchanged ("N"), transposed ("T") or transposed
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transb
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of A. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of A. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of B. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of B. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of submatrix of C. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ic
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of submatrix of C. Default: 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jc
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows in the submatrix of A and C. Default: desca(M_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of colums in the submatrix of B and C. Default: descb(N_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns/rows in the submatrix A, B. Default: desca(N_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: kk
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0, beta0
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, ic0, jc0, mm0, nn0, kk0
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: transa0, transb0
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=dp)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, kind=dp)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = descb(N_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(kk)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = kk
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    kk0 = desca(N_)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transb)) then
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = transb
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transb0 = "N"
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call pgemm(transa0, transb0, mm0, nn0, kk0, alpha0, aa, ia0, ja0, desca, &
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & bb, ib0, jb0, descb, beta0, cc, ic0, jc0, descc)
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_pgemm_dcomplex
# 683 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Computes matrix-matrix product with one triangle matrix
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (routines p?trmm)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptrmm_real(aa, desca, bb, descb, alpha, side, uplo, transa, &
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & diag, ia, ja, ib, jb, mm, nn)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Unit or non-unit lower or upper triangular matrix A
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Second operand (general matrix) B on entry, result on exit.
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor. Default: 1.0
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> From which side is B multiplied by A ("L"/"R"). Default: "L"
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is upper ("U") or lower("L") triangle. Default: "L".
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is unit triangular ("U") or not ("N"). Default: "N".
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: diag
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix A to consider. Default: 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix A to consider. Default: 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix B to consider. Default: 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix B to consider. Default: 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows for matrix A. Default: desca(M_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns for matrix A. Default: desca(N_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(diag)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = diag
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = "N"
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptrmm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptrmm_real
# 685 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Computes matrix-matrix product with one triangle matrix
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (routines p?trmm)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptrmm_dreal(aa, desca, bb, descb, alpha, side, uplo, transa, &
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & diag, ia, ja, ib, jb, mm, nn)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Unit or non-unit lower or upper triangular matrix A
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Second operand (general matrix) B on entry, result on exit.
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor. Default: 1.0
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> From which side is B multiplied by A ("L"/"R"). Default: "L"
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is upper ("U") or lower("L") triangle. Default: "L".
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is unit triangular ("U") or not ("N"). Default: "N".
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: diag
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix A to consider. Default: 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix A to consider. Default: 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix B to consider. Default: 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix B to consider. Default: 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows for matrix A. Default: desca(M_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns for matrix A. Default: desca(N_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(diag)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = diag
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = "N"
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptrmm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptrmm_dreal
# 686 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Computes matrix-matrix product with one triangle matrix
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (routines p?trmm)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptrmm_complex(aa, desca, bb, descb, alpha, side, uplo, transa, &
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & diag, ia, ja, ib, jb, mm, nn)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Unit or non-unit lower or upper triangular matrix A
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Second operand (general matrix) B on entry, result on exit.
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor. Default: 1.0
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> From which side is B multiplied by A ("L"/"R"). Default: "L"
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is upper ("U") or lower("L") triangle. Default: "L".
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is unit triangular ("U") or not ("N"). Default: "N".
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: diag
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix A to consider. Default: 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix A to consider. Default: 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix B to consider. Default: 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix B to consider. Default: 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows for matrix A. Default: desca(M_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns for matrix A. Default: desca(N_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=sp)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(diag)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = diag
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = "N"
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptrmm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptrmm_complex
# 687 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Computes matrix-matrix product with one triangle matrix
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \see PBLAS documentation (routines p?trmm)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !!
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptrmm_dcomplex(aa, desca, bb, descb, alpha, side, uplo, transa, &
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & diag, ia, ja, ib, jb, mm, nn)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Unit or non-unit lower or upper triangular matrix A
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of A.
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Second operand (general matrix) B on entry, result on exit.
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Descriptor of B.
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descb(DLEN_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Prefactor. Default: 1.0
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> From which side is B multiplied by A ("L"/"R"). Default: "L"
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: side
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is upper ("U") or lower("L") triangle. Default: "L".
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: uplo
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A should be unchanged ("N"), transposed ("T") or transposed
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !! conjugated ("C"). Default: "N".
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: transa
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Whether A is unit triangular ("U") or not ("N"). Default: "N".
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character, intent(in), optional :: diag
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix A to consider. Default: 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix A to consider. Default: 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ja
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First row of matrix B to consider. Default: 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ib
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> First column of matrix B to consider. Default: 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: jb
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of rows for matrix A. Default: desca(M_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !> Number of columns for matrix A. Default: desca(N_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: nn
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: ia0, ja0, ib0, jb0, mm0, nn0
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    character :: side0, uplo0, transa0, diag0
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, kind=dp)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(side)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = side
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    side0 = "L"
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(uplo)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = uplo
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    uplo0 = "L"
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(transa)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = transa
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    transa0 = "N"
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(diag)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = diag
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    diag0 = "N"
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ib)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = ib
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ib0 = 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jb)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = jb
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jb0 = 1
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptrmm(side0, uplo0, transa0, diag0, mm0, nn0, alpha0, aa, ia0, ja0, &
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & desca, bb, ib0, jb0, descb)
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptrmm_dcomplex
# 688 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"



# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Real matrix transpose. cc = alpha * cc + beta * aa^dag
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptran_real(aa, desca, cc, descc, alpha, beta,&
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(inout) :: cc(:,:)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp), intent(in), optional :: alpha, beta
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(sp) :: alpha0, beta0
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=sp)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=sp)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptran(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptran_real
# 690 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Real matrix transpose. cc = alpha * cc + beta * aa^dag
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptran_dreal(aa, desca, cc, descc, alpha, beta,&
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(inout) :: cc(:,:)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp), intent(in), optional :: alpha, beta
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    real(dp) :: alpha0, beta0
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = real(1, kind=dp)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = real(0, kind=dp)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptran(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptran_dreal
# 691 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Complex matrix transpose.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptranu_complex(aa, desca, cc, descc, alpha, beta,&
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha, beta
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0, beta0
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, 0, kind=sp)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, 0, kind=sp)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptranu(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptranu_complex
# 692 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Complex matrix transpose.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptranu_dcomplex(aa, desca, cc, descc, alpha, beta,&
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha, beta
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0, beta0
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, 0, kind=dp)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, 0, kind=dp)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptranu(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptranu_dcomplex
# 693 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Complex matrix hermitian transpose.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptranc_complex(aa, desca, cc, descc, alpha, beta,&
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(inout) :: cc(:,:)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp), intent(in), optional :: alpha, beta
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(sp) :: alpha0, beta0
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, 0, kind=sp)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, 0, kind=sp)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptranc(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptranc_complex
# 694 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !> Complex matrix hermitian transpose.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param aa  Matrix to update with.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desca  Descriptor of aa.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param cc  Matrix to be updated.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param desccc Descriptor of cc.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param alpha  Prefactor.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  !! \param beta  Prefactor.
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  subroutine pblasfx_ptranc_dcomplex(aa, desca, cc, descc, alpha, beta,&
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
      & mm, nn, ia, ja, ic, jc)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: desca(DLEN_)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(inout) :: cc(:,:)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in) :: descc(DLEN_)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp), intent(in), optional :: alpha, beta
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: mm, nn
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer, intent(in), optional :: ia, ja, ic, jc
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    complex(dp) :: alpha0, beta0
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    integer :: mm0, nn0, ia0, ja0, ic0, jc0
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(alpha)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = alpha
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    alpha0 = cmplx(1, 0, kind=dp)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(beta)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = beta
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    beta0 = cmplx(0, 0, kind=dp)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(mm)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = mm
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    mm0 = desca(M_)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(nn)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = nn
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    nn0 = desca(N_)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ia)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = ia
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ia0 = 1
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ja)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = ja
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ja0 = 1
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(ic)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = ic
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    ic0 = 1
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  if (present(jc)) then
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = jc
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  else
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    jc0 = 1
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end if
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
    call ptranc(mm0, nn0, alpha0, aa, ia0, ja0, desca, beta0,&
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
        & cc, ic0, jc0, descc)
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"

# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"
  end subroutine pblasfx_ptranc_dcomplex
# 695 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/pblasfx.fpp"


end module pblasfx_module
