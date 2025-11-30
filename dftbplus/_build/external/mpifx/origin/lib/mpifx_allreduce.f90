# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

!> Contains wrapper for \c MPI_ALLREDUCE.
module mpifx_allreduce_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_allreduce, mpifx_allreduceip

  !> Reduces a scalar/array on all nodes.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second and third arguments. The second and third
  !! arguments can be of type integer (i), real (s), double precision (d),
  !! complex (c), double complex (z) and logical (l). Their rank can vary from
  !! zero (scalars) up to the maximum rank. Both arguments must be of same
  !! type and rank.
  !!
  !! \see MPI documentation (\c MPI_ALLREDUCE)
  !!
  !! Example:
  !!
  !!     program test_allreduce
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       integer, parameter :: dp = kind(1.0d0)
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       real(dp) :: valr(3), resvalr(3)
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!       valr(:) = [ (mycomm%rank + 1) * 1.2_dp, &
  !!           & (mycomm%rank + 1) * 4.3_dp, (mycomm%rank + 1) * 3.8_dp ]
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 3, mycomm%rank, &
  !!           & "Value to be operated on:", valr(:)
  !!       call mpifx_allreduce(mycomm, valr, resvalr, MPI_PROD)
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 4, mycomm%rank, &
  !!           & "Obtained result (prod):", resvalr(:)
  !!       call mpifx_finalize()
  !!
  !!     end program test_allreduce
  !!
  interface mpifx_allreduce
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_i6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_s6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_d6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_c6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_z6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduce_l6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end interface mpifx_allreduce


  !> Reduces a scalar/array on all nodes in place.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second argument. The second argument can be of type
  !! integer (i), real (s), double precision (d), complex (c), double complex
  !! (z) or logical (l). Its rank can vary from zero (scalar) up to the
  !! maximum rank.
  !!
  !! \see MPI documentation (\c MPI_ALLREDUCE)
  !!
  !!
  !! Example:
  !!
  !!     program test_allreduceip
  !!       use libmpifx_module
  !!       implicit none
  !!
  !!       integer, parameter :: dp = kind(1.0d0)
  !!
  !!       type(mpifx_comm) :: mycomm
  !!       real(dp) :: resvalr(3)
  !!
  !!       call mpifx_init()
  !!       call mycomm%init()
  !!       resvalr(:) = [ (mycomm%rank + 1) * 1.2_dp, &
  !!           & (mycomm%rank + 1) * 4.3_dp, (mycomm%rank + 1) * 3.8_dp ]
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 3, mycomm%rank, &
  !!           & "Value to be operated on:", resvalr(:)
  !!       call mpifx_allreduceip(mycomm, resvalr, MPI_PROD)
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 4, mycomm%rank, &
  !!           & "Obtained result (prod):", resvalr(:)
  !!       call mpifx_finalize()
  !!
  !!     end program test_allreduceip
  !!
  interface mpifx_allreduceip
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_i6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_s6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_d6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_c6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_z6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    module procedure mpifx_allreduceip_l6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end interface mpifx_allreduceip

contains

# 144 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 180 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_i6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_INTEGER, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_i6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_i6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type i6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_i6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_INTEGER, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_i6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_i6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_s6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_REAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_s6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_s6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type s6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_s6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(sp), intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_REAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_s6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_s6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_d6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_d6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_d6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type d6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_d6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    real(dp), intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_PRECISION, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_d6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_d6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_c6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_c6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_c6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type c6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_c6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(sp), intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_c6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_c6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_z6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_z6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_z6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type z6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_z6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    complex(dp), intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_DOUBLE_COMPLEX, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_z6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_z6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l0(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, 1, MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l0', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l0).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l0(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, 1, MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l0", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l1(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l1', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l1
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l1).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l1(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l1", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l1
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l2(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l2', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l2
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l2).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l2(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l2", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l2
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l3(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l3', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l3
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l3).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l3(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l3", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l3
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l4(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l4', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l4
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l4).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l4(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l4", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l4
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l5(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l5', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l5
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l5).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l5(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l5", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l5
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 184 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type $1).
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduce_l6(mycomm, orig, reduced, reductionop, error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> MPI communicator.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Quantity to be reduced.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(in) :: orig(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Contains result on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:,:,:)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Reduction operator
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Error code on exit.
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(orig, reduced, size(orig), MPI_LOGICAL, reductionop, mycomm%id, error0)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, 'MPI_ALLREDUCE in mpifx_allreduce_l6', error)
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduce_l6
# 190 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !> Reduces operand on all processes (type l6).
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !! See MPI documentation (mpi_allreduce()) for further details.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  !!
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  subroutine mpifx_allreduceip_l6(mycomm, origreduced, reductionop, error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  MPI communicator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !>  Quantity to be reduced on input, reduced on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    logical, intent(inout) :: origreduced(:,:,:,:,:,:)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Reduction operator.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(in) :: reductionop
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    !> Error code on exit.
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer, intent(out), optional :: error
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    integer :: error0
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call mpi_allreduce(MPI_IN_PLACE, origreduced, size(origreduced), MPI_LOGICAL, reductionop, mycomm%id,&
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
        & error0)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_allreduceip_l6", error)
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
  end subroutine mpifx_allreduceip_l6
# 191 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"


# 194 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"
# 195 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_allreduce.fpp"

end module mpifx_allreduce_module
