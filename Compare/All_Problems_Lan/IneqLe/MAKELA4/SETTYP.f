      SUBROUTINE SETTYP( NELNUM, ITYPE ) 
      INTEGER NELNUM, IELNUM 
      INTEGER ITYPE( * ), ITYPEE(       1 )
      COMMON / ELTYPE / ITYPEE 
C
C  PROBLEM NAME : MAKELA4 
C
      DO 10 IELNUM = 1, NELNUM 
         ITYPEE( IELNUM ) = ITYPE( IELNUM ) 
   10 CONTINUE 
      RETURN 
      END 
