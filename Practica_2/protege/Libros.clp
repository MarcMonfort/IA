; Thu Nov 21 00:10:08 CET 2019
; 
;+ (version "3.5")
;+ (build "Build 663")


;;-------------------------------------------------------------------------------------------------------------
;;                    recomendadorLibros.pont
;;-------------------------------------------------------------------------------------------------------------

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot idioma
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tematica
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot anyo
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot epoca_libro_autor
		(type INSTANCE)
;+		(allowed-classes Libro Autor)
;+		(inverse-slot de_epoca)
		(create-accessor read-write))
	(multislot de_tematica
		(type INSTANCE)
;+		(allowed-classes Tematica)
;+		(inverse-slot tematica_libro)
		(create-accessor read-write))
	(single-slot es_popular
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot de_autor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
;+		(inverse-slot autor_libro)
		(create-accessor read-write))
	(single-slot de_epoca
		(type INSTANCE)
;+		(allowed-classes Epoca)
;+		(cardinality 1 1)
;+		(inverse-slot epoca_libro_autor)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
		(range 0 10)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot autor_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot de_autor)
		(create-accessor read-write))
	(multislot de_genero
		(type INSTANCE)
;+		(allowed-classes Genero)
;+		(inverse-slot genero_libro)
		(create-accessor read-write))
	(multislot de_nacionalidad
		(type INSTANCE)
;+		(allowed-classes Nacionalidad)
		(cardinality 1 ?VARIABLE)
;+		(inverse-slot nacionalidad_autor)
		(create-accessor read-write))
	(single-slot epoca
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot tematica_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot de_tematica)
		(create-accessor read-write))
	(single-slot autor
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot en_idioma_original
		(type INSTANCE)
;+		(allowed-classes Idioma)
;+		(cardinality 1 1)
;+		(inverse-slot idioma_libro)
		(create-accessor read-write))
	(single-slot genero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nivel_lenguaje
		(type STRING)
;+		(value "bajo" "medio" "alto")
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot nacionalidad_autor
		(type INSTANCE)
;+		(allowed-classes Autor Libro)
;+		(inverse-slot de_nacionalidad)
		(create-accessor read-write))
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot num_paginas
		(type INTEGER)
		(range 1 %3FVARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot idioma_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot en_idioma_original)
		(create-accessor read-write))
	(single-slot genero_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(cardinality 0 1)
;+		(inverse-slot de_genero)
		(create-accessor read-write)))

(defclass Libro
	(is-a USER)
	(role concrete)
	(single-slot es_popular
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot de_autor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nivel_lenguaje
		(type STRING)
;+		(value "bajo" "medio" "alto")
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot de_epoca
		(type INSTANCE)
;+		(allowed-classes Epoca)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
		(range 0 10)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot anyo
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot de_genero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(create-accessor read-write))
	(single-slot num_paginas
		(type INTEGER)
		(range 1 %3FVARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot en_idioma_original
		(type INSTANCE)
;+		(allowed-classes Idioma)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot de_tematica
		(type INSTANCE)
;+		(allowed-classes Tematica)
		(create-accessor read-write))
	(multislot de_nacionalidad
		(type INSTANCE)
;+		(allowed-classes Nacionalidad)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Autor
	(is-a USER)
	(role concrete)
	(single-slot es_popular
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot de_epoca
		(type INSTANCE)
;+		(allowed-classes Epoca)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot autor
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot de_nacionalidad
		(type INSTANCE)
;+		(allowed-classes Nacionalidad)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot autor_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))

(defclass Genero
	(is-a USER)
	(role concrete)
	(single-slot genero_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot genero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Nacionalidad
	(is-a USER)
	(role concrete)
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot nacionalidad_autor
		(type INSTANCE)
;+		(allowed-classes Autor Libro)
		(create-accessor read-write)))

(defclass Idioma
	(is-a USER)
	(role concrete)
	(single-slot idioma
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot idioma_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))

(defclass Tematica
	(is-a USER)
	(role concrete)
	(single-slot tematica
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot tematica_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))

(defclass Epoca
	(is-a USER)
	(role concrete)
	(single-slot epoca
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot epoca_libro_autor
		(type INSTANCE)
;+		(allowed-classes Libro Autor)
		(create-accessor read-write)))
		

;;-------------------------------------------------------------------------------------------------------------
;;                    recomendadorLibros.pins
;;-------------------------------------------------------------------------------------------------------------
		
; Thu Nov 21 00:10:08 CET 2019
; 
;+ (version "3.5")
;+ (build "Build 663")

([recomendadorLibros_Class0] of  Libro

	(titulo "jorge miguel arias"))

([recomendadorLibros_Class1] of  Libro

	(de_autor [recomendadorLibros_Class2])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class3])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_popular TRUE)
	(num_paginas 1990)
	(titulo "El conde de Montecristo"))

