** V2D **

Description: A collection of subroutines to handle two dimensional column vectors.

C ** ZV2D - Determines whether a given 2D vector
C           is the ZERO vector.
C
C           V: A 2x1 column vector
C           INF: The state variable.
C                POSSIBLE STATES: INF=0, No, NONZERO VECTOR.
C                                 INF=1, Yes, ZERO VECTOR.
C

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
C       The magnitude computation is stored locally in the `MAG`
C       program variable.

C ** DOT2 - Computes the dot product between a given vector V1, and V2.
C
C       A, B: A 2x1 column vector.
C        
C       PRD: The resulting scalar product.
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C 

C ** AN2 - Computes the angle between two provided vectors.
C
C       A, B: A 2x1 column vector.
C       PRD: The resulting angle
C       INF: The place in memory to store the state.
C            POSSIBLE STATES: INF=0, ROUTINE FAIL
C                             INF=1, ROUTINE SUCCEED.
C
