! Scie (saw) bed 
!
! y = bed(x) and y = d bed(x) / dx
!
! --------------------------------------------------------
      FUNCTION fbed(x)
        USE types
        USE DefUtils
      IMPLICIT NONE
      REAL(KIND=dp) :: fbed,x
      REAL(KIND=dp) :: x0,h,p
      LOGICAL :: FirstTime=.TRUE.
      CHARACTER(len=1) :: Rien
      INTEGER :: i
     
      SAVE FirstTime, x0, h, p
     
      IF (FirstTime) THEN
        FirstTime = .FALSE.
        write(*,*)'----------------------------------------------------'
        write(*,*)'YOU ARE SOLVING THE SCIE/SAW PROBLEM (scie.geo mesh)'
        write(*,*)'----------------------------------------------------'
        Open(10,file='scie0.geo')
        DO i = 1, 5
          Read(10,*)Rien
        END DO
        Read(10,'(5x,e14.8)')x0
        Read(10,'(5x,e14.8)')h 
        Read(10,'(5x,e14.8)')p 
        Close(10)
      END IF

      IF (x<=x0)  THEN
         fbed = p*x
      ELSE
         fbed = p*x - h
      END IF

      END FUNCTION fbed
! --------------------------------------------------------
      FUNCTION dbed(x)
        USE types
        USE DefUtils
      IMPLICIT NONE
      REAL(KIND=dp) :: dbed,x
      REAL(KIND=dp) :: x0,h,p
      LOGICAL :: FirstTime=.TRUE.
      CHARACTER(len=1) :: Rien
      INTEGER :: i
     
      SAVE FirstTime, p
     
      IF (FirstTime) THEN
        FirstTime = .FALSE.
        Open(10,file='scie0.geo')
        DO i = 1, 5
          Read(10,*)Rien
        END DO
        Read(10,'(5x,e14.8)')x0
        Read(10,'(5x,e14.8)')h 
        Read(10,'(5x,e14.8)')p 
        Close(10)
      END IF

      dbed = p 

      END FUNCTION dbed
! --------------------------------------------------------
