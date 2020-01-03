(define (problem ext3-1)
 (:domain ext3)
 (:objects
  Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - mes
  PR_1 PR_2 PR_3 PR_4 PR_5 - libro
  PA_1 PA_2 PA_3 PA_4 PA_5 - libro
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


  ; - - - - - - - - - - - - -   Predecesores


  (predecesor PR_1 PR_2)
  (predecesor PR_1 PR_3)
  (predecesor PR_1 PR_4)
  (predecesor PR_1 PR_5)

  (predecesor PR_2 PR_3)
  (predecesor PR_2 PR_4)
  (predecesor PR_2 PR_5)

  (predecesor PR_3 PR_4)
  (predecesor PR_3 PR_5)

  (predecesor PR_4 PR_5)


  ; - - - - - - - - - - - - -   Paralelos

  (paralelo PA_1 PA_2)
  (paralelo PA_1 PA_3)
  (paralelo PA_1 PA_4)
  (paralelo PA_1 PA_5)

  (paralelo PA_2 PA_3)
  (paralelo PA_2 PA_4)
  (paralelo PA_2 PA_5)

	(paralelo PA_3 PA_4)
  (paralelo PA_3 PA_5)

  (paralelo PA_4 PA_5)

; - - - - - - - - - - - - -		Fluentes

  (= (paginas Enero) 0)
  (= (paginas Febrero) 0)
  (= (paginas Marzo) 0)
  (= (paginas Abril) 0)
  (= (paginas Mayo) 0)
  (= (paginas Junio) 0)
  (= (paginas Julio) 0)
  (= (paginas Agosto) 0)
  (= (paginas Septiembre) 0)
  (= (paginas Octubre) 0)
  (= (paginas Noviembre) 0)
  (= (paginas Diciembre) 0)
  (= (paginas-totales) 0)

  ; - - - - - - - - - - - - -		Leidos

  ;(leido PA_2)

  ; - - - - - - - - - - - - -		Leer

  (leer PR_5)
  ;(leer PA_3)
  ;(leer PA_4)

  )

  (:goal (and (forall (?l2 - libro) (imply (leer ?l2)
                                (asignado ?l2)))
          (forall (?m2 - mes) (<= (paginas ?m2) 800)))
                                
    )

  (:metric minimize (paginas-totales))
)

