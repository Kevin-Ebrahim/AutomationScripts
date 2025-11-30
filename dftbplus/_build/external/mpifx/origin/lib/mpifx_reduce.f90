# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 1 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp" 1
# 125 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx.fypp"
# 2 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp" 2
# 3 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 4 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

!> Contains wrapper for \c MPI_REDUCE.
module mpifx_reduce_module
  use mpi
  use mpifx_comm_module, only : mpifx_comm
  use mpifx_helper_module, only : dp, getoptarg, handle_errorflag, sp
  implicit none
  private

  public :: mpifx_reduce, mpifx_reduceip

  !> Reduces a scalar/array on a given node.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second and third arguments. The second and third
  !! arguments can be of type integer (i), real (s), double precision (d),
  !! complex (c), double complex (z) or logical (l). Their rank can vary from
  !! zero (scalars) up to the maximum rank. Both arguments must be of same
  !! type and rank.
  !!
  !! \see MPI documentation (\c MPI_REDUCE)
  !!
  !! Example:
  !!
  !!     program test_reduce
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
  !!       call mpifx_reduce(mycomm, valr, resvalr, MPI_PROD)
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 4, mycomm%rank, &
  !!           & "Obtained result (prod):", resvalr(:)
  !!       call mpifx_finalize()
  !!
  !!     end program test_reduce
  !!
  interface mpifx_reduce
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_i6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_s6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_d6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_c6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_z6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 52 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l0
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l1
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l2
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l3
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l4
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l5
# 53 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduce_l6
# 55 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 56 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end interface mpifx_reduce


  !> Reduces a scalar/array on a given node in place.
  !!
  !! \details All functions have the same argument list only differing in the
  !! type and rank of the second argument. The second argument can be of type
  !! integer (i), real (s), double precision (d), complex (c), double complex
  !! (z) or logical (l). Its rank can vary from zero (scalar) up to the
  !! maximum rank.
  !!
  !! \see MPI documentation (\c MPI_REDUCE)
  !!
  !!
  !! Example:
  !!
  !!     program test_reduceip
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
  !!       call mpifx_reduceip(mycomm, resvalr, MPI_PROD)
  !!       write(*, "(I2.2,'-',I3.3,'|',1X,A,3F8.2)") 4, mycomm%rank, &
  !!           & "Obtained result (prod):", resvalr(:)
  !!       call mpifx_finalize()
  !!
  !!     end program test_reduceip
  !!
  interface mpifx_reduceip
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_i6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_s6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_d6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_c6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_z6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 96 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l0
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l1
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l2
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l3
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l4
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l5
# 97 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    module procedure mpifx_reduceip_l6
# 99 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 100 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end interface mpifx_reduceip

contains

# 138 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 179 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type i6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_i6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_INTEGER, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_i6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type i6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_i6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_INTEGER, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_i6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_i6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type s6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_s6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_REAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_s6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type s6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_s6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp), intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_REAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_REAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_s6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_s6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type d6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_d6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_d6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type d6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_d6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp), intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    real(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_PRECISION, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_d6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_d6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type c6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_c6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_c6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type c6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_c6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp), intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(sp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_c6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_c6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type z6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_z6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_z6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type z6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_z6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp), intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    complex(dp) :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_DOUBLE_COMPLEX, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_z6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_z6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 182 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l0).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l0(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, 1, MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l0", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l0).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l0(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, 1, MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, 1, MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l0", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l1).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l1(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l1", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l1
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l1).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l1(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l1", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l1
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l2).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l2(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l2", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l2
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l2).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l2(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l2", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l2
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l3).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l3(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l3", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l3
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l3).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l3(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l3", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l3
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l4).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l4(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l4", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l4
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l4).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l4(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l4", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l4
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l5).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l5(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l5", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l5
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l5).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l5(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l5", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l5
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 183 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 185 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 186 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 187 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces on one process (type l6).
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param orig  Quantity to be reduced.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduced  Contains result on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction operator.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the reduced (default: mycomm%leadrank)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduce_l6(mycomm, orig, reduced, reduceop, root, error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(in) :: orig(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: reduced(:,:,:,:,:,:)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call mpi_reduce(orig, reduced, size(orig), MPI_LOGICAL, reduceop, root0, mycomm%id, error0)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l6", error)
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduce_l6
# 188 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !> Reduces results on one process (type l6).
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param mycomm  MPI communicator.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param origred  Quantity to be reduced on input, result on exit
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param reduceop  Reduction reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param root  Root process for the result (default: mycomm%leadrank)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !! \param error  Error code on exit.
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  !!
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  subroutine mpifx_reduceip_l6(mycomm, origred, reduceop, root, error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    type(mpifx_comm), intent(in) :: mycomm
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical, intent(inout) :: origred(:,:,:,:,:,:)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in) :: reduceop
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(in), optional :: root
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer, intent(out), optional :: error
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    integer :: root0, error0
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    logical :: dummy
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call getoptarg(mycomm%leadrank, root0, root)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    if (mycomm%rank == root0) then
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(MPI_IN_PLACE, origred, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id,&
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    else
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
      call mpi_reduce(origred, dummy, size(origred), MPI_LOGICAL, reduceop, root0, mycomm%id, &
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
          & error0)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    end if
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
    call handle_errorflag(error0, "MPI_REDUCE in mpifx_reduce_l6", error)
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
  end subroutine mpifx_reduceip_l6
# 189 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"


# 192 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"
# 193 "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/lib/mpifx_reduce.fpp"

end module mpifx_reduce_module
