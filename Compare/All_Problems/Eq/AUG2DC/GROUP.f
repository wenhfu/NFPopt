      SUBROUTINE GROUP ( GVALUE, LGVALU, FVALUE, GPVALU, NCALCG, 
     *                   ITYPEG, ISTGPA, ICALCG, LTYPEG, LSTGPA, 
     *                   LCALCG, LFVALU, LGPVLU, DERIVS, IGSTAT )
      INTEGER LGVALU, NCALCG, LTYPEG, LSTGPA
      INTEGER LCALCG, LFVALU, LGPVLU, IGSTAT
      LOGICAL DERIVS
      INTEGER ITYPEG(LTYPEG), ISTGPA(LSTGPA), ICALCG(LCALCG)
      DOUBLE PRECISION GVALUE(LGVALU,3), FVALUE(LFVALU), GPVALU(LGPVLU)
C
C  Problem name : AUG2DC    
C
C  -- produced by SIFdecode 1.0
C
      INTEGER IGRTYP, IGROUP, IPSTRT, JCALCG
      DOUBLE PRECISION ALPHA 
      IGSTAT = 0
      DO     2 JCALCG = 1, NCALCG
       IGROUP = ICALCG(JCALCG)
       IGRTYP = ITYPEG(IGROUP)
       IF ( IGRTYP == 0 ) GO TO     2
       IPSTRT = ISTGPA(IGROUP) - 1
C
C  Group type : SQUARE  
C
       ALPHA = FVALUE(IGROUP)
       IF ( .NOT. DERIVS ) THEN
        GVALUE(IGROUP,1)= 5.0D-1 * ALPHA * ALPHA                   
       ELSE
        GVALUE(IGROUP,2)= ALPHA                                    
        GVALUE(IGROUP,3)= 1.0D+0                                   
       END IF
    2 CONTINUE
      RETURN
      END
