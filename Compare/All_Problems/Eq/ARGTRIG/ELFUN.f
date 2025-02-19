      SUBROUTINE ELFUN ( FUVALS, XVALUE, EPVALU, NCALCF, ITYPEE, 
     *                   ISTAEV, IELVAR, INTVAR, ISTADH, ISTEPA, 
     *                   ICALCF, LTYPEE, LSTAEV, LELVAR, LNTVAR, 
     *                   LSTADH, LSTEPA, LCALCF, LFVALU, LXVALU, 
     *                   LEPVLU, IFFLAG, IFSTAT )
      INTEGER NCALCF, IFFLAG, LTYPEE, LSTAEV, LELVAR, LNTVAR
      INTEGER LSTADH, LSTEPA, LCALCF, LFVALU, LXVALU, LEPVLU
      INTEGER IFSTAT
      INTEGER ITYPEE(LTYPEE), ISTAEV(LSTAEV), IELVAR(LELVAR)
      INTEGER INTVAR(LNTVAR), ISTADH(LSTADH), ISTEPA(LSTEPA)
      INTEGER ICALCF(LCALCF)
      DOUBLE PRECISION FUVALS(LFVALU), XVALUE(LXVALU), EPVALU(LEPVLU)
C
C  Problem name : ARGTRIG   
C
C  -- produced by SIFdecode 1.0
C
      INTEGER IELEMN, IELTYP, IHSTRT, ILSTRT, IGSTRT, IPSTRT
      INTEGER JCALCF
      DOUBLE PRECISION XJ    , XI    , SX    , CX    
      INTRINSIC SIN   , COS   
      IFSTAT = 0
      DO     3 JCALCF = 1, NCALCF
       IELEMN = ICALCF(JCALCF) 
       ILSTRT = ISTAEV(IELEMN) - 1
       IGSTRT = INTVAR(IELEMN) - 1
       IPSTRT = ISTEPA(IELEMN) - 1
       IF ( IFFLAG == 3 ) IHSTRT = ISTADH(IELEMN) - 1
       IELTYP = ITYPEE(IELEMN)
       GO TO (    1,    2
     *                                                        ), IELTYP
C
C  Element type : COSINE    
C
    1  CONTINUE
       XJ     = XVALUE(IELVAR(ILSTRT+     1))
       CX     = COS( XJ )                                
       IF ( IFFLAG == 1 ) THEN
        FUVALS(IELEMN)= CX                                       
       ELSE
        FUVALS(IGSTRT+     1)= - SIN( XJ )                              
        IF ( IFFLAG == 3 ) THEN
         FUVALS(IHSTRT+     1)=- CX                                     
        END IF
       END IF
       GO TO     3
C
C  Element type : SINCOS    
C
    2  CONTINUE
       XI     = XVALUE(IELVAR(ILSTRT+     1))
       CX     = COS( XI )                                
       SX     = SIN( XI )                                
       IF ( IFFLAG == 1 ) THEN
        FUVALS(IELEMN)= CX + SX                                  
       ELSE
        FUVALS(IGSTRT+     1)= - SX + CX                                
        IF ( IFFLAG == 3 ) THEN
         FUVALS(IHSTRT+     1)=- CX - SX                                
        END IF
       END IF
    3 CONTINUE
      RETURN
      END
