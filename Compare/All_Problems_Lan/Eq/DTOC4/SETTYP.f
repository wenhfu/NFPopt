      SUBROUTINE SETTYP( NELNUM, ITYPE ) 
      INTEGER NELNUM, IELNUM 
      INTEGER ITYPE( * ), ITYPEE(      38 )
      COMMON / ELTYPE / ITYPEE 
C
C  PROBLEM NAME : DTOC4   
C
      DO 10 IELNUM = 1, NELNUM 
         ITYPEE( IELNUM ) = ITYPE( IELNUM ) 
   10 CONTINUE 
      RETURN 
      END 
