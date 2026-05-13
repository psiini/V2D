C
C   File: V2D
C   Date: 5/13/26
C   Purpose: Collection of subroutines for handling
C            two dimensional vectors.
C

C ** ZV2D - Determines whether a given 2D vector
C           is the ZERO vector.
C
C           V: A 2x1 column vector
C           INF: The state variable.
C                POSSIBLE STATES: INF=0, No, NONZERO VECTOR.
C                                 INF=1, Yes, ZERO VECTOR.
C
      SUBROUTINE ZV2D ( V , INF )
      REAL V(2)
      INTEGER INF, I

      I = 0
      INF = 0

      IF ( V( 1 ) .EQ. 0 .AND. V( 2 ) .EQ. 0 ) THEN
        INF = 1
      ENDIF

      ENDSUBROUTINE

C ** MG2D - Computes the magnitude of a provided vector.
C           This routine does NOT fail. Therefore INF stores
C           The BOOLEAN state.
C
C
C       V: A 2x1 column vector
C       MAG: The place in memory to store the magnitude
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C
      SUBROUTINE MG2D ( V , MAG , INF)
        REAL V(2), VX, VY
        DOUBLE PRECISION MAG
        INTEGER INF

        CALL ZV2D ( V , INF )

C       Check if we provided the zero vector.

        IF ( INF .EQ. 1 ) THEN
            MAG = 0.0
            INF = 0
        ELSE

        VX = V ( 1 )
        VY = V ( 2 )

        MAG = SQRT( VX**2 + VY**2 )
        INF = 1

        END IF

        RETURN
      ENDSUBROUTINE



C ** DR2D - Computes the direction of the provided vector.
C           ::: V/MG2D ( V , MAG , INF )
C
C
C       V: A 2x1 column vector.
C       V2: The resulting direction vector itself.
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C
C       The magnitude computation is stored locally in the MAG-
C       variable.
      SUBROUTINE DR2D ( V , V2 , INF )

      REAL V(2) , V2(2)
      DOUBLE PRECISION MAG
      INTEGER INF

      CALL MG2D ( V , MAG , INF )

      IF ( INF .EQ. 0 ) THEN

C     SUBROUTINE FAILURE. ZERO VECTOR.

      INF = 0

      PRINT *, '!! DR2D: ZERO VECTOR PROVIDED !!'

      ELSE

        V2( 1 ) = V ( 1 ) / MAG

        V2 ( 2 ) = V ( 2 ) / MAG

        INF = 1

      ENDIF
      ENDSUBROUTINE
