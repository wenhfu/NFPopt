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
C  Problem name : HS7       
C
C  -- produced by SIFdecode 1.0
C
      INTEGER IELEMN, IELTYP, IHSTRT, ILSTRT, IGSTRT, IPSTRT
      INTEGER JCALCF
      DOUBLE PRECISION V1    , XXP1  
      IFSTAT = 0
      DO     4 JCALCF = 1, NCALCF
       IELEMN = ICALCF(JCALCF) 
       ILSTRT = ISTAEV(IELEMN) - 1
       IGSTRT = INTVAR(IELEMN) - 1
       IPSTRT = ISTEPA(IELEMN) - 1
       IF ( IFFLAG == 3 ) IHSTRT = ISTADH(IELEMN) - 1
       IELTYP = ITYPEE(IELEMN)
       GO TO (    1,    2,    3
     *                                                        ), IELTYP
C
C  Element type : SQ+1      
C
    1  CONTINUE
       V1     = XVALUE(IELVAR(ILSTRT+     1))
       XXP1   = 1.0 + V1*V1                              
       IF ( IFFLAG == 1 ) THEN
        FUVALS(IELEMN)= XXP1**2                                  
       ELSE
        FUVALS(IGSTRT+     1)= 4.0 * V1*XXP1                            
        IF ( IFFLAG == 3 ) THEN
         FUVALS(IHSTRT+     1)=4.0 * (1.0 + 3.0*V1*V1)                  
        END IF
       END IF
       GO TO     4
C
C  Element type : LN        
C
    3  CONTINUE
       V1     = XVALUE(IELVAR(ILSTRT+     1))
       XXP1   = 1.0 + V1*V1                              
       IF ( IFFLAG == 1 ) THEN
        FUVALS(IELEMN)= LOG(XXP1)                                
       ELSE
        FUVALS(IGSTRT+     1)= 2.0 * V1 / XXP1                          
        IF ( IFFLAG == 3 ) THEN
         FUVALS(IHSTRT+     1)=2.0/XXP1 - 4.0 * V1 * V1/(XXP1)**2       
        END IF
       END IF
       GO TO     4
C
C  Element type : SQ        
C
    2  CONTINUE
       V1     = XVALUE(IELVAR(ILSTRT+     1))
       IF ( IFFLAG == 1 ) THEN
        FUVALS(IELEMN)= V1 * V1                                  
       ELSE
        FUVALS(IGSTRT+     1)= 2.0 * V1                                 
        IF ( IFFLAG == 3 ) THEN
         FUVALS(IHSTRT+     1)=2.0                                      
        END IF
       END IF
    4 CONTINUE
      RETURN
      END
