
(define (domain pandemie)
   (:predicates (pacient ?pacient)
                (medic ?medic)
                (individ ?individ)
                (confirmat ?confirmat)
                (posibilInfectat ?infectat)
                (faraGust ?persoana)
                (faraMiros ?persoana)
                (febra ?persoana)
                (nasInfundat ?persoana)
                (internare ?persona ?medic)
                (familie ?persoana1 ?persoana2)
                (carantinat ?persoana)
                (Dorestevaccin ?vaccinat)
                (Dorestedonare ?d1 ?d2)
                (vindecat ?vindecat)
                (zona ?zona)
                (zonaCarantinata ?zona)
                (drum ?zona1 ?zona2)
                (persoanaZona ?pers ?zona)
                (locatieActuala ?persoana ?at)
                (contact ?a ?b))

   (:action raspandeste
       :parameters  (?om1 ?om2)
       :precondition (and (or (pacient ?om1) (medic ?om1) (individ ?om1)) (or (pacient ?om2) (medic ?om2) (individ ?om2))
                          (confirmat ?om1)
                          (contact ?om1 ?om2)
       )
                    
       :effect ( posibilInfectat ?om2))
       
    (:action confirmaInfectarea
       :parameters  (?om )
       :precondition (and (or (pacient ?om) (medic ?om) (individ ?om))
                     (posibilInfectat ?om)
                     ( or (faraMiros ?om) (faraGust ?om))
       )
                    
       :effect ( confirmat ?om))
       
    (:action raspandireDinSpital
       :parameters  (?om ?medic)
       :precondition (and  (pacient ?om) (medic ?medic)
                     (internare ?om ?medic)
                     (confirmat ?medic) )
                    
       :effect ( posibilInfectat ?om)
       )
       
    (:action carantinareLaDomiciliu
       :parameters  (?om1 ?om2)
       :precondition ( and (or (confirmat ?om1) (carantinat ?om1))   (familie ?om1 ?om2) )
                    
       :effect ( and ( posibilInfectat ?om2) (carantinat ?om1) (carantinat ?om2) )
       )
       
    (:action devinePacient
       :parameters  (?ind ?medic)
       :precondition ( and (internare ?ind ?medic) (individ ?ind ) (medic ?medic) )
                    
       :effect (pacient ?ind )
       )
     
    (:action administrareVaccin
       :parameters  (?om)
       :precondition (and (or (medic ?om) (pacient ?om) (individ ?om))  (confirmat ?om) (Dorestevaccin ?om ) )
                    
       :effect (and (vindecat ?om) (not (confirmat ?om)) )
       )
       
       
    (:action administrareVaccinMedic
       :parameters  (?om)
       :precondition (and  (medic ?om)   (confirmat ?om)  )
                    
       :effect (and (vindecat ?om) (not (confirmat ?om)) )
       )
       
       
    (:action donarePlasma
       :parameters  (?donator ?primitor)
       :precondition (and (or (pacient ?donator) (medic ?donator) (individ ?donator)) (or (pacient ?primitor) (medic ?primitor) (individ ?primitor))
                     (confirmat ?donator)
                     (vindecat  ?donator)
                     (confirmat ?primitor)
       )
                    
       :effect (and (vindecat ?primitor) (not (confirmat ?primitor)) )
       )   
       
    (:action deplasare
       :parameters  (?om ?zona1 ?zona2)
       :precondition (and  (zona ?zona1)   (zona ?zona2) 
                     (or (pacient ?om) (medic ?om) (individ ?om))
                     (not (confirmat ?om))
                     (locatieActuala ?om ?zona1)
                     (not (zonaCarantinata ?zona1))
                     (not (zonaCarantinata ?zona2))
       
       )
                    
       :effect  (and (locatieActuala ?om ?zona2 ) (not (locatieActuala ?om ?zona1)))
       )
       
       (:action zonaSeCarantineaza
       :parameters  (?zona ?p1 ?p2 ?p3 ?p4)
       :precondition (and  (zona ?zona) 
                     (persoanaZona ?p1 ?zona) (persoanaZona ?p2 ?zona) (persoanaZona ?p3 ?zona) (persoanaZona ?p4 ?zona)
                     (or (and (confirmat ?p1) (confirmat ?p2) (confirmat ?p3)) 
                     (and (confirmat ?p1) (confirmat ?p3) (confirmat ?p4))
                     (and (confirmat ?p2) (confirmat ?p1) (confirmat ?p4))
                     (and (confirmat ?p2) (confirmat ?p3) (confirmat ?p4)))
       
       )
                    
       :effect  (zonaCarantinata ?zona)
       )


)