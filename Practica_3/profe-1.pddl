(define (problem basico1)
 (:domain basico)
 (:objects
  Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - mes
  ;Enero Febrero Marzo Abril - mes
  El_nombre_del_viento El_temor_de_un_hombre_sabio Las_puertas_de_piedra - libro
  pre_1 pre_2 pre_3 pre_4 pre_5 pre_6 pre_7 pre_8 pre_9 pre_10 pre_11 pre_12 - libro
 )
 (:init
  (anterior Enero Febrero)
  (anterior Enero Marzo)
  (anterior Enero Abril)
  (anterior Enero Mayo)
  (anterior Enero Junio)
  (anterior Enero Julio)
  (anterior Enero Agosto)
  (anterior Enero Septiembre)
  (anterior Enero Octubre)
  (anterior Enero Noviembre)
  (anterior Enero Diciembre)

  (anterior Febrero Marzo)
  (anterior Febrero Abril)
  (anterior Febrero Mayo)
  (anterior Febrero Junio)
  (anterior Febrero Julio)
  (anterior Febrero Agosto)
  (anterior Febrero Septiembre)
  (anterior Febrero Octubre)
  (anterior Febrero Noviembre)
(anterior Febrero Diciembre)

  (anterior Marzo Abril)
  (anterior Marzo Mayo)
  (anterior Marzo Junio)
  (anterior Marzo Julio)
  (anterior Marzo Agosto)
  (anterior Marzo Septiembre)
  (anterior Marzo Octubre)
  (anterior Marzo Noviembre)
(anterior Marzo Diciembre)

  (anterior Abril Mayo)
  (anterior Abril Junio)
  (anterior Abril Julio)
  (anterior Abril Agosto)
  (anterior Abril Septiembre)
  (anterior Abril Octubre)
  (anterior Abril Noviembre)
(anterior Abril Diciembre)

  (anterior Mayo Junio)
  (anterior Mayo Julio)
  (anterior Mayo Agosto)
  (anterior Mayo Septiembre)
  (anterior Mayo Octubre)
  (anterior Mayo Noviembre)
(anterior Mayo Diciembre)

  (anterior Junio Julio)
  (anterior Junio Agosto)
  (anterior Junio Septiembre)
  (anterior Junio Octubre)
  (anterior Junio Noviembre)
(anterior Junio Diciembre)

  (anterior Julio Agosto)
  (anterior Julio Septiembre)
  (anterior Julio Octubre)
  (anterior Julio Noviembre)
(anterior Julio Diciembre)

  (anterior Agosto Septiembre)
  (anterior Agosto Octubre)
  (anterior Agosto Noviembre)
(anterior Agosto Diciembre)

  (anterior Septiembre Octubre)
  (anterior Septiembre Noviembre)
(anterior Septiembre Diciembre)

  (anterior Octubre Noviembre)
(anterior Octubre Diciembre)

(anterior Noviembre Diciembre)


  ; - - - - - - - - - - - - -


  (predecesor pre_1 pre_2)
  (predecesor pre_1 pre_3)
  (predecesor pre_1 pre_4)
(predecesor pre_1 pre_5)

  (predecesor pre_2 pre_3)
  (predecesor pre_2 pre_4)
(predecesor pre_2 pre_5)

  (predecesor pre_3 pre_4)
(predecesor pre_3 pre_5)

(predecesor pre_4 pre_5)



  (predecesor El_nombre_del_viento El_temor_de_un_hombre_sabio)
  (predecesor El_nombre_del_viento Las_puertas_de_piedra)
(predecesor El_temor_de_un_hombre_sabio Las_puertas_de_piedra)

  ; - - - - - - - - - - - - -

  ;(leido El_nombre_del_viento)
  ;(leido pre_3)
  ;(leido pre_1)

  ; - - - - - - - - - - - - -

  ;(leer Las_puertas_de_piedra)
  ;(leer El_nombre_del_viento)


  (leer pre_3) ; no funciona
  ;(leer pre_2) ; si funciona
  )

  (:goal (forall (?l2 - libro) (imply (leer ?l2)
                                (exists (?m - mes) (asignado_en ?l2 ?m)))))
)

