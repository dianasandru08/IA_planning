
(define (problem p01)
(:domain pandemie)
(:objects om1 om2 om3 om4 om5 medic1 medic2)
(:init (pacient om1) (pacient om2) (pacient om3) (pacient om4) (pacient om5)
       (medic medic1) (medic medic2)
       (confirmat om1) (confirmat om2)
       (contact om1 om3) (contact om3 om1)
       (contact om2 medic1)
)
(:goal
    (and (posibilInfectat om3) (posibilInfectat medic1))
)
)