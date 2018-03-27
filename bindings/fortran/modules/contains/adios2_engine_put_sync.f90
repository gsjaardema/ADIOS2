!
! Distributed under the OSI-approved Apache License, Version 2.0.  See
!  accompanying file Copyright.txt for details.
!
!  adios2_engine_put_sync.f90 : implementation of adios2_put_sync
!  subroutines
!
!   Created on: Feb 21, 2018
!       Author: William F Godoy godoywf@ornl.gov
!

! Single Value
subroutine adios2_put_sync_real(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 1D Array
subroutine adios2_put_sync_real_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_1d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 2D Array
subroutine adios2_put_sync_real_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_2d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 3D Array
subroutine adios2_put_sync_real_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_3d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 4D Array
subroutine adios2_put_sync_real_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_4d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 5D Array
subroutine adios2_put_sync_real_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_5d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

! 6D Array
subroutine adios2_put_sync_real_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real, dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_dp_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    real(kind=8), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex, dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_complex_dp_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    complex(kind=8), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer1_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=1), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer2_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=2), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer4_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=4), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine

subroutine adios2_put_sync_integer8_6d(engine, variable, values, ierr)
    integer(kind=8), intent(in):: engine
    integer(kind=8), intent(in):: variable
    integer(kind=8), dimension(:, :, :, :, :, :), intent(in):: values
    integer, intent(out):: ierr

    call adios2_put_sync_f2c(engine, variable, values, ierr)

end subroutine