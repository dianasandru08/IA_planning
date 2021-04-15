(define (problem p03)
(:domain pandemie)
(:objects om1 om2 om3 om4 om5 om6 om7 om8 om9 om10 medic1 medic2 medic3 medic4)
(:init (pacient om1) (pacient om2) (pacient om3) (pacient om4) (individ om5) (individ om6) (individ om7)
       (medic medic1) (medic medic2)
       (confirmat om1) (confirmat om2)
       (contact om1 om3) (contact om3 om1)
       (contact om2 medic1) (contact medic1 om2)
       (faraGust om3)
       (nasInfundat medic1)
       (contact om2 medic2) (contact medic2 om2)
       (faraMiros medic2)
       (febra medic2)
       (internare om5 medic2)
       (familie om3 om7)
       (familie om7 om6)
       (doresteVaccin om7)
       (dorestedonare medic2 om3)
       
)
(:goal
    (and (confirmat om3) 
    (not (confirmat medic1))
    (posibilInfectat medic1)
    (confirmat medic2)
    (pacient om5)
    (posibilInfectat om5)
    (posibilInfectat om7)
    (carantinat om7) (carantinat om6) 
    (not (vindecat medic1))
    (vindecat medic2)
    (vindecat om3)
    (not( vindecat om7))) )
)


