!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!


module dftbp_transport_negfvars
  use dftbp_common_accuracy, only : dp, lc, mc
  use dftbp_type_wrappedintr, only : TWrappedInt1
  implicit none

  private
  public :: ContactInfo
  public :: TTransPar


  !Structure for contact information in a transport calculation
  type ContactInfo

    ! Beginning (1) and end (2) of contact in atoms (?)
    integer :: idxrange(2)

    !> Contact name
    !> Note: a contact id is specifically defined because, with multiple definition of contacts in
    !> the input file, relying on contact ordering to assign an integer can be inconsistent
    character(mc) :: name

    !> Accuracy of rigid layer shift
    real(dp) :: shiftAccuracy = 0.0_dp

    integer :: dir = 0

    real(dp) :: length = 0.0_dp

    !> contact vector
    real(dp) :: lattice(3)

    real(dp) :: potential = 0.0_dp

    !> for colinear spin we may need two Fermi levels (up and down)
    real(dp) :: eFermi(2) = [0.0_dp, 0.0_dp]

    !> has the fermi level been set for this contact
    logical :: tFermiSet = .false.

    !> contact temperature
    real(dp) :: kbT = 0.0_dp

    ! Is it a contact in the wide band approximation?
    logical :: wideBand = .false.

    real(dp) :: wideBandDos = 0.0_dp

    logical :: tWriteSelfEnergy = .false.
    logical :: tReadSelfEnergy = .false.
    logical :: tWriteSurfaceGF = .false.
    logical :: tReadSurfaceGF = .false.

  end type ContactInfo



  !> Options from Transport section (geometry and task)
  type TTransPar

    !> True if the corresponding input block exists
    logical :: defined = .false.

    !> Contacts in the system
    type(ContactInfo), allocatable :: contacts(:)

    !> Number of contacts
    integer :: nCont = 0

    !> Start and end index of device region
    integer :: idxdevice(2)

    !> Number of principal layers
    integer :: nPLs = 1

    !> PL indices (starting atom)
    integer, allocatable, dimension(:) :: PL

    !> False: run the full open boundary calculation / True: upload contact phase
    logical :: taskUpload = .false.

    !> Should contacts be written in binary format
    logical :: tWriteBinShift = .false.

    !> Should contacts be read in binary format
    logical :: tReadBinShift = .false.

    !> Index of contact for contact hamiltonian task, if any
    integer :: taskContInd = 0

    !> Not from input file
    logical :: tPeriodic1D = .false.

    !> type of phonon modes (Longitudinal, transverse)
    integer :: typeModes

    !> Tolerance for contact vectors being distorted
    real(dp) :: contactLayerTol

    !DAR begin - type TTransPar new items
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    logical :: tNoGeometry = .false.
    logical :: tWriteDFTB = .false.
    logical :: tReadDFTB = .false.
    logical :: tOrthonormal = .false.
    logical :: tOrthonormalDevice = .false.
    logical :: tModel = .false.
    logical :: tRead_negf_in = .false.
    integer :: NumStates = 0
    integer, allocatable :: cblk(:)
    character(lc) :: FileName
    logical :: tManyBody =.false.
    logical :: tElastic =.true.
    logical :: tDephasingVE = .false.
    logical :: tDephasingBP = .false.
    logical :: tZeroCurrent = .false.
    integer :: MaxIter = 1000
    logical :: tWriteDOS = .false.
    logical :: tWrite_ldos = .false.
    logical :: tWrite_negf_params = .false.
    logical :: tDOSwithS =.true.
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !DAR end

  end type TTransPar


end module dftbp_transport_negfvars
