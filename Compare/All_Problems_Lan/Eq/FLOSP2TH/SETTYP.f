      SUBROUTINE SETTYP( NELNUM, ITYPE ) 
      INTEGER NELNUM, IELNUM 
      INTEGER ITYPE( * ), ITYPEE(     162 )
      COMMON / ELTYPE / ITYPEE 
C
C  PROBLEM NAME : FLOSP2TH
C
      DO 10 IELNUM = 1, NELNUM 
         ITYPEE( IELNUM ) = ITYPE( IELNUM ) 
   10 CONTINUE 
      RETURN 
      END 
