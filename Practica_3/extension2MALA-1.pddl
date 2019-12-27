(define (problem ext2Mala-1)
 (:domain ext2Mala)
 (:objects
  Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - mes
  pre_1 pre_2 pre_3 pre_4 pre_5 - libro
  par_1 par_2 par_3 par_4 par_5 - libro
 )
 (:init
  (pre Enero Febrero)
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

  (pre Febrero Marzo)
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

  (pre Marzo Abril)
  (anterior Marzo Abril)
  (anterior Marzo Mayo)
  (anterior Marzo Junio)
  (anterior Marzo Julio)
  (anterior Marzo Agosto)
  (anterior Marzo Septiembre)
  (anterior Marzo Octubre)
  (anterior Marzo Noviembre)
  (anterior Marzo Diciembre)

  (pre Abril Mayo)
  (anterior Abril Mayo)
  (anterior Abril Junio)
  (anterior Abril Julio)
  (anterior Abril Agosto)
  (anterior Abril Septiembre)
  (anterior Abril Octubre)
  (anterior Abril Noviembre)
  (anterior Abril Diciembre)

	(pre Mayo Junio)
  (anterior Mayo Junio)
  (anterior Mayo Julio)
  (anterior Mayo Agosto)
  (anterior Mayo Septiembre)
  (anterior Mayo Octubre)
  (anterior Mayo Noviembre)
  (anterior Mayo Diciembre)

	(pre Junio Julio)
  (anterior Junio Julio)
  (anterior Junio Agosto)
  (anterior Junio Septiembre)
  (anterior Junio Octubre)
  (anterior Junio Noviembre)
  (anterior Junio Diciembre)

	(pre Julio Agosto)
  (anterior Julio Agosto)
  (anterior Julio Septiembre)
  (anterior Julio Octubre)
  (anterior Julio Noviembre)
  (anterior Julio Diciembre)

	(pre Agosto Septiembre)
  (anterior Agosto Septiembre)
  (anterior Agosto Octubre)
  (anterior Agosto Noviembre)
  (anterior Agosto Diciembre)

	(pre Septiembre Octubre)
  (anterior Septiembre Octubre)
  (anterior Septiembre Noviembre)
  (anterior Septiembre Diciembre)

	(pre Octubre Noviembre)
  (anterior Octubre Noviembre)
  (anterior Octubre Diciembre)
  
	(pre Noviembre Diciembre)
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


  ; - - - - - - - - - - - - -

  (paralelo par_1 par_2)
  (paralelo par_1 par_3)
	(paralelo par_1 par_4)
	(paralelo par_1 par_5)
  (paralelo par_3 par_2)

  ; - - - - - - - - - - - - -

  (leido pre_2)

  ; - - - - - - - - - - - - -

  ;(leer pre_3)
  (leer par_1)

  )

  (:goal (forall (?l2 - libro) (imply (leer ?l2)
                                (or (leido ?l2) (exists (?m - mes) (asignado_en ?l2 ?m))))))
)

