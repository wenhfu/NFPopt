      SUBROUTINE SETTYP( NELNUM, ITYPE ) 
      INTEGER NELNUM, IELNUM 
      INTEGER ITYPE( * ), ITYPEE(       5 )
      COMMON / ELTYPE / ITYPEE 
C
C  PROBLEM NAME : GIGOMEZ2
C
      DO 10 IELNUM = 1, NELNUM 
         ITYPEE( IELNUM ) = ITYPE( IELNUM ) 
   10 CONTINUE 
      RETURN 
      END 
