# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp" 1
# 118 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/scalapackfx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

!> Contains wrapper for the BLACS library
module blacsfx_module
  use scalapackfx_common_module
  use blacsgrid_module
  use blacs_module
  implicit none
  private

  ! Public names.
  public :: DLEN_, DT_, CTXT_, M_, N_, MB_, NB_, RSRC_, CSRC_, LLD_
  public :: blacsgrid
  public :: blacsfx_gebs, blacsfx_gebr
  public :: blacsfx_gesd, blacsfx_gerv
  public :: blacsfx_gsum
  public :: blacsfx_gemr2d
  public :: blacsfx_barrier
  public :: blacsfx_pinfo, blacsfx_pcoord, blacsfx_pnum, blacsfx_exit


  interface blacsfx_gebs
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_i0
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_s0
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_d0
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_c0
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_z0
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_i1
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_s1
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_d1
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_c1
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_z1
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 26 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_i2
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_s2
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_d2
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_c2
# 27 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 28 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebs_z2
# 30 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 31 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gebs

  interface blacsfx_gebr
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_i0
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_s0
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_d0
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_c0
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_z0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_i1
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_s1
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_d1
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_c1
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_z1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 35 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_i2
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_s2
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_d2
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_c2
# 36 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 37 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gebr_z2
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 40 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gebr

  interface blacsfx_gesd
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_i0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_s0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_d0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_c0
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_z0
# 48 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_i1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_s1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_d1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_c1
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_z1
# 48 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_i2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_s2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_d2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_c2
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 46 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gesd_z2
# 48 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 49 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gesd

  interface blacsfx_gerv
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_i0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_s0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_d0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_c0
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_z0
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_i1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_s1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_d1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_c1
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_z1
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_i2
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_s2
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_d2
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_c2
# 54 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gerv_z2
# 57 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 58 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gerv

  interface blacsfx_gsum
# 62 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_i0
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_s0
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_d0
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_c0
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_z0
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 62 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_i1
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_s1
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_d1
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_c1
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_z1
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 62 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_i2
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_s2
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_d2
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_c2
# 63 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 64 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gsum_z2
# 66 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 67 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gsum

  interface blacsfx_gemr2d
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 72 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gemr2d_i
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 72 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gemr2d_s
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 72 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gemr2d_d
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 72 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gemr2d_c
# 71 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 72 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        module procedure blacsfx_gemr2d_z
# 74 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end interface blacsfx_gemr2d

contains

# 81 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 103 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 152 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 156 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 213 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 239 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"



# 245 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 267 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 291 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 315 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"



# 321 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 346 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 369 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 392 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"



