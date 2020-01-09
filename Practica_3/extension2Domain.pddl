(define (domain ext2)
 (:requirements :adl :typing)
 (:types mes libro - object)

 (:predicates

  (anterior ?m1 - mes ?m2 - mes)
  (pre ?m1 - mes ?m2 - mes)
  (predecesor ?l1 - libro ?l2 - libro)
  (paralelo ?l1 - libro ?l2 - libro)
  (leido ?l - libro)
  (leer ?l - libro)
  (asignado ?l - libro) 
  (asignado_en ?l - libro ?m - mes)

  (visto ?l - libro)
 )

 (:action asignar_libro
  :parameters (?l - libro ?m - mes)
  :precondition (and (not (visto ?l))
    (forall (?l2 - libro) (and 
                                (imply (predecesor ?l2 ?l) 
                                (or (leido ?l2) (and (asignado ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (anterior ?m2 ?m))))   ))  

                                (imply (or (paralelo ?l2 ?l) (paralelo ?l ?l2) ) ; juntar con el otro forall
                                (or (leido ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (or (= ?m2 ?m)(pre ?m2 ?m)(pre ?m ?m2))  )))) ;comprueba que todos los paralelos esten assignados
                            )
    )

  )
  :effect (and(asignado_en ?l ?m) (asignado ?l) (visto ?l))
 )



 (:action poner_paralelo   ;permite assignar paralelos sin restricciones inversas
  :parameters (?l - libro ?m - mes) 
  :precondition (and (not (visto ?l))
    (forall (?l2 - libro) (imply (predecesor ?l2 ?l) 
                                (or (leido ?l2) (and (asignado ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (anterior ?m2 ?m))))   )))

  )
  :effect (and (asignado_en ?l ?m) (visto ?l))
 )
)

