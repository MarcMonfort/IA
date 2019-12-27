(define (domain basico)
 (:requirements :adl :typing)
 (:types mes libro - object)

 (:predicates

  (anterior ?m1 - mes ?m2 - mes)
  (predecesor ?l1 - libro ?l2 - libro)
  (leido ?l - libro)
  (leer ?l - libro)
  (asignado ?l - libro)
  (asignado_en ?l - libro ?m - mes)
 )

 (:action asignar_libro
  :parameters (?l - libro ?m - mes)
  :precondition (and (not (asignado_en ?l ?m))
    (forall (?l2 - libro) (imply (predecesor ?l2 ?l) (or (leido ?l2) (exists (?m2 - mes) (and (asignado_en ?l2 ?m2) (anterior ?m2 ?m))))))
  )
  :effect (asignado_en ?l ?m)
 )
)

