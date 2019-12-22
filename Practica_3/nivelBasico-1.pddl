(define (problem basico1)
(:domain basico)
(:objects 
;Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - meses
Enero Febrero Marzo Abril - mes
El_nombre_del_viento El_temor_de_un_hombre_sabio Las_puertas_de_piedra - libro

)
(:init

(anterior Enero Febrero)
(anterior Enero Marzo)
(anterior Enero Abril)

(anterior Febrero Marzo)
(anterior Febrero Abril)

(anterior Marzo Abril)

; - - - - - - - - - - - - -

(predecesor El_nombre_del_viento El_temor_de_un_hombre_sabio)
(predecesor El_nombre_del_viento Las_puertas_de_piedra)
(predecesor El_temor_de_un_hombre_sabio Las_puertas_de_piedra)

; - - - - - - - - - - - - -

;(leido El_nombre_del_viento)

; - - - - - - - - - - - - -

(leer Las_puertas_de_piedra)


)

(:goal (forall (?l2 - libro) (imply (leer ?l2)
                                    (asignado ?l2)
                              )
        )
)
)