([recomendadorLibros_Class10000] of  Idioma

	(idioma "frances")
	(idioma_libro [recomendadorLibros_Class1]))

([recomendadorLibros_Class10001] of  Epoca

	(epoca "modernista"))

([recomendadorLibros_Class10002] of  Epoca

	(epoca "vanguardista"))

([recomendadorLibros_Class10003] of  Epoca

	(epoca "neoclásica"))

([recomendadorLibros_Class10004] of  Epoca

	(epoca "barroca"))

([recomendadorLibros_Class10005] of  Epoca

	(epoca "renacentista"))

([recomendadorLibros_Class10006] of  Epoca

	(epoca "medieval"))

([recomendadorLibros_Class10007] of  Epoca

	(epoca "clásica"))

([recomendadorLibros_Class10008] of  Epoca

	(epoca "preclásica"))

([recomendadorLibros_Class2] of  Autor

	(autor "Alexandre Dumas")
	(autor_libro [recomendadorLibros_Class1])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class3])
	(es_popular TRUE))

([recomendadorLibros_Class3] of  Nacionalidad

	(nacionalidad "francesa")
	(nacionalidad_autor
		[recomendadorLibros_Class2]
		[recomendadorLibros_Class1]))

([recomendadorLibros_Class4] of  Epoca

	(epoca "romantica")
	(epoca_libro_autor
		[recomendadorLibros_Class2]
		[recomendadorLibros_Class1]))



;;; Inicio de la solucion implementada

;;; Declaracion de clases propias

;;; Se crea una clase para las recomendaciones para poder hacer listas de recomendaciones y tratarlas mejor

(defclass Recomendacion 
	(is-a USER)
	(role concrete)
	(slot contenido
		(type INSTANCE)
		(create-accessor read-write))
	(slot puntuacion
		(type INTEGER)
		(create-accessor read-write))
	(multislot justificaciones
		(type STRING)
		(create-accessor read-write))
)

;;; Fin de declaracion de clases propias --------------


;;; Declaracion de modulos ----------------------------

;;; Modulo principal de utilidades, indicamos que exportamos todo
(defmodule MAIN (export ?ALL))

;;; Modulo de recopilacion de los datos del usuario
(defmodule recopilacion-usuario
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule recopilacion-prefs
	(import MAIN ?ALL)
	(import recopilacion-usuario deftemplate ?ALL)
	(export ?ALL)
)
;;; Modulo de filtrado y procesado del contenido adequado al usuario
(defmodule procesado
	(import MAIN ?ALL)
	(import recopilacion-usuario deftemplate ?ALL)
	(import recopilacion-prefs deftemplate ?ALL)
	(export ?ALL)
)

;;; Modulo de generacion de soluciones
(defmodule generacion
	(import MAIN ?ALL)
	(export ?ALL)
)


