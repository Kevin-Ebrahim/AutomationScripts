# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
!--------------------------------------------------------------------------------------------------!
!  DFTB+: general package for performing fast atomistic simulations                                !
!  Copyright (C) 2006 - 2025  DFTB+ developers group                                               !
!                                                                                                  !
!  See the LICENSE file for terms of usage and distribution.                                       !
!--------------------------------------------------------------------------------------------------!

# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp" 1
# 7 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 151 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/include/common.fypp"
# 9 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90" 2

# 11 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 12 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"


!> Exporting the functionality from the plumed library
module dftbp_extlibs_plumed
  use, intrinsic :: iso_c_binding, only : c_char, c_int, c_loc, c_ptr
  use dftbp_common_accuracy, only : dp
  use dftbp_io_message, only : error
  implicit none
  private


  public :: TPlumedCalc, TPlumedCalc_init, TPlumedCalc_final
  public :: withPlumed


  type, bind(c) :: c_plumed
    type(c_ptr) :: cptr
  end type c_plumed


  type :: TPlumedCalc
    private
    type(c_plumed) :: desc
  contains
    private
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValInt0
        generic, public :: sendCmdVal => sendCmdValInt0
        procedure :: sendCmdPtrInt0
        generic, public :: sendCmdPtr => sendCmdPtrInt0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValInt1
        generic, public :: sendCmdVal => sendCmdValInt1
        procedure :: sendCmdPtrInt1
        generic, public :: sendCmdPtr => sendCmdPtrInt1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValInt2
        generic, public :: sendCmdVal => sendCmdValInt2
        procedure :: sendCmdPtrInt2
        generic, public :: sendCmdPtr => sendCmdPtrInt2
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 38 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValReal0
        generic, public :: sendCmdVal => sendCmdValReal0
        procedure :: sendCmdPtrReal0
        generic, public :: sendCmdPtr => sendCmdPtrReal0
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValReal1
        generic, public :: sendCmdVal => sendCmdValReal1
        procedure :: sendCmdPtrReal1
        generic, public :: sendCmdPtr => sendCmdPtrReal1
# 39 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
        procedure :: sendCmdValReal2
        generic, public :: sendCmdVal => sendCmdValReal2
        procedure :: sendCmdPtrReal2
        generic, public :: sendCmdPtr => sendCmdPtrReal2
# 44 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 45 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
    procedure :: sendCmdValChar
    generic, public :: sendCmdVal => sendCmdValChar
  end type TPlumedCalc


  ! Explicit interfaces for the C-API provided by PLUMED
  interface

    function plumed_create() result(instance) bind(C, name='plumed_create')
      import :: c_plumed
      type(c_plumed) :: instance
    end function plumed_create

    subroutine plumed_cmd(instance, key, val) bind(C, name='plumed_cmd')
      import :: c_plumed, c_char, c_ptr
      type(c_plumed), value :: instance
      character(kind=c_char), intent(in) :: key(*)
      type(c_ptr), value :: val
    end subroutine plumed_cmd

    subroutine plumed_finalize(instance) bind(C, name='plumed_finalize')
      import :: c_plumed
      type(c_plumed), value :: instance
    end subroutine plumed_finalize

    function plumed_installed(instance) result(installed) bind(C, name='plumed_installed')
      import :: c_plumed, c_int
      type(c_plumed), value :: instance
      integer(c_int) :: installed
    end function plumed_installed

  end interface


  !> Whether package was build with PLUMED support
  logical, parameter :: withPlumed = .false.


contains

  !> Initializes plumed.
  !>
  subroutine TPlumedCalc_init(this)
    type(TPlumedCalc), intent(out) :: this

# 93 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
      call stubError("TPlumedCalc_init")
# 95 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

  end subroutine TPlumedCalc_init


  !> Destroys the PLUMED instance.
  subroutine TPlumedCalc_final(this)
    type(TPlumedCalc), intent(inout) :: this

# 106 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
      call stubError("TPlumedCalc_final")
# 108 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

  end subroutine TPlumedCalc_final


# 113 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValInt0(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        integer, target, intent(in)  :: val

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValInt0")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValInt0

# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValInt1(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        integer, target, intent(in) , contiguous :: val(:)

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValInt1")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValInt1

# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValInt2(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        integer, target, intent(in) , contiguous :: val(:,:)

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValInt2")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValInt2

# 142 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 113 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValReal0(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        real(dp), target, intent(in)  :: val

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValReal0")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValReal0

# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValReal1(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        real(dp), target, intent(in) , contiguous :: val(:)

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValReal1")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValReal1

# 114 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 115 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a value to a PLUMED instance.
      !>
      !> NOTE: This wrapper should only be used to pass values to PLUMED which are
      !> are immediately COPIED in PLUMED before returning, as the argument may contain
      !> temporary expression
      !>
      subroutine sendCmdValReal2(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character).
        character(len=*, kind=c_char), intent(in) :: key

        !> Value to pass.
        real(dp), target, intent(in) , contiguous :: val(:,:)

# 136 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdValReal2")
# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdValReal2

# 142 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 143 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"


  !> Wrapper for passing a value to a PLUMED instance (character version).
  !>
  !> NOTE: This wrapper should only be used to pass values to PLUMED which are
  !> are immediately COPIED in PLUMED before returning, as the argument may contain
  !> temporary expression.
  !>
  subroutine sendCmdValChar(this, key, val)

    !> Instance
    class(TPlumedCalc), intent(inout) :: this

    !> Key (will be automatically extended with the necessary termination character)
    character(len=*, kind=c_char), intent(in) :: key

    !> Value to pass (will be automatically extended with the necessary termination character)
    character(len=*, kind=c_char), intent(in) :: val

# 165 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

# 170 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
      call stubError("sendCmdValChar")
# 172 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

  end subroutine sendCmdValChar


# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrInt0(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        integer, target, intent(in)  :: val

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrInt0")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrInt0

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrInt1(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        integer, target, intent(in) , contiguous :: val(:)

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrInt1")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrInt1

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrInt2(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        integer, target, intent(in) , contiguous :: val(:,:)

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrInt2")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrInt2

# 206 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 177 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrReal0(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        real(dp), target, intent(in)  :: val

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrReal0")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrReal0

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrReal1(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        real(dp), target, intent(in) , contiguous :: val(:)

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrReal1")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrReal1

# 178 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      !> Wrapper for passing a reference to a PLUMED instance.
      !>
      !> NOTE: This wrapper passes the address of the value object. Make sure, the object
      !> exists long enough, that PLUMED can access and eventually modify it when necessary.
      !>
      subroutine sendCmdPtrReal2(this, key, val)

        !> Instance
        class(TPlumedCalc), intent(inout) :: this

        !> Key (will be automatically extended with the necessary termination character)
        character(len=*, kind=c_char), intent(in) :: key

        !> Object which should be passed as a reference.
        !> Contains workaround for bug in Intel 19 compiler (pointer => target)
        real(dp), target, intent(in) , contiguous :: val(:,:)

# 200 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
          call stubError("sendCmdPtrReal2")
# 202 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

      end subroutine sendCmdPtrReal2

# 206 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"
# 207 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"


# 210 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"

    !> Raises an error signalizing the call of a stub-function.
    subroutine stubError(name)

      !> Name of the stub function which was called.
      character(*), intent(in) :: name

      call error("Internal error: Function '" // name // "' called but code was compiled without&
          & PLUMED support")

    end subroutine stubError

# 223 "/home/witsa/AutomationScripts/dftbplus/dftbplus/src/dftbp/extlibs/plumed.F90"


end module dftbp_extlibs_plumed
