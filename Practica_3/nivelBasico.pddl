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
    :parameters (?l - libro ?m1 - mes ?m2 - mes)
    :precondition (and (not(asignado ?l)) 
                         (or (leer ?l) 
                                  (exists (?l3 - libro) (and (predecesor ?l ?l3) (leer ?l3)) ) ;es predecesor de un libro que queremos leer
                              )
                              
                              (forall (?l2 - libro)
                                  (imply (predecesor ?l2 ?l)  ;todos los predecesores se han leido o assignado
                                        (or (leido ?l2) (and (asignado_en ?l2 ?m2) (anterior ?m2 ?m1)))
                                  )
                              )
                        
                  )
    :effect (and (asignado ?l) (asignado_en ?l ?m1))
    )
)


  