;;; Modulo de presentacion de resultados
(defmodule presentacion
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Fin declaracion de modulos ------------------------

;;; Declaracion de messages ---------------------------

;; Imprime los datos de un contenido
(defmessage-handler MAIN::Contenido imprimir ()
	(format t "Titulo: %s %n" ?self:titulo)
	(printout t crlf)
	(format t "Anyo: %d" ?self:anyo)
	(printout t crlf)
	(format t "Num Paginas: %d" ?self:num_paginas)
	(printout t crlf)
	
	(format t "Autor: %s" (send ?self:de_autor get-autor))	
	(printout t crlf)
	(format t "Idioma: %s" (send ?self:en_idioma_original get-idioma))	
	(printout t crlf)
	(format t "Nacionalidad: %s" (send ?self:en_idioma_original get-idioma))	
	(printout t crlf)
	
	(format t "Puntuación de los usuarios: %d" ?self:puntuacion)
	(printout t crlf)
)

(defmessage-handler MAIN::Recomendacion imprimir ()
	(printout t "-----------------------------------" crlf)
	(printout t (send ?self:contenido imprimir))
	(printout t crlf)
	(format t "Nivel de recomendación: %d %n" ?self:puntuacion)
	(printout t "Justificación: " crlf)
	(progn$ (?curr-just ?self:justificaciones)
		(printout t ?curr-just crlf)
	)
	(printout t crlf)
	(printout t "-----------------------------------" crlf)
)

;;; Fin declaracion de messages -----------------------

;;; Declaracion de templates --------------------------

;;; Template para datos "genéricos" del usuario
(deftemplate MAIN::Usuario
	(slot nombre (type STRING))
	(slot edad (type INTEGER) (default -1))
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	(multislot generos-favoritos (type INSTANCE))
	(multislot tematicas-favoritas (type INSTANCE))
	(multislot nacionalidades (type INSTANCE))
	(multislot idiomas (type INSTANCE))
	(slot momento_lectura (type STRING))
	(slot lectura_popular (type INTEGER) (default 0))  ; 0 para no, 1 para si
	(slot horas_dedicadas (type INTEGER))  ; horas dedicadas a leer
	
	;Esto es provisional, podrian anyadirse/quitarse varios slots
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	(multislot generos-favoritos (type INSTANCE))
	(multislot autores-favoritos (type INSTANCE))
	(multislot nacionalidades (type INSTANCE))
	(multislot idiomas (type INSTANCE))
)

;;; Template para una lista de recomendaciones sin orden
(deftemplate MAIN::lista-rec-desordenada
	(multislot recomendaciones (type INSTANCE))
)

;;; Template para una lista de recomendaciones con orden
(deftemplate MAIN::lista-rec-ordenada
	(multislot recomendaciones (type INSTANCE))
)

;;; Fin declaracion de templates ----------------------



;;; Declaracion de funciones --------------------------

;;; Funcion que retorna el elemento con puntuacion maxima
(deffunction maximo-puntuacion ($?lista)
	(bind ?maximo -1)
	(bind ?elemento nil)
	(progn$ (?curr-rec $?lista)
		(bind ?curr-cont (send ?curr-rec get-contenido))
		(bind ?curr-punt (send ?curr-rec get-puntuacion))
		(if (> ?curr-punt ?maximo)
			then 
			(bind ?maximo ?curr-punt)
			(bind ?elemento ?curr-rec)
		)
	)
	?elemento
)

;;; Funcion para hacer una pregunta con respuesta cualquiera, tipo nombre o edad
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?respuesta (read))
	(while (not (lexemep ?respuesta)) do
		(format t "%s " ?pregunta)
		(bind ?respuesta (read))
    )
	?respuesta
)

;;; Funcion para hacer una pregunta general con una serie de respuestas admitidas
(deffunction MAIN::pregunta-opciones (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)

;;; Funcion para hacer una pregunta de tipo si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction MAIN::pregunta-indice (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escoge una opción:" 1 (length$ ?valores-posibles)))
	?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los números separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then 
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        ) 
    )
    ?lista
)

;;; Fin declaracion de funciones -----------------------

;;; Declaracion de reglas y hechos ---------------------

(defrule MAIN::initialRule "Regla inicial"
	(declare (salience 10))
	=>
	(printout t "====================================================================" crlf)
  	(printout t "=        			            DMA Books Recomendator				            =" crlf)
	(printout t "====================================================================" crlf)
  	(printout t crlf)  	
	(printout t "Que sepas que DMA Books va a usar tus datos para vendérselos al gobierno chino, pringao." crlf)
	(printout t crlf)
	(focus recopilacion-usuario)
)

