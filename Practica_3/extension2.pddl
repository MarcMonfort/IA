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
  (asignado ?l - libro) ;no se usa
  (asignado_en ?l - libro ?m - mes)
 )

 (:action asignar_libro
  :parameters (?l - libro ?m - mes)
  :precondition (and (not (asignado_en ?l ?m))
    (forall (?l2 - libro) (imply (predecesor ?l2 ?l) 
                                (or (leido ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (anterior ?m2 ?m))))))


    (forall (?l2 - libro) (imply (or (and (asignado ?l2) (not(leer ?l)) (or (paralelo ?l2 ?l) (paralelo ?l ?l2) )) (and (leer ?l) (or (paralelo ?l2 ?l) (paralelo ?l ?l2) ) )) 
                                (or (leido ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (or (= ?m2 ?m)(pre ?m2 ?m)(pre ?m ?m2))  )))))
  )



  :effect (and(asignado_en ?l ?m) (asignado ?l))
 )
)