# 398 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 431 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 457 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 484 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (integer, rank 0).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_i0(mygrid, aa, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), target :: aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: buffer(1,1)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_i0
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (integer, rank 0).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_i0(mygrid, aa, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out), target :: aa
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_i0
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (integer, rank 0).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_i0(mygrid, aa, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), target :: aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: buffer(1,1)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_i0
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (integer, rank 2).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_i0(mygrid, aa, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out),target :: aa
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_i0
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(integer, rank 0).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Scalar to sum up.
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_i0(mygrid, aa, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(inout) :: aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: buffer(1,1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1, 1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_i0
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(sp), rank 0).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_s0(mygrid, aa, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in), target :: aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp) :: buffer(1,1)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_s0
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(sp), rank 0).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_s0(mygrid, aa, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out), target :: aa
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp) :: buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_s0
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(sp), rank 0).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_s0(mygrid, aa, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in), target :: aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp) :: buffer(1,1)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_s0
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(sp), rank 2).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_s0(mygrid, aa, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out),target :: aa
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp) :: buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_s0
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(real(sp), rank 0).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Scalar to sum up.
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_s0(mygrid, aa, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(inout) :: aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp) :: buffer(1,1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1, 1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_s0
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(dp), rank 0).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_d0(mygrid, aa, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in), target :: aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp) :: buffer(1,1)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_d0
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(dp), rank 0).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_d0(mygrid, aa, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out), target :: aa
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp) :: buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_d0
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(dp), rank 0).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_d0(mygrid, aa, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in), target :: aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp) :: buffer(1,1)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_d0
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(dp), rank 2).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_d0(mygrid, aa, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out),target :: aa
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp) :: buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_d0
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(real(dp), rank 0).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Scalar to sum up.
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_d0(mygrid, aa, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(inout) :: aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp) :: buffer(1,1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1, 1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_d0
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(sp), rank 0).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_c0(mygrid, aa, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in), target :: aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp) :: buffer(1,1)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_c0
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(sp), rank 0).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_c0(mygrid, aa, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out), target :: aa
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp) :: buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_c0
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(sp), rank 0).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_c0(mygrid, aa, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in), target :: aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp) :: buffer(1,1)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_c0
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(sp), rank 2).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_c0(mygrid, aa, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out),target :: aa
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp) :: buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_c0
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(complex(sp), rank 0).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Scalar to sum up.
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_c0(mygrid, aa, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(inout) :: aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp) :: buffer(1,1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1, 1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_c0
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(dp), rank 0).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_z0(mygrid, aa, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in), target :: aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp) :: buffer(1,1)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_z0
# 491 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(dp), rank 0).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_z0(mygrid, aa, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out), target :: aa
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp) :: buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_z0
# 492 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(dp), rank 0).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_z0(mygrid, aa, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in), target :: aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp) :: buffer(1,1)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_z0
# 493 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(dp), rank 2).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_z0(mygrid, aa, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out),target :: aa
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp) :: buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1,1)
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_z0
# 494 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(complex(dp), rank 0).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Scalar to sum up.
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_z0(mygrid, aa, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(inout) :: aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp) :: buffer(1,1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1,1) = aa
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    aa = buffer(1, 1)
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_z0
# 495 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 510 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (integer, rank 1).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_i1(mygrid, aa, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), target :: aa(:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, pointer :: buffer(:,:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_i1
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (integer, rank 1).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_i1(mygrid, aa, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out), target :: aa(:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, pointer :: buffer(:,:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_i1
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (integer, rank 1).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_i1(mygrid, aa, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), target :: aa(:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, pointer :: buffer(:,:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_i1
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (integer, rank 2).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_i1(mygrid, aa, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out),target :: aa(:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, pointer :: buffer(:,:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_i1
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(i1, rank 1).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Vector to sum up.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_i1(mygrid, aa, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(inout), target :: aa(:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, pointer :: buffer(:,:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_i1
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(sp), rank 1).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_s1(mygrid, aa, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in), target :: aa(:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), pointer :: buffer(:,:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_s1
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(sp), rank 1).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_s1(mygrid, aa, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out), target :: aa(:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), pointer :: buffer(:,:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_s1
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(sp), rank 1).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_s1(mygrid, aa, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in), target :: aa(:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), pointer :: buffer(:,:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_s1
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(sp), rank 2).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_s1(mygrid, aa, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out),target :: aa(:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), pointer :: buffer(:,:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_s1
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(s1, rank 1).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Vector to sum up.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_s1(mygrid, aa, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(inout), target :: aa(:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), pointer :: buffer(:,:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_s1
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(dp), rank 1).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_d1(mygrid, aa, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in), target :: aa(:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), pointer :: buffer(:,:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_d1
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(dp), rank 1).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_d1(mygrid, aa, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out), target :: aa(:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), pointer :: buffer(:,:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_d1
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(dp), rank 1).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_d1(mygrid, aa, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in), target :: aa(:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), pointer :: buffer(:,:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_d1
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(dp), rank 2).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_d1(mygrid, aa, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out),target :: aa(:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), pointer :: buffer(:,:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_d1
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(d1, rank 1).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Vector to sum up.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_d1(mygrid, aa, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(inout), target :: aa(:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), pointer :: buffer(:,:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_d1
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(sp), rank 1).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_c1(mygrid, aa, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in), target :: aa(:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), pointer :: buffer(:,:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_c1
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(sp), rank 1).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_c1(mygrid, aa, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out), target :: aa(:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), pointer :: buffer(:,:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_c1
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(sp), rank 1).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_c1(mygrid, aa, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in), target :: aa(:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), pointer :: buffer(:,:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_c1
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(sp), rank 2).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_c1(mygrid, aa, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out),target :: aa(:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), pointer :: buffer(:,:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_c1
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(c1, rank 1).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Vector to sum up.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_c1(mygrid, aa, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(inout), target :: aa(:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), pointer :: buffer(:,:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_c1
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(dp), rank 1).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_z1(mygrid, aa, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in), target :: aa(:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), pointer :: buffer(:,:)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebs(mygrid, buffer, scope, top)
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_z1
# 497 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(dp), rank 1).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_z1(mygrid, aa, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out), target :: aa(:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), pointer :: buffer(:,:)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gebr(mygrid, buffer, scope, top, rsrc, csrc)
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_z1
# 498 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(dp), rank 1).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_z1(mygrid, aa, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in), target :: aa(:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), pointer :: buffer(:,:)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gesd(mygrid, buffer, rdest, cdest)
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_z1
# 499 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(dp), rank 2).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_z1(mygrid, aa, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out),target :: aa(:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), pointer :: buffer(:,:)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gerv(mygrid, buffer, rsrc, csrc)
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_z1
# 500 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(z1, rank 1).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Vector to sum up.
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination (default: row of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination (default: column of lead process).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_z1(mygrid, aa, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(inout), target :: aa(:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), pointer :: buffer(:,:)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    buffer(1:size(aa), 1:1) => aa(1:size(aa))
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call blacsfx_gsum(mygrid, buffer, scope, top, rdest, cdest)
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_z1
# 501 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 510 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 487 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (integer, rank 2).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_i2(mygrid, aa, scope, top)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: aa(:,:)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = 'A'
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebs2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        & aa, size(aa, dim=1))
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_i2
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (integer, rank 2).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_i2(mygrid, aa, scope, top, rsrc, csrc)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out) :: aa(:,:)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebr2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rsrc0, csrc0)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_i2
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (integer, rank 2).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_i2(mygrid, aa, rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: aa(:,:)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gesd2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa,&
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_i2
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (integer, rank 2).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_i2(mygrid, aa, rsrc, csrc)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(out) :: aa(:,:)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gerv2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa, &
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rsrc0, csrc0)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_i2
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(i2, rank 2).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to sum up.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest Row of the destination (default: row of lead process, if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest Column of the destination (default: column of lead
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! process, if rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_i2(mygrid, aa, scope, top, rdest, cdest)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(inout) :: aa(:,:)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rdest0, cdest0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = rdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = mygrid%leadrow
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(cdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = mygrid%leadcol
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gsum2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rdest0, cdest0)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_i2
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(sp), rank 2).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_s2(mygrid, aa, scope, top)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = 'A'
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebs2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        & aa, size(aa, dim=1))
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_s2
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(sp), rank 2).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_s2(mygrid, aa, scope, top, rsrc, csrc)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out) :: aa(:,:)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebr2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rsrc0, csrc0)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_s2
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(sp), rank 2).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_s2(mygrid, aa, rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gesd2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa,&
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_s2
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(sp), rank 2).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_s2(mygrid, aa, rsrc, csrc)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(out) :: aa(:,:)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gerv2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa, &
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rsrc0, csrc0)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_s2
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(s2, rank 2).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to sum up.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest Row of the destination (default: row of lead process, if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest Column of the destination (default: column of lead
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! process, if rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_s2(mygrid, aa, scope, top, rdest, cdest)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(inout) :: aa(:,:)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rdest0, cdest0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = rdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = mygrid%leadrow
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(cdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = mygrid%leadcol
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gsum2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rdest0, cdest0)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_s2
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (real(dp), rank 2).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_d2(mygrid, aa, scope, top)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = 'A'
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebs2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        & aa, size(aa, dim=1))
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_d2
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (real(dp), rank 2).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_d2(mygrid, aa, scope, top, rsrc, csrc)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out) :: aa(:,:)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebr2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rsrc0, csrc0)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_d2
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (real(dp), rank 2).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_d2(mygrid, aa, rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gesd2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa,&
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_d2
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (real(dp), rank 2).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_d2(mygrid, aa, rsrc, csrc)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(out) :: aa(:,:)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gerv2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa, &
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rsrc0, csrc0)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_d2
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(d2, rank 2).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to sum up.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest Row of the destination (default: row of lead process, if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest Column of the destination (default: column of lead
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! process, if rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_d2(mygrid, aa, scope, top, rdest, cdest)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(inout) :: aa(:,:)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rdest0, cdest0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = rdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = mygrid%leadrow
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(cdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = mygrid%leadcol
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gsum2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rdest0, cdest0)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_d2
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(sp), rank 2).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_c2(mygrid, aa, scope, top)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = 'A'
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebs2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        & aa, size(aa, dim=1))
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_c2
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(sp), rank 2).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_c2(mygrid, aa, scope, top, rsrc, csrc)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out) :: aa(:,:)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebr2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rsrc0, csrc0)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_c2
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(sp), rank 2).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_c2(mygrid, aa, rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gesd2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa,&
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_c2
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(sp), rank 2).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_c2(mygrid, aa, rsrc, csrc)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(out) :: aa(:,:)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gerv2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa, &
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rsrc0, csrc0)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_c2
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(c2, rank 2).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to sum up.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest Row of the destination (default: row of lead process, if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest Column of the destination (default: column of lead
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! process, if rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_c2(mygrid, aa, scope, top, rdest, cdest)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(inout) :: aa(:,:)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rdest0, cdest0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = rdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = mygrid%leadrow
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(cdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = mygrid%leadcol
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gsum2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rdest0, cdest0)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_c2
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 488 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 489 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 490 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Starts broadcast (complex(dp), rank 2).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to broadcast.
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default " ").
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebs2d).
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebs_z2(mygrid, aa, scope, top)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = 'A'
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebs2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
        & aa, size(aa, dim=1))
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebs_z2
# 503 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives broadcast (complex(dp), rank 2).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to receive.
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rsrc  Row of the source (default: row of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param csrc  Column of the source (default: column of lead process).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gebr2d).
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gebr_z2(mygrid, aa, scope, top, rsrc, csrc)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out) :: aa(:,:)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gebr2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rsrc0, csrc0)
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gebr_z2
# 504 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Sends general rectangular matrix to destination process
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! (complex(dp), rank 2).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to send.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces.
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gesd2d).
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gesd_z2(mygrid, aa, rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: rdest, cdest
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gesd2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa,&
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rdest, cdest)
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gesd_z2
# 505 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Receives general rectangular matrix from source process (complex(dp), rank 2).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Object to receive.
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest  Row of the destination process (default: lead row).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest  Column of the destination proces (default: lead col).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gerv2d).
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gerv_z2(mygrid, aa, rsrc, csrc)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    type(blacsgrid), intent(in) :: mygrid
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(out) :: aa(:,:)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rsrc, csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rsrc0, csrc0
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rsrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = rsrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rsrc0 = mygrid%leadrow
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(csrc)) then
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = csrc
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    csrc0 = mygrid%leadcol
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gerv2d(mygrid%ctxt, size(aa, dim=1), size(aa, dim=2), aa, &
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & size(aa, dim=1), rsrc0, csrc0)
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gerv_z2
# 506 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Performs element-wise summation(z2, rank 2).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mygrid  BLACS descriptor.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa  Matrix to sum up.
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param scope  Scope of the broadcast (default: "A").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param top  Topology of the broadcast (default: " ").
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param rdest Row of the destination (default: row of lead process, if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param cdest Column of the destination (default: column of lead
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! process, if rdest or cdest = -1, all in-scope procs receive result).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine ?gsum2d).
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gsum_z2(mygrid, aa, scope, top, rdest, cdest)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    class(blacsgrid), intent(in) :: mygrid
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(inout) :: aa(:,:)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character, intent(in), optional :: scope, top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in), optional :: rdest, cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    character :: scope0, top0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer :: rdest0, cdest0
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(scope)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(top)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = top
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    top0 = " "
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(rdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = rdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    rdest0 = mygrid%leadrow
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  if (present(cdest)) then
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = cdest
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    cdest0 = mygrid%leadcol
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gsum2d(mygrid%ctxt, scope0, top0, size(aa, dim=1), size(aa, dim=2),&
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
      & aa, size(aa, dim=1), rdest0, cdest0)
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gsum_z2
# 507 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 509 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 510 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 511 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Matrix copy/redistribution
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 545 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 547 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 548 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Copies/redistributes matrix (integer).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of rows of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of columns of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa distributed matrix AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ia first row of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ja first column of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descA BLACS descriptor for source matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param bb distributed matrix BB into which data is copied.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ib first row of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param jb first column of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descB BLACS descriptor for destination matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ictxt Context for for union of all processes holding A or B
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine p?gemr2d).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gemr2d_i(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descA(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descB(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: aa(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(inout) :: bb(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: mm, nn, ia, ja, ib, jb, ictxt
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    ! AA and BB should be references to starting corner of matrices
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gemr2d_i
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 547 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 548 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Copies/redistributes matrix (real(sp)).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of rows of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of columns of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa distributed matrix AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ia first row of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ja first column of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descA BLACS descriptor for source matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param bb distributed matrix BB into which data is copied.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ib first row of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param jb first column of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descB BLACS descriptor for destination matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ictxt Context for for union of all processes holding A or B
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine p?gemr2d).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gemr2d_s(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descA(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descB(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(in) :: aa(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(sp), intent(inout) :: bb(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: mm, nn, ia, ja, ib, jb, ictxt
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    ! AA and BB should be references to starting corner of matrices
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gemr2d_s
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 547 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 548 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Copies/redistributes matrix (real(dp)).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of rows of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of columns of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa distributed matrix AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ia first row of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ja first column of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descA BLACS descriptor for source matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param bb distributed matrix BB into which data is copied.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ib first row of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param jb first column of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descB BLACS descriptor for destination matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ictxt Context for for union of all processes holding A or B
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine p?gemr2d).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gemr2d_d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descA(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descB(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(in) :: aa(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    real(dp), intent(inout) :: bb(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: mm, nn, ia, ja, ib, jb, ictxt
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    ! AA and BB should be references to starting corner of matrices
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gemr2d_d
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 547 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 548 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Copies/redistributes matrix (complex(sp)).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of rows of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of columns of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa distributed matrix AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ia first row of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ja first column of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descA BLACS descriptor for source matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param bb distributed matrix BB into which data is copied.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ib first row of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param jb first column of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descB BLACS descriptor for destination matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ictxt Context for for union of all processes holding A or B
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine p?gemr2d).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gemr2d_c(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descA(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descB(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(in) :: aa(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(sp), intent(inout) :: bb(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: mm, nn, ia, ja, ib, jb, ictxt
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    ! AA and BB should be references to starting corner of matrices
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gemr2d_c
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 547 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 548 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !> Copies/redistributes matrix (complex(dp)).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of rows of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param mm number of columns of AA to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param aa distributed matrix AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ia first row of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ja first column of AA from which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descA BLACS descriptor for source matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param bb distributed matrix BB into which data is copied.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ib first row of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param jb first column of BB at which to copy.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param descB BLACS descriptor for destination matrix.
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \param ictxt Context for for union of all processes holding A or B
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  !! \see BLACS documentation (routine p?gemr2d).
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  subroutine blacsfx_gemr2d_z(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descA(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: descB(DLEN_)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(in) :: aa(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    complex(dp), intent(inout) :: bb(:,:)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    integer, intent(in) :: mm, nn, ia, ja, ib, jb, ictxt
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    ! AA and BB should be references to starting corner of matrices
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    call gemr2d(mm, nn, aa, ia, ja, descA, bb, ib, jb, descB, ictxt)
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end subroutine blacsfx_gemr2d_z
# 549 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"

# 551 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Barrier
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Holds up execution of all processes within given scope.
  !!
  !! \param self  BLACS group descriptor
  !! \param scope  Scope of the barrier (default: "A")
  !!
  subroutine blacsfx_barrier(mygrid, scope)
    type(blacsgrid), intent(in) :: mygrid
    character, intent(in), optional :: scope

    character :: scope0

  if (present(scope)) then
# 568 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = scope
# 568 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 568 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    scope0 = "A"
# 568 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
    call blacs_barrier(mygrid%ctxt, scope0)

  end subroutine blacsfx_barrier

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Grid information
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Delivers process information.
  !!
  !! \param iproc  Id of the process (0 <= iproc < nproc)
  !! \param nproc  Nr. of processes.
  !!
  subroutine blacsfx_pinfo(iproc, nproc)
    integer, intent(out) :: iproc, nproc

    call blacs_pinfo(iproc, nproc)

  end subroutine blacsfx_pinfo


  !> Delivers row and column of a given process in a grid.
  !!
  !! \param mygrid  BLACS grid.
  !! \param iproc  Process of which position should be determined.
  !! \param prow  Row of the process.
  !! \param pcol  Column of the process.
  !!
  subroutine blacsfx_pcoord(mygrid, iproc, prow, pcol)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: iproc
    integer, intent(out) :: prow, pcol

    call blacs_pcoord(mygrid%ctxt, iproc, prow, pcol)

  end subroutine blacsfx_pcoord


  !> Delivers process number for a given process in the grid.
  !!
  !! \param mygrid BLACS grid.
  !! \param prow  Row of the process.
  !! \param pcol  Column of the process.
  !! \return  Process number (id) of the process with the given coordinates.
  !!
  function blacsfx_pnum(mygrid, prow, pcol) result(pnum)
    type(blacsgrid), intent(in) :: mygrid
    integer, intent(in) :: prow, pcol
    integer :: pnum

    pnum = blacs_pnum(mygrid%ctxt, prow, pcol)

  end function blacsfx_pnum

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! Stop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  !> Stops BLACS communication.
  !!
  !! \param keepmpi If set to yes, the MPI framework will kept alive after
  !!     BLACS is switched off (default: .false.)
  !!
  subroutine blacsfx_exit(keepmpi)
    logical, intent(in), optional :: keepmpi

    logical :: keepmpi0

  if (present(keepmpi)) then
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    keepmpi0 = keepmpi
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  else
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
    keepmpi0 = .false.
# 637 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/scalapackfx/origin/lib/blacsfx.fpp"
  end if
    if (keepmpi0) then
      call blacs_exit(1)
    else
      call blacs_exit(0)
    end if

  end subroutine blacsfx_exit


end module blacsfx_module
