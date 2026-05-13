C
C   File: V2D
C   Date: 5/13/26
C   Purpose: Collection of subroutines for handling
C            two dimensional vectors.
C

C ** ZV2D - Determines whether a given 2D vector
C           is the ZERO vector.
C
C           A: A 2x1 column vector
C           INF: The state variable.
C                POSSIBLE STATES: INF=0, No, NONZERO VECTOR.
C                                 INF=1, Yes, ZERO VECTOR.
C
      SUBROUTINE ZV2D ( A , INF )
            
      INTEGER INF
      DOUBLE PRECISION A(2)

      INF = 0

      IF ( A ( 1 ) .EQ. 0.D0 .AND. A( 2 ) .EQ. 0.D0 ) THEN
            INF = 1
      ENDIF
            
      RETURN
      END

C ** MG2D - Computes the magnitude of a provided vector.
C           This routine does NOT fail. Therefore INF stores
C           the zero vector state.
C
C
C       A: A 2x1 column vector
C       MAG: The place in memory to store the magnitude
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ZERO VECTOR.
C                             INF=1, NONZERO VECTOR.
C
      SUBROUTINE MG2D ( A , MAG , INF )

      DOUBLE PRECISION MAG , VX , VY , A(2)
      INTEGER INF
            
      CALL ZV2D ( A , INF )

C       Check if we provided the zero vector.

      IF ( INF .EQ. 1 ) THEN
            MAG = 0.D0
            INF = 0
      ELSE
            VX = A ( 1 )
            VY = A ( 2 )
            MAG = DSQRT ( VX**2 + VY**2 )
            INF = 1
      END IF

      RETURN
      END



C ** DR2D - Computes the direction of the provided vector.
C           ::: V/MG2D ( V , MAG , INF )
C
C
C       A: A 2x1 column vector.
C       B: The resulting direction vector itself.
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C
C       The magnitude computation is stored locally in the MAG-
C       variable.
      SUBROUTINE DR2D ( A , B , INF )

      DOUBLE PRECISION MAG , A(2) , B(2)
      INTEGER INF

      CALL MG2D ( A , MAG , INF )

      IF ( INF .EQ. 0 ) THEN

C     SUBROUTINE FAILURE. ZERO VECTOR.
      INF = 0
      PRINT *, '!! DR2D: ZERO VECTOR PROVIDED !!'

      ELSE
C
C
C   
      B ( 1 ) =  A ( 1 ) / MAG
      B ( 2 ) = A ( 2 ) / MAG
                  
      INF = 1

      ENDIF
            
      RETURN
      END


C ** DOT2 - Computes the dot product between a given vector V1, and V2.
C
C       A, B: A 2x1 column vector.
C        
C       PRD: The resulting scalar product.
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C 
      SUBROUTINE DOT2 ( A , B , PRD , INF )

      DOUBLE PRECISION PRD , A(2) , B(2)
      INTEGER INF

C     Store the calculation in memory
      PRD = A( 1 ) * B( 1 ) + A( 2 ) * B( 2 )
      INF = 1
      RETURN
      END

C ** AN2 - Computes the angle between two provided vectors.
C
C       A, B: A 2x1 column vector.
C       PRD: The resulting angle
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C
      SUBROUTINE AN2 ( A , B , PRD , INF )

      INTEGER INF , IA , IB
      DOUBLE PRECISION PRD , MA , MB , A(2) , B(2) , ANG
      DOUBLE PRECISION DRES

C     Treat INF as a placeholder for this part:
      CALL MG2D ( A , MA , IA )
      CALL MG2D ( B , MB , IB )

      IF ( ( MA .EQ. 0.D0 ) .OR. ( MB .EQ. 0.D0 ) ) THEN
            INF = 0
      ELSE
                  
      CALL DOT2 ( A , B , DRES , INF )

      PRD = DRES / ( MA * MB )

      IF ( ( PRD .GE. 1.0D0 ) ) THEN 
            PRD = 1.0D0
      END IF

      IF ( ( PRD .LE. -1.0D0 ) ) THEN
            PRD = -1.0D0
      END IF

      ANG = DACOS( PRD )

      PRD = ANG

      INF = 1

      END IF

      RETURN
      END
