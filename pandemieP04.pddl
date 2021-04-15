(define (problem p04)
(:domain pandemie)
(:objects persoanaCluj1 persoanaCluj2 persoanaCluj3 persoanaCluj4  
          persoanaDej1 persoanaDej2 persoanaDej3 persoanaDej4
          persoanaTurda1 persoanaTurda2 persoanaTurda3 persoanaTurda4 
          cluj dej turda
)
(:init (pacient persoanaCluj1) (pacient persoanaCluj2) (pacient persoanaCluj3) (pacient persoanaDej1)  (pacient persoanaTurda1)
       (individ persoanaDej2) (individ persoanaDej3) (individ persoanaTurda2) (individ persoanaTurda3)
       (medic persoanaCluj4) (medic persoanaTurda4) (medic persoanaDej4) 
       
       
       
       (confirmat persoanaCluj1) (confirmat persoanaCluj2) ;2 persoane de la Cluj sunt confirmate
       (contact persoanaCluj1 persoanaCluj3) (contact persoanaCluj3 persoanaCluj1) ;a 3 a persoana de la cluj este posibil infectata
       (contact persoanaCluj2 persoanaTurda4) (contact persoanaTurda4 persoanaCluj2) ;medicul 4 din Turda este posibil infectat
       (faraGust persoanaCluj3) ;a treia persoana de la Cluj este confirmata
       ;---------------- 3 persoane Cluj confirmate
      ;-----------------------------------------------------------------------------------------------------------------------
       ;(Dorestevaccin persoanaCluj3)
       ;(Dorestevaccin persoanaCluj2)
       
       (zona cluj) (zona dej) (zona turda)
       (persoanaZona persoanaCluj1 cluj) (persoanaZona persoanaCluj2 cluj) (persoanaZona persoanaCluj3 cluj) (persoanaZona persoanaCluj4 cluj)
       (persoanaZona persoanaTurda1 turda) (persoanaZona persoanaTurda2 turda) (persoanaZona persoanaTurda3 turda) (persoanaZona persoanaTurda4 turda)
       (persoanaZona persoanaDej1 dej) (persoanaZona persoanaDej2 dej) (persoanaZona persoanaDej3 dej) (persoanaZona persoanaDej4 dej)
)
(:goal
    (and 
         (confirmat persoanaCluj1)
         (zonaCarantinata cluj)
         
    )
)
)
