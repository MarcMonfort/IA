; Sun Dec 15 17:16:40 CET 2019
; 
;+ (version "3.5")
;+ (build "Build 663")


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
;+		(cardinality 1 1)
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
;+		(cardinality 1 1)
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
	(single-slot es_clasico
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
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
		(type SYMBOL)
		(allowed-values bajo medio alto)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot nacionalidad_autor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(inverse-slot de_nacionalidad)
		(create-accessor read-write))
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot num_paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot idioma_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot en_idioma_original)
		(create-accessor read-write))
	(multislot genero_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
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
		(type SYMBOL)
		(allowed-values bajo medio alto)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot de_epoca
		(type INSTANCE)
;+		(allowed-classes Epoca)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot anyo
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot de_genero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(create-accessor read-write))
	(single-slot num_paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot es_clasico
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot en_idioma_original
		(type INSTANCE)
;+		(allowed-classes Idioma)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot de_tematica
		(type INSTANCE)
;+		(allowed-classes Tematica)
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
	(multislot genero_libro
		(type INSTANCE)
;+		(allowed-classes Libro)
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
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot nacionalidad_autor
		(type INSTANCE)
;+		(allowed-classes Autor)
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




;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------instancias---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------



(definstances instancies

; Sun Dec 15 17:16:40 CET 2019
; 
;+ (version "3.5")
;+ (build "Build 663")

([recomendadorLibros_Class0] of  Genero

	(genero "aventuras")
	(genero_libro
		[recomendadorLibros_Class30002]
		[recomendadorLibros_Class20000]
		[recomendadorLibros_Class30000]
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90009]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class110000]
		[recomendadorLibros_Class110003]
		[recomendadorLibros_Class110006]))

([recomendadorLibros_Class1] of  Libro

	(anyo 1844)
	(de_autor [recomendadorLibros_Class2])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class40000]
		[recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje medio)
	(num_paginas 1990)
	(puntuacion 10)
	(titulo "El conde de Montecristo"))

([recomendadorLibros_Class10000] of  Idioma

	(idioma "frances")
	(idioma_libro
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class20000]
		[recomendadorLibros_Class50022]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class80012]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class110022]))

([recomendadorLibros_Class100000] of  Libro

	(anyo 1322)
	(de_autor [recomendadorLibros_Class100001])
	(de_epoca [recomendadorLibros_Class10005])
	(de_genero
		[recomendadorLibros_Class80000]
		[recomendadorLibros_Class80025]
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class20007])
	(de_tematica [recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class100005])
	(nivel_lenguaje alto)
	(num_paginas 322)
	(puntuacion 7)
	(titulo "La Divina Comedia"))

([recomendadorLibros_Class100001] of  Autor

	(autor "Dante Alighieri")
	(autor_libro [recomendadorLibros_Class100000])
	(de_epoca [recomendadorLibros_Class10005])
	(de_nacionalidad [recomendadorLibros_Class100002]))

([recomendadorLibros_Class100002] of  Nacionalidad

	(nacionalidad "italiana")
	(nacionalidad_autor
		[recomendadorLibros_Class100001]
		[recomendadorLibros_Class100007]
		[recomendadorLibros_Class100009]
		[recomendadorLibros_Class110036]))

([recomendadorLibros_Class100003] of  Libro

	(anyo 1943)
	(de_autor [recomendadorLibros_Class100004])
	(de_epoca [recomendadorLibros_Class10002])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class90005])
	(de_tematica
		[recomendadorLibros_Class80024]
		[recomendadorLibros_Class90004]
		[recomendadorLibros_Class50006])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje bajo)
	(num_paginas 112)
	(puntuacion 6)
	(titulo "El Principito"))

([recomendadorLibros_Class100004] of  Autor

	(autor "Antoine de Saint-Exupery")
	(autor_libro [recomendadorLibros_Class100003])
	(de_epoca [recomendadorLibros_Class10002])
	(de_nacionalidad [recomendadorLibros_Class3]))

([recomendadorLibros_Class100005] of  Idioma

	(idioma "italiano")
	(idioma_libro
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100008]))

([recomendadorLibros_Class100006] of  Libro

	(anyo 1940)
	(de_autor [recomendadorLibros_Class100007])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero
		[recomendadorLibros_Class50017]
		[recomendadorLibros_Class20007]
		[recomendadorLibros_Class90025])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class100005])
	(nivel_lenguaje medio)
	(num_paginas 270)
	(puntuacion 8)
	(titulo "El Desierto de los Tartaros"))

([recomendadorLibros_Class100007] of  Autor

	(autor "Dino Buzzati")
	(autor_libro [recomendadorLibros_Class100006])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class100002]))

([recomendadorLibros_Class100008] of  Libro

	(anyo 1270)
	(de_autor [recomendadorLibros_Class100009])
	(de_epoca [recomendadorLibros_Class10005])
	(de_genero
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class40002]
		[recomendadorLibros_Class40003]
		[recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class100005])
	(nivel_lenguaje alto)
	(num_paginas 216)
	(puntuacion 6)
	(titulo "Rime"))

([recomendadorLibros_Class100009] of  Autor

	(autor "Guittone Arezzo")
	(autor_libro [recomendadorLibros_Class100008])
	(de_epoca [recomendadorLibros_Class10005])
	(de_nacionalidad [recomendadorLibros_Class100002]))

([recomendadorLibros_Class10001] of  Epoca

	(epoca "modernista")
	(epoca_libro_autor
		[recomendadorLibros_Class70007]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class100012]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100014]
		[recomendadorLibros_Class100013]
		[recomendadorLibros_Class100018]
		[recomendadorLibros_Class100017]
		[recomendadorLibros_Class110008]
		[recomendadorLibros_Class110018]
		[recomendadorLibros_Class110017]
		[recomendadorLibros_Class110024]
		[recomendadorLibros_Class110022]
		[recomendadorLibros_Class110027]
		[recomendadorLibros_Class110026]))

([recomendadorLibros_Class100010] of  Libro

	(anyo 1925)
	(de_autor [recomendadorLibros_Class100012])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class90025]
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class90000])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class50012]
		[recomendadorLibros_Class80024])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(num_paginas 218)
	(puntuacion 8)
	(titulo "El Gran Gatsby"))

([recomendadorLibros_Class100012] of  Autor

	(autor "Francis Scott Fitzgerald")
	(autor_libro [recomendadorLibros_Class100010])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class60001])
	(es_popular TRUE))

([recomendadorLibros_Class100013] of  Libro

	(anyo 1888)
	(de_autor [recomendadorLibros_Class100014])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero [recomendadorLibros_Class90005])
	(de_tematica
		[recomendadorLibros_Class40004]
		[recomendadorLibros_Class80024])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje medio)
	(num_paginas 38)
	(puntuacion 6)
	(titulo "El Principe Feliz"))

([recomendadorLibros_Class100014] of  Autor

	(autor "Oscar Wilde")
	(autor_libro [recomendadorLibros_Class100013])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class70008]))

([recomendadorLibros_Class100015] of  Libro

	(anyo 1928)
	(de_autor [recomendadorLibros_Class100016])
	(de_epoca [recomendadorLibros_Class10002])
	(de_genero
		[recomendadorLibros_Class50017]
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class20001])
	(de_tematica [recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Orlando"))

([recomendadorLibros_Class100016] of  Autor

	(autor "Virginia Woolf")
	(autor_libro [recomendadorLibros_Class100015])
	(de_epoca [recomendadorLibros_Class10002])
	(de_nacionalidad [recomendadorLibros_Class70012]))

([recomendadorLibros_Class100017] of  Libro

	(anyo 1915)
	(de_autor [recomendadorLibros_Class100018])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class80010]
		[recomendadorLibros_Class80007])
	(de_tematica [recomendadorLibros_Class50006])
	(en_idioma_original [recomendadorLibros_Class50021])
	(es_clasico TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 9)
	(titulo "Metamorfosis"))

([recomendadorLibros_Class100018] of  Autor

	(autor "Franz Kafka")
	(autor_libro [recomendadorLibros_Class100017])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class100019])
	(es_popular TRUE))

([recomendadorLibros_Class100019] of  Nacionalidad

	(nacionalidad "checa")
	(nacionalidad_autor [recomendadorLibros_Class100018]))

([recomendadorLibros_Class10002] of  Epoca

	(epoca "vanguardista")
	(epoca_libro_autor
		[recomendadorLibros_Class50008]
		[recomendadorLibros_Class70020]
		[recomendadorLibros_Class100004]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class100016]
		[recomendadorLibros_Class100015]
		[recomendadorLibros_Class110004]
		[recomendadorLibros_Class110003]
		[recomendadorLibros_Class110007]
		[recomendadorLibros_Class110006]))

([recomendadorLibros_Class100020] of  Libro

	(anyo 1987)
	(de_autor [recomendadorLibros_Class100021])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class90025]
		[recomendadorLibros_Class80010])
	(de_tematica
		[recomendadorLibros_Class80024]
		[recomendadorLibros_Class50013])
	(en_idioma_original [recomendadorLibros_Class100023])
	(es_popular TRUE)
	(nivel_lenguaje medio)
	(num_paginas 384)
	(puntuacion 7)
	(titulo "Tokio Blues"))

([recomendadorLibros_Class100021] of  Autor

	(autor "Haruki Murakami")
	(autor_libro [recomendadorLibros_Class100020])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class100022])
	(es_popular TRUE))

([recomendadorLibros_Class100022] of  Nacionalidad

	(nacionalidad "japonesa")
	(nacionalidad_autor
		[recomendadorLibros_Class100021]
		[recomendadorLibros_Class100025]))

([recomendadorLibros_Class100023] of  Idioma

	(idioma "japones")
	(idioma_libro
		[recomendadorLibros_Class100020]
		[recomendadorLibros_Class100024]))

([recomendadorLibros_Class100024] of  Libro

	(anyo 1250)
	(de_autor [recomendadorLibros_Class100025])
	(de_epoca [recomendadorLibros_Class10006])
	(de_genero
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class20007])
	(de_tematica
		[recomendadorLibros_Class40002]
		[recomendadorLibros_Class40001]
		[recomendadorLibros_Class80023]
		[recomendadorLibros_Class40000])
	(en_idioma_original [recomendadorLibros_Class100023])
	(nivel_lenguaje alto)
	(puntuacion 6)
	(titulo "Heike Monogatari"))

([recomendadorLibros_Class100025] of  Autor

	(autor "Akashi Kakuichi")
	(autor_libro [recomendadorLibros_Class100024])
	(de_epoca [recomendadorLibros_Class10006])
	(de_nacionalidad [recomendadorLibros_Class100022]))

([recomendadorLibros_Class10003] of  Epoca

	(epoca "neoclásica"))

([recomendadorLibros_Class10004] of  Epoca

	(epoca "barroca")
	(epoca_libro_autor
		[recomendadorLibros_Class30001]
		[recomendadorLibros_Class30000]
		[recomendadorLibros_Class110012]))

([recomendadorLibros_Class10005] of  Epoca

	(epoca "renacentista")
	(epoca_libro_autor
		[recomendadorLibros_Class100001]
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class100009]
		[recomendadorLibros_Class100008]))

([recomendadorLibros_Class10006] of  Epoca

	(epoca "medieval")
	(epoca_libro_autor
		[recomendadorLibros_Class100025]
		[recomendadorLibros_Class100024]))

([recomendadorLibros_Class10007] of  Epoca

	(epoca "clasica"))

([recomendadorLibros_Class10008] of  Epoca

	(epoca "preclásica")
	(epoca_libro_autor
		[recomendadorLibros_Class110031]
		[recomendadorLibros_Class110032]
		[recomendadorLibros_Class110036]
		[recomendadorLibros_Class110035]))

([recomendadorLibros_Class110000] of  Libro

	(anyo 1983)
	(de_autor [recomendadorLibros_Class110001])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class90005])
	(de_tematica [recomendadorLibros_Class80023])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 6)
	(titulo "El color de la magia"))

([recomendadorLibros_Class110001] of  Autor

	(autor "Terry Pratchett")
	(autor_libro [recomendadorLibros_Class110000])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class70012]))

([recomendadorLibros_Class110003] of  Libro

	(anyo 2001)
	(de_autor [recomendadorLibros_Class110004])
	(de_epoca [recomendadorLibros_Class10002])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class90025])
	(de_tematica [recomendadorLibros_Class110005])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_popular TRUE)
	(nivel_lenguaje medio)
	(puntuacion 9)
	(titulo "La sombra del viento"))

([recomendadorLibros_Class110004] of  Autor

	(autor "Carlos Ruiz Zafón")
	(autor_libro [recomendadorLibros_Class110003])
	(de_epoca [recomendadorLibros_Class10002])
	(de_nacionalidad [recomendadorLibros_Class30005])
	(es_popular TRUE))

([recomendadorLibros_Class110005] of  Tematica

	(tematica "suspenso")
	(tematica_libro [recomendadorLibros_Class110003]))

([recomendadorLibros_Class110006] of  Libro

	(anyo 1990)
	(de_autor [recomendadorLibros_Class110007])
	(de_epoca [recomendadorLibros_Class10002])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class80010])
	(de_tematica [recomendadorLibros_Class80023])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "El ojo del mundo"))

([recomendadorLibros_Class110007] of  Autor

	(autor "Robert Jordan")
	(autor_libro [recomendadorLibros_Class110006])
	(de_epoca [recomendadorLibros_Class10002])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class110008] of  Libro

	(anyo 1869)
	(de_autor [recomendadorLibros_Class110009])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class110010]
		[recomendadorLibros_Class110011]
		[recomendadorLibros_Class20007])
	(en_idioma_original [recomendadorLibros_Class20006])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje alto)
	(puntuacion 8)
	(titulo "Guerra y Paz"))

([recomendadorLibros_Class110009] of  Autor

	(autor "Leon Tolstoi")
	(autor_libro [recomendadorLibros_Class110008])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class20005]))

([recomendadorLibros_Class110010] of  Genero

	(genero "historico")
	(genero_libro
		[recomendadorLibros_Class110008]
		[recomendadorLibros_Class110022]))

([recomendadorLibros_Class110011] of  Genero

	(genero "belica")
	(genero_libro [recomendadorLibros_Class110008]))

([recomendadorLibros_Class110012] of  Libro

	(anyo 1550)
	(de_autor [recomendadorLibros_Class110013])
	(de_epoca [recomendadorLibros_Class10004])
	(de_genero
		[recomendadorLibros_Class80010]
		[recomendadorLibros_Class110016])
	(de_tematica [recomendadorLibros_Class40000])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Lazarillo de Tormes"))

([recomendadorLibros_Class110013] of  Autor

	(autor "anonimo")
	(autor_libro [recomendadorLibros_Class110012])
	(de_epoca [recomendadorLibros_Class110014])
	(de_nacionalidad [recomendadorLibros_Class110015]))

([recomendadorLibros_Class110014] of  Epoca

	(epoca "no")
	(epoca_libro_autor [recomendadorLibros_Class110013]))

([recomendadorLibros_Class110015] of  Nacionalidad

	(nacionalidad "no")
	(nacionalidad_autor [recomendadorLibros_Class110013]))

([recomendadorLibros_Class110016] of  Genero

	(genero "picaresca")
	(genero_libro [recomendadorLibros_Class110012]))

([recomendadorLibros_Class110017] of  Libro

	(anyo 1988)
	(de_autor [recomendadorLibros_Class110018])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class20007]
		[recomendadorLibros_Class50011])
	(de_tematica [recomendadorLibros_Class110021])
	(en_idioma_original [recomendadorLibros_Class110020])
	(es_popular TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "El Alquimista"))

([recomendadorLibros_Class110018] of  Autor

	(autor "Paulo Coelho")
	(autor_libro [recomendadorLibros_Class110017])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class110019]))

([recomendadorLibros_Class110019] of  Nacionalidad

	(nacionalidad "brasilenya")
	(nacionalidad_autor [recomendadorLibros_Class110018]))

([recomendadorLibros_Class110020] of  Idioma

	(idioma "portugues")
	(idioma_libro [recomendadorLibros_Class110017]))

([recomendadorLibros_Class110021] of  Tematica

	(tematica "desarrollo personal")
	(tematica_libro [recomendadorLibros_Class110017]))

([recomendadorLibros_Class110022] of  Libro

	(anyo 1862)
	(de_autor [recomendadorLibros_Class110024])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class110010]
		[recomendadorLibros_Class90025]
		[recomendadorLibros_Class20007])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje alto)
	(puntuacion 9)
	(titulo "Los miserables"))

([recomendadorLibros_Class110023] of  Autor
)

([recomendadorLibros_Class110024] of  Autor

	(autor "Victor Hugo")
	(autor_libro [recomendadorLibros_Class110022])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class3]))

([recomendadorLibros_Class110026] of  Libro

	(anyo 1955)
	(de_autor [recomendadorLibros_Class110027])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class110028]
		[recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class110029]
		[recomendadorLibros_Class110030])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_popular FALSE)
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "Lolita"))

([recomendadorLibros_Class110027] of  Autor

	(autor "Vladimir Nabokov")
	(autor_libro [recomendadorLibros_Class110026])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class20005]))

([recomendadorLibros_Class110028] of  Genero

	(genero "erotica")
	(genero_libro [recomendadorLibros_Class110026]))

([recomendadorLibros_Class110029] of  Tematica

	(tematica "moral")
	(tematica_libro [recomendadorLibros_Class110026]))

([recomendadorLibros_Class110030] of  Tematica

	(tematica "pedofilia")
	(tematica_libro [recomendadorLibros_Class110026]))

([recomendadorLibros_Class110031] of  Libro

	(anyo 120)
	(de_autor [recomendadorLibros_Class110032])
	(de_epoca [recomendadorLibros_Class10008])
	(de_genero [recomendadorLibros_Class20007])
	(en_idioma_original [recomendadorLibros_Class110033])
	(nivel_lenguaje alto)
	(puntuacion 8)
	(titulo "Un manual de vida"))

([recomendadorLibros_Class110032] of  Autor

	(autor "Epicteto")
	(autor_libro [recomendadorLibros_Class110031])
	(de_epoca [recomendadorLibros_Class10008])
	(de_nacionalidad [recomendadorLibros_Class110034]))

([recomendadorLibros_Class110033] of  Idioma

	(idioma "griego")
	(idioma_libro
		[recomendadorLibros_Class110031]
		[recomendadorLibros_Class110035]))

([recomendadorLibros_Class110034] of  Nacionalidad

	(nacionalidad "griega")
	(nacionalidad_autor [recomendadorLibros_Class110032]))

([recomendadorLibros_Class110035] of  Libro

	(anyo 170)
	(de_autor [recomendadorLibros_Class110036])
	(de_epoca [recomendadorLibros_Class10008])
	(de_genero [recomendadorLibros_Class20007])
	(en_idioma_original [recomendadorLibros_Class110033])
	(nivel_lenguaje medio)
	(puntuacion 6)
	(titulo "Meditaciones"))

([recomendadorLibros_Class110036] of  Autor

	(autor "Marco Aurelio")
	(autor_libro [recomendadorLibros_Class110035])
	(de_epoca [recomendadorLibros_Class10008])
	(de_nacionalidad [recomendadorLibros_Class100002]))

([recomendadorLibros_Class2] of  Autor

	(autor "Alexandre Dumas (Padre)")
	(autor_libro
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class20000])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class3])
	(es_popular TRUE))

([recomendadorLibros_Class20000] of  Libro

	(anyo 1845)
	(de_autor [recomendadorLibros_Class2])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero [recomendadorLibros_Class0])
	(de_tematica [recomendadorLibros_Class50006])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Los tres Mosqueteros"))

([recomendadorLibros_Class20001] of  Genero

	(genero "romantica")
	(genero_libro
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80008]
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class90014]
		[recomendadorLibros_Class100008]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100015]
		[recomendadorLibros_Class100020]
		[recomendadorLibros_Class110026]))

([recomendadorLibros_Class20003] of  Libro

	(anyo 1868)
	(de_autor [recomendadorLibros_Class70022])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero [recomendadorLibros_Class20007])
	(en_idioma_original [recomendadorLibros_Class20006])
	(nivel_lenguaje alto)
	(num_paginas 2000)
	(puntuacion 9)
	(titulo "El Idiota"))

([recomendadorLibros_Class20005] of  Nacionalidad

	(nacionalidad "rusa")
	(nacionalidad_autor
		[recomendadorLibros_Class70022]
		[recomendadorLibros_Class110009]
		[recomendadorLibros_Class110027]))

([recomendadorLibros_Class20006] of  Idioma

	(idioma "ruso")
	(idioma_libro
		[recomendadorLibros_Class20003]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class110008]))

([recomendadorLibros_Class20007] of  Genero

	(genero "filosofia")
	(genero_libro
		[recomendadorLibros_Class20003]
		[recomendadorLibros_Class50018]
		[recomendadorLibros_Class50022]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class70015]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class90016]
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100024]
		[recomendadorLibros_Class110008]
		[recomendadorLibros_Class110017]
		[recomendadorLibros_Class110022]
		[recomendadorLibros_Class110031]
		[recomendadorLibros_Class110035]))

([recomendadorLibros_Class3] of  Nacionalidad

	(nacionalidad "francesa")
	(nacionalidad_autor
		[recomendadorLibros_Class2]
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class50023]
		[recomendadorLibros_Class70018]
		[recomendadorLibros_Class80013]
		[recomendadorLibros_Class100004]
		[recomendadorLibros_Class110024]))

([recomendadorLibros_Class30000] of  Libro

	(anyo 1605)
	(de_autor [recomendadorLibros_Class30001])
	(de_epoca [recomendadorLibros_Class10004])
	(de_genero [recomendadorLibros_Class0])
	(de_tematica
		[recomendadorLibros_Class40002]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_clasico TRUE)
	(nivel_lenguaje alto)
	(puntuacion 10)
	(titulo "El ingenioso hidalgo Don Quijote de la Mancha"))

([recomendadorLibros_Class30001] of  Autor

	(autor "Miguel de Cervantes")
	(autor_libro [recomendadorLibros_Class30000])
	(de_epoca [recomendadorLibros_Class10004])
	(de_nacionalidad [recomendadorLibros_Class30005]))

([recomendadorLibros_Class30002] of  Libro

	(anyo 1994)
	(de_autor [recomendadorLibros_Class30003])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class0])
	(en_idioma_original [recomendadorLibros_Class30006])
	(nivel_lenguaje bajo)
	(puntuacion 6)
	(titulo "El capitan Alatriste"))

([recomendadorLibros_Class30003] of  Autor

	(autor "Arturo Perez-Reverte")
	(autor_libro [recomendadorLibros_Class30002])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class30005]))

([recomendadorLibros_Class30004] of  Epoca

	(epoca "contemporanea")
	(epoca_libro_autor
		[recomendadorLibros_Class30003]
		[recomendadorLibros_Class30002]
		[recomendadorLibros_Class50002]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class50010]
		[recomendadorLibros_Class50015]
		[recomendadorLibros_Class50014]
		[recomendadorLibros_Class70001]
		[recomendadorLibros_Class70000]
		[recomendadorLibros_Class70004]
		[recomendadorLibros_Class70003]
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80002]
		[recomendadorLibros_Class80001]
		[recomendadorLibros_Class80005]
		[recomendadorLibros_Class80004]
		[recomendadorLibros_Class80009]
		[recomendadorLibros_Class80008]
		[recomendadorLibros_Class80016]
		[recomendadorLibros_Class80015]
		[recomendadorLibros_Class80019]
		[recomendadorLibros_Class80018]
		[recomendadorLibros_Class80022]
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class80029]
		[recomendadorLibros_Class80028]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class90003]
		[recomendadorLibros_Class90002]
		[recomendadorLibros_Class90007]
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90013]
		[recomendadorLibros_Class90012]
		[recomendadorLibros_Class90015]
		[recomendadorLibros_Class90014]
		[recomendadorLibros_Class90017]
		[recomendadorLibros_Class90016]
		[recomendadorLibros_Class90019]
		[recomendadorLibros_Class90018]
		[recomendadorLibros_Class90021]
		[recomendadorLibros_Class90020]
		[recomendadorLibros_Class90023]
		[recomendadorLibros_Class90022]
		[recomendadorLibros_Class100021]
		[recomendadorLibros_Class100020]
		[recomendadorLibros_Class110001]
		[recomendadorLibros_Class110000]))

([recomendadorLibros_Class30005] of  Nacionalidad

	(nacionalidad "espanyola")
	(nacionalidad_autor
		[recomendadorLibros_Class30003]
		[recomendadorLibros_Class30001]
		[recomendadorLibros_Class80009]
		[recomendadorLibros_Class90007]
		[recomendadorLibros_Class110004]))

([recomendadorLibros_Class30006] of  Idioma

	(idioma "castellano")
	(idioma_libro
		[recomendadorLibros_Class30002]
		[recomendadorLibros_Class30000]
		[recomendadorLibros_Class70003]
		[recomendadorLibros_Class80008]
		[recomendadorLibros_Class80015]
		[recomendadorLibros_Class80018]
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90014]
		[recomendadorLibros_Class110003]
		[recomendadorLibros_Class110012]))

([recomendadorLibros_Class4] of  Epoca

	(epoca "romantica")
	(epoca_libro_autor
		[recomendadorLibros_Class2]
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class20003]
		[recomendadorLibros_Class20000]
		[recomendadorLibros_Class70011]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class70014]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class80027]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class90027]
		[recomendadorLibros_Class90026]
		[recomendadorLibros_Class110009]))

([recomendadorLibros_Class40000] of  Tematica

	(tematica "venganza")
	(tematica_libro
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class100024]
		[recomendadorLibros_Class110012]))

([recomendadorLibros_Class40001] of  Tematica

	(tematica "Dios")
	(tematica_libro
		[recomendadorLibros_Class1]
		[recomendadorLibros_Class50018]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class70015]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class100008]
		[recomendadorLibros_Class100024]))

([recomendadorLibros_Class40002] of  Tematica

	(tematica "caballerias")
	(tematica_libro
		[recomendadorLibros_Class30000]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class100008]
		[recomendadorLibros_Class100024]))

([recomendadorLibros_Class40003] of  Tematica

	(tematica "realista")
	(tematica_libro
		[recomendadorLibros_Class30000]
		[recomendadorLibros_Class50014]
		[recomendadorLibros_Class50022]
		[recomendadorLibros_Class70000]
		[recomendadorLibros_Class70003]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class90022]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100008]
		[recomendadorLibros_Class100015]))

([recomendadorLibros_Class40004] of  Tematica

	(tematica "lealtad")
	(tematica_libro
		[recomendadorLibros_Class70003]
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class100013]))

([recomendadorLibros_Class50000] of  Libro

	(anyo 1954)
	(de_autor [recomendadorLibros_Class50002])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class80010])
	(de_tematica
		[recomendadorLibros_Class50006]
		[recomendadorLibros_Class80024])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_popular TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 9)
	(titulo "El Senyor de los Anillos"))

([recomendadorLibros_Class50002] of  Autor

	(autor "J.R.R. Tolkien")
	(autor_libro
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class50007])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60000])
	(es_popular TRUE))

([recomendadorLibros_Class50003] of  Idioma

	(idioma "Ingles")
	(idioma_libro
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class50008]
		[recomendadorLibros_Class50014]
		[recomendadorLibros_Class70000]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80001]
		[recomendadorLibros_Class80004]
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class80028]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class90002]
		[recomendadorLibros_Class90009]
		[recomendadorLibros_Class90012]
		[recomendadorLibros_Class90016]
		[recomendadorLibros_Class90018]
		[recomendadorLibros_Class90026]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100013]
		[recomendadorLibros_Class110000]
		[recomendadorLibros_Class110006]
		[recomendadorLibros_Class110026]
		[recomendadorLibros_Class100015]))

([recomendadorLibros_Class50006] of  Tematica

	(tematica "fantasia")
	(tematica_libro
		[recomendadorLibros_Class20000]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class70010]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class100017]))

([recomendadorLibros_Class50007] of  Libro

	(anyo 1937)
	(de_autor [recomendadorLibros_Class50002])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006])
	(de_tematica
		[recomendadorLibros_Class50006]
		[recomendadorLibros_Class80024])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_popular TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 9)
	(titulo "El Hobbit"))

([recomendadorLibros_Class50008] of  Libro

	(anyo 1957)
	(de_autor [recomendadorLibros_Class50010])
	(de_epoca [recomendadorLibros_Class10002])
	(de_genero [recomendadorLibros_Class50011])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class50012])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "En el camino"))

([recomendadorLibros_Class50010] of  Autor

	(autor "Jack Kerouac")
	(autor_libro [recomendadorLibros_Class50008])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class50011] of  Genero

	(genero "viajes")
	(genero_libro
		[recomendadorLibros_Class50008]
		[recomendadorLibros_Class70000]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class110017]))

([recomendadorLibros_Class50012] of  Tematica

	(tematica "drogas")
	(tematica_libro
		[recomendadorLibros_Class50008]
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class90022]
		[recomendadorLibros_Class100010]))

([recomendadorLibros_Class50013] of  Tematica

	(tematica "bohemio")
	(tematica_libro
		[recomendadorLibros_Class50008]
		[recomendadorLibros_Class50022]
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class70013]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100020]))

([recomendadorLibros_Class50014] of  Libro

	(anyo 1978)
	(de_autor [recomendadorLibros_Class50015])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class50017])
	(de_tematica [recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 6)
	(titulo "La maquina de follar"))

([recomendadorLibros_Class50015] of  Autor

	(autor "Charles Bukowsky")
	(autor_libro [recomendadorLibros_Class50014])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class50016]))

([recomendadorLibros_Class50016] of  Nacionalidad

	(nacionalidad "alemana")
	(nacionalidad_autor
		[recomendadorLibros_Class50015]
		[recomendadorLibros_Class50019]
		[recomendadorLibros_Class70016]
		[recomendadorLibros_Class90021]
		[recomendadorLibros_Class90023]))

([recomendadorLibros_Class50017] of  Genero

	(genero "realismo")
	(genero_libro
		[recomendadorLibros_Class50014]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class80012]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100015]))

([recomendadorLibros_Class50018] of  Libro

	(anyo 1883)
	(de_autor [recomendadorLibros_Class50019])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero [recomendadorLibros_Class20007])
	(de_tematica [recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class50021])
	(es_clasico FALSE)
	(nivel_lenguaje alto)
	(puntuacion 10)
	(titulo "Asi hablo Zaratustra"))

([recomendadorLibros_Class50019] of  Autor

	(autor "Friedrich Nietzsche")
	(autor_libro [recomendadorLibros_Class50018])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class50016]))

([recomendadorLibros_Class50020] of  Epoca

	(epoca "existencialista")
	(epoca_libro_autor
		[recomendadorLibros_Class50019]
		[recomendadorLibros_Class50018]
		[recomendadorLibros_Class50022]
		[recomendadorLibros_Class50023]
		[recomendadorLibros_Class70016]
		[recomendadorLibros_Class70015]
		[recomendadorLibros_Class70018]
		[recomendadorLibros_Class70017]
		[recomendadorLibros_Class70022]
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class100007]
		[recomendadorLibros_Class100006]))

([recomendadorLibros_Class50021] of  Idioma

	(idioma "aleman")
	(idioma_libro
		[recomendadorLibros_Class50018]
		[recomendadorLibros_Class70015]
		[recomendadorLibros_Class90020]
		[recomendadorLibros_Class90022]
		[recomendadorLibros_Class100017]))

([recomendadorLibros_Class50022] of  Libro

	(anyo 1883)
	(de_autor [recomendadorLibros_Class50023])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero [recomendadorLibros_Class20007])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class10000])
	(nivel_lenguaje medio)
	(puntuacion 10)
	(titulo "El Ser y la Nada"))

([recomendadorLibros_Class50023] of  Autor

	(autor "Jean-Paul Sartre")
	(autor_libro [recomendadorLibros_Class50022])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class3]))

([recomendadorLibros_Class60000] of  Nacionalidad

	(nacionalidad "sudafricana")
	(nacionalidad_autor [recomendadorLibros_Class50002]))

([recomendadorLibros_Class60001] of  Nacionalidad

	(nacionalidad "estadounidense")
	(nacionalidad_autor
		[recomendadorLibros_Class50010]
		[recomendadorLibros_Class70014]
		[recomendadorLibros_Class80005]
		[recomendadorLibros_Class80029]
		[recomendadorLibros_Class90013]
		[recomendadorLibros_Class90017]
		[recomendadorLibros_Class90019]
		[recomendadorLibros_Class90027]
		[recomendadorLibros_Class100012]
		[recomendadorLibros_Class110007]))

([recomendadorLibros_Class70000] of  Libro

	(anyo 2004)
	(de_autor [recomendadorLibros_Class70001])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class50011])
	(de_tematica [recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(num_paginas 312)
	(puntuacion 7)
	(titulo "Viajes con Herodoto"))

([recomendadorLibros_Class70001] of  Autor

	(autor "Ryszard Kapuscinski")
	(autor_libro [recomendadorLibros_Class70000])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class70002]))

([recomendadorLibros_Class70002] of  Nacionalidad

	(nacionalidad "polaca")
	(nacionalidad_autor [recomendadorLibros_Class70001]))

([recomendadorLibros_Class70003] of  Libro

	(anyo 1967)
	(de_autor [recomendadorLibros_Class70004])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class80007])
	(de_tematica
		[recomendadorLibros_Class40004]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(num_paginas 471)
	(puntuacion 9)
	(titulo "Cien Anyos de Soledad"))

([recomendadorLibros_Class70004] of  Autor

	(autor "Gabriel Garcia Marquez")
	(autor_libro [recomendadorLibros_Class70003])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class70005])
	(es_popular TRUE))

([recomendadorLibros_Class70005] of  Nacionalidad

	(nacionalidad "colombiana")
	(nacionalidad_autor [recomendadorLibros_Class70004]))

([recomendadorLibros_Class70006] of  Libro

	(anyo 1897)
	(de_autor [recomendadorLibros_Class70007])
	(de_epoca [recomendadorLibros_Class10001])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class80025])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class40001]
		[recomendadorLibros_Class50006]
		[recomendadorLibros_Class70009])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(es_popular TRUE)
	(nivel_lenguaje medio)
	(num_paginas 576)
	(puntuacion 8)
	(titulo "Dracula"))

([recomendadorLibros_Class70007] of  Autor

	(autor "Bram Stoker")
	(autor_libro [recomendadorLibros_Class70006])
	(de_epoca [recomendadorLibros_Class10001])
	(de_nacionalidad [recomendadorLibros_Class70008])
	(es_popular FALSE))

([recomendadorLibros_Class70008] of  Nacionalidad

	(nacionalidad "irlandesa")
	(nacionalidad_autor
		[recomendadorLibros_Class70007]
		[recomendadorLibros_Class100014]))

([recomendadorLibros_Class70009] of  Tematica

	(tematica "vampiros")
	(tematica_libro [recomendadorLibros_Class70006]))

([recomendadorLibros_Class70010] of  Libro

	(anyo 1790)
	(de_autor [recomendadorLibros_Class70011])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero
		[recomendadorLibros_Class20007]
		[recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class40001]
		[recomendadorLibros_Class50006])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "El matrimonio del cielo y el infierno"))

([recomendadorLibros_Class70011] of  Autor

	(autor "William Blake")
	(autor_libro [recomendadorLibros_Class70010])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class70012]))

([recomendadorLibros_Class70012] of  Nacionalidad

	(nacionalidad "inglesa")
	(nacionalidad_autor
		[recomendadorLibros_Class70011]
		[recomendadorLibros_Class70020]
		[recomendadorLibros_Class100016]
		[recomendadorLibros_Class110001]))

([recomendadorLibros_Class70013] of  Libro

	(anyo 1839)
	(de_autor [recomendadorLibros_Class70014])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero [recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class40002]
		[recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(num_paginas 126)
	(puntuacion 9)
	(titulo "La caída de la Casa Usher"))

([recomendadorLibros_Class70014] of  Autor

	(autor "Edgar Allan Poe")
	(autor_libro [recomendadorLibros_Class70013])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class60001])
	(es_popular TRUE))

([recomendadorLibros_Class70015] of  Libro

	(anyo 1819)
	(de_autor [recomendadorLibros_Class70016])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero [recomendadorLibros_Class20007])
	(de_tematica [recomendadorLibros_Class40001])
	(en_idioma_original [recomendadorLibros_Class50021])
	(es_clasico TRUE)
	(nivel_lenguaje alto)
	(num_paginas 1200)
	(puntuacion 10)
	(titulo "El Mundo como Voluntad y Representacion"))

([recomendadorLibros_Class70016] of  Autor

	(autor "Arthur Schopenhauer")
	(autor_libro [recomendadorLibros_Class70015])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class50016]))

([recomendadorLibros_Class70017] of  Libro

	(anyo 1942)
	(de_autor [recomendadorLibros_Class70018])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero [recomendadorLibros_Class20007])
	(de_tematica
		[recomendadorLibros_Class40001]
		[recomendadorLibros_Class50013]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class10000])
	(nivel_lenguaje bajo)
	(num_paginas 184)
	(puntuacion 10)
	(titulo "El Extranjero"))

([recomendadorLibros_Class70018] of  Autor

	(autor "Albert Camus")
	(autor_libro [recomendadorLibros_Class70017])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class3]))

([recomendadorLibros_Class70019] of  Libro

	(anyo 1949)
	(de_autor [recomendadorLibros_Class70020])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80000]
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class20001])
	(de_tematica
		[recomendadorLibros_Class40004]
		[recomendadorLibros_Class50012])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje bajo)
	(num_paginas 380)
	(puntuacion 10)
	(titulo "1984"))

([recomendadorLibros_Class70020] of  Autor

	(autor "George Orwell")
	(autor_libro [recomendadorLibros_Class70019])
	(de_epoca [recomendadorLibros_Class10002])
	(de_nacionalidad [recomendadorLibros_Class70012]))

([recomendadorLibros_Class70021] of  Libro

	(anyo 1864)
	(de_autor [recomendadorLibros_Class70022])
	(de_epoca [recomendadorLibros_Class50020])
	(de_genero
		[recomendadorLibros_Class20007]
		[recomendadorLibros_Class50017])
	(de_tematica
		[recomendadorLibros_Class40003]
		[recomendadorLibros_Class50013])
	(en_idioma_original [recomendadorLibros_Class20006])
	(es_clasico TRUE)
	(nivel_lenguaje alto)
	(num_paginas 176)
	(puntuacion 8)
	(titulo "Memorias del subsuelo"))

([recomendadorLibros_Class70022] of  Autor

	(autor "Fiodor Dostoyevski")
	(autor_libro
		[recomendadorLibros_Class70021]
		[recomendadorLibros_Class20003])
	(de_epoca [recomendadorLibros_Class50020])
	(de_nacionalidad [recomendadorLibros_Class20005]))

([recomendadorLibros_Class80000] of  Genero

	(genero "distopica")
	(genero_libro
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80001]
		[recomendadorLibros_Class80004]
		[recomendadorLibros_Class90016]
		[recomendadorLibros_Class100000]))

([recomendadorLibros_Class80001] of  Libro

	(anyo 1932)
	(de_autor [recomendadorLibros_Class80002])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80000]
		[recomendadorLibros_Class80011])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "Un mundo feliz"))

([recomendadorLibros_Class80002] of  Autor

	(autor "Aldous Huxley")
	(autor_libro [recomendadorLibros_Class80001])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80003]))

([recomendadorLibros_Class80003] of  Nacionalidad

	(nacionalidad "britanica")
	(nacionalidad_autor
		[recomendadorLibros_Class80002]
		[recomendadorLibros_Class80022]
		[recomendadorLibros_Class80027]
		[recomendadorLibros_Class90003]
		[recomendadorLibros_Class90010]))

([recomendadorLibros_Class80004] of  Libro

	(anyo 1953)
	(de_autor [recomendadorLibros_Class80005])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class80000])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "Farenheit 451"))

([recomendadorLibros_Class80005] of  Autor

	(autor "Ray Bradbury")
	(autor_libro [recomendadorLibros_Class80004])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class80006] of  Genero

	(genero "fantasia")
	(genero_libro
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class80008]
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90014]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class100017]
		[recomendadorLibros_Class100024]
		[recomendadorLibros_Class110000]
		[recomendadorLibros_Class110006]))

([recomendadorLibros_Class80007] of  Genero

	(genero "realismo magico")
	(genero_libro
		[recomendadorLibros_Class70003]
		[recomendadorLibros_Class80015]
		[recomendadorLibros_Class80018]
		[recomendadorLibros_Class100017]))

([recomendadorLibros_Class80008] of  Libro

	(anyo 2000)
	(de_autor [recomendadorLibros_Class80009])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class80010])
	(en_idioma_original [recomendadorLibros_Class30006])
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "El valle de los lobos"))

([recomendadorLibros_Class80009] of  Autor

	(autor "Laura Gallego")
	(autor_libro [recomendadorLibros_Class80008])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class30005]))

([recomendadorLibros_Class80010] of  Genero

	(genero "juvenil")
	(genero_libro
		[recomendadorLibros_Class80008]
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class80030]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class90002]
		[recomendadorLibros_Class80028]
		[recomendadorLibros_Class100017]
		[recomendadorLibros_Class100020]
		[recomendadorLibros_Class110006]
		[recomendadorLibros_Class110012]))

([recomendadorLibros_Class80011] of  Genero

	(genero "politica")
	(genero_libro
		[recomendadorLibros_Class70019]
		[recomendadorLibros_Class80001]
		[recomendadorLibros_Class80012]
		[recomendadorLibros_Class100008]
		[recomendadorLibros_Class100015]
		[recomendadorLibros_Class100024]
		[recomendadorLibros_Class110008]))

([recomendadorLibros_Class80012] of  Libro

	(anyo 1885)
	(de_autor [recomendadorLibros_Class80013])
	(de_epoca [recomendadorLibros_Class80014])
	(de_genero
		[recomendadorLibros_Class80011]
		[recomendadorLibros_Class50017])
	(en_idioma_original [recomendadorLibros_Class10000])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "Germinal"))

([recomendadorLibros_Class80013] of  Autor

	(autor "Emile Zola")
	(autor_libro [recomendadorLibros_Class80012])
	(de_epoca [recomendadorLibros_Class80014])
	(de_nacionalidad [recomendadorLibros_Class3]))

([recomendadorLibros_Class80014] of  Epoca

	(epoca "naturalismo")
	(epoca_libro_autor
		[recomendadorLibros_Class80013]
		[recomendadorLibros_Class80012]))

([recomendadorLibros_Class80015] of  Libro

	(anyo 1951)
	(de_autor [recomendadorLibros_Class80016])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class80007])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Bestiario"))

([recomendadorLibros_Class80016] of  Autor

	(autor "Julio Cortazar")
	(autor_libro [recomendadorLibros_Class80015])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80017]))

([recomendadorLibros_Class80017] of  Nacionalidad

	(nacionalidad "argentina")
	(nacionalidad_autor
		[recomendadorLibros_Class80016]
		[recomendadorLibros_Class90015]))

([recomendadorLibros_Class80018] of  Libro

	(anyo 1955)
	(de_autor [recomendadorLibros_Class80019])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class80007])
	(en_idioma_original [recomendadorLibros_Class30006])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "Pedro Paramo"))

([recomendadorLibros_Class80019] of  Autor

	(autor "Juan Rulfo")
	(autor_libro [recomendadorLibros_Class80018])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80020]))

([recomendadorLibros_Class80020] of  Nacionalidad

	(nacionalidad "mexicana")
	(nacionalidad_autor [recomendadorLibros_Class80019]))

([recomendadorLibros_Class80021] of  Libro

	(anyo 1997)
	(de_autor [recomendadorLibros_Class80022])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class80010])
	(de_tematica
		[recomendadorLibros_Class80023]
		[recomendadorLibros_Class80024])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_popular TRUE)
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "Harry Potter"))

([recomendadorLibros_Class80022] of  Autor

	(autor "J. K. Rowling")
	(autor_libro [recomendadorLibros_Class80021])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80003]))

([recomendadorLibros_Class80023] of  Tematica

	(tematica "magia")
	(tematica_libro
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class100024]
		[recomendadorLibros_Class110000]
		[recomendadorLibros_Class110006]))

([recomendadorLibros_Class80024] of  Tematica

	(tematica "amistad")
	(tematica_libro
		[recomendadorLibros_Class80021]
		[recomendadorLibros_Class50007]
		[recomendadorLibros_Class50000]
		[recomendadorLibros_Class90002]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100013]
		[recomendadorLibros_Class100020]))

([recomendadorLibros_Class80025] of  Genero

	(genero "Terror")
	(genero_libro
		[recomendadorLibros_Class70006]
		[recomendadorLibros_Class80026]
		[recomendadorLibros_Class100000]
		[recomendadorLibros_Class80028]))

([recomendadorLibros_Class80026] of  Libro

	(anyo 1818)
	(de_autor [recomendadorLibros_Class80027])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class80025])
	(de_tematica
		[recomendadorLibros_Class40001]
		[recomendadorLibros_Class40000]
		[recomendadorLibros_Class50006])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(es_popular FALSE)
	(nivel_lenguaje bajo)
	(puntuacion 8)
	(titulo "Frankestein"))

([recomendadorLibros_Class80027] of  Autor

	(autor "Mary Shelley")
	(autor_libro [recomendadorLibros_Class80026])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class80003])
	(es_popular TRUE))

([recomendadorLibros_Class80028] of  Libro

	(anyo 1987)
	(de_autor [recomendadorLibros_Class80029])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80025]
		[recomendadorLibros_Class80010])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "Misery"))

([recomendadorLibros_Class80029] of  Autor

	(autor "Stephen King")
	(autor_libro
		[recomendadorLibros_Class80028]
		[recomendadorLibros_Class80030])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001])
	(es_popular TRUE))

([recomendadorLibros_Class80030] of  Libro

	(anyo 1987)
	(de_autor [recomendadorLibros_Class80029])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80010]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class0])
	(de_tematica [recomendadorLibros_Class40004])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "Los ojos del dragon"))

([recomendadorLibros_Class90000] of  Genero

	(genero "comedia")
	(genero_libro
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90018]
		[recomendadorLibros_Class90020]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class90002]))

([recomendadorLibros_Class90001] of  Genero

	(genero "ciencia ficcion")
	(genero_libro
		[recomendadorLibros_Class90014]
		[recomendadorLibros_Class90016]
		[recomendadorLibros_Class90002]))

([recomendadorLibros_Class90002] of  Libro

	(anyo 1979)
	(de_autor [recomendadorLibros_Class90003])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class90001]
		[recomendadorLibros_Class90000]
		[recomendadorLibros_Class80010])
	(de_tematica
		[recomendadorLibros_Class80024]
		[recomendadorLibros_Class90004])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 9)
	(titulo "La guia del autoestopista galactico"))

([recomendadorLibros_Class90003] of  Autor

	(autor "Douglas Adams")
	(autor_libro [recomendadorLibros_Class90002])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80003]))

([recomendadorLibros_Class90004] of  Tematica

	(tematica "espacio")
	(tematica_libro
		[recomendadorLibros_Class90002]
		[recomendadorLibros_Class100003]))

([recomendadorLibros_Class90005] of  Genero

	(genero "infantil")
	(genero_libro
		[recomendadorLibros_Class90006]
		[recomendadorLibros_Class90009]
		[recomendadorLibros_Class90012]
		[recomendadorLibros_Class100003]
		[recomendadorLibros_Class100013]
		[recomendadorLibros_Class110000]))

([recomendadorLibros_Class90006] of  Libro

	(anyo 1997)
	(de_autor [recomendadorLibros_Class90007])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class50011]
		[recomendadorLibros_Class90005]
		[recomendadorLibros_Class90000])
	(en_idioma_original [recomendadorLibros_Class30006])
	(nivel_lenguaje bajo)
	(puntuacion 9)
	(titulo "El rey Arturo cabalga de nuevo, mas o menos"))

([recomendadorLibros_Class90007] of  Autor

	(autor "Miguel Angel Moleon")
	(autor_libro [recomendadorLibros_Class90006])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class30005]))

([recomendadorLibros_Class90009] of  Libro

	(anyo 1883)
	(de_autor [recomendadorLibros_Class90010])
	(de_epoca [recomendadorLibros_Class90011])
	(de_genero
		[recomendadorLibros_Class0]
		[recomendadorLibros_Class90005])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 5)
	(titulo "La isla del tesoro"))

([recomendadorLibros_Class90010] of  Autor

	(autor "Robert Luis Stevenson")
	(autor_libro [recomendadorLibros_Class90009])
	(de_epoca [recomendadorLibros_Class90011])
	(de_nacionalidad [recomendadorLibros_Class80003]))

([recomendadorLibros_Class90011] of  Epoca

	(epoca "realismo")
	(epoca_libro_autor
		[recomendadorLibros_Class90010]
		[recomendadorLibros_Class90009]))

([recomendadorLibros_Class90012] of  Libro

	(anyo 1963)
	(de_autor [recomendadorLibros_Class90013])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class90005])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje bajo)
	(puntuacion 7)
	(titulo "Donde viven los monstruos"))

([recomendadorLibros_Class90013] of  Autor

	(autor "Maurice Sendak")
	(autor_libro [recomendadorLibros_Class90012])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class90014] of  Libro

	(anyo 1940)
	(de_autor [recomendadorLibros_Class90015])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class80006]
		[recomendadorLibros_Class20001]
		[recomendadorLibros_Class90001])
	(en_idioma_original [recomendadorLibros_Class30006])
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "La invencion de Morel"))

([recomendadorLibros_Class90015] of  Autor

	(autor "Adolfo Bioy")
	(autor_libro [recomendadorLibros_Class90014])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class80017]))

([recomendadorLibros_Class90016] of  Libro

	(anyo 1968)
	(de_autor [recomendadorLibros_Class90017])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero
		[recomendadorLibros_Class90001]
		[recomendadorLibros_Class20007]
		[recomendadorLibros_Class80000])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Suenyan los androides con ovejas electricas?"))

([recomendadorLibros_Class90017] of  Autor

	(autor "Phillip K. Dick")
	(autor_libro [recomendadorLibros_Class90016])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class90018] of  Libro

	(anyo 1980)
	(de_autor [recomendadorLibros_Class90019])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class90000])
	(en_idioma_original [recomendadorLibros_Class50003])
	(nivel_lenguaje medio)
	(puntuacion 7)
	(titulo "La conjura de los necios"))

([recomendadorLibros_Class90019] of  Autor

	(autor "John Kennedy Toole")
	(autor_libro [recomendadorLibros_Class90018])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class60001]))

([recomendadorLibros_Class90020] of  Libro

	(anyo 2007)
	(de_autor [recomendadorLibros_Class90021])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class90000])
	(en_idioma_original [recomendadorLibros_Class50021])
	(nivel_lenguaje bajo)
	(puntuacion 6)
	(titulo "Maldito karma"))

([recomendadorLibros_Class90021] of  Autor

	(autor "David Safier")
	(autor_libro [recomendadorLibros_Class90020])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class50016]))

([recomendadorLibros_Class90022] of  Libro

	(anyo 1978)
	(de_autor [recomendadorLibros_Class90023])
	(de_epoca [recomendadorLibros_Class30004])
	(de_genero [recomendadorLibros_Class90025])
	(de_tematica
		[recomendadorLibros_Class50012]
		[recomendadorLibros_Class40003])
	(en_idioma_original [recomendadorLibros_Class50021])
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "Los ninyos de la estacion de la zoo"))

([recomendadorLibros_Class90023] of  Autor

	(autor "Kai Herman")
	(autor_libro [recomendadorLibros_Class90022])
	(de_epoca [recomendadorLibros_Class30004])
	(de_nacionalidad [recomendadorLibros_Class50016]))

([recomendadorLibros_Class90025] of  Genero

	(genero "drama")
	(genero_libro
		[recomendadorLibros_Class90022]
		[recomendadorLibros_Class90026]
		[recomendadorLibros_Class100006]
		[recomendadorLibros_Class100010]
		[recomendadorLibros_Class100020]
		[recomendadorLibros_Class110003]
		[recomendadorLibros_Class110022]))

([recomendadorLibros_Class90026] of  Libro

	(anyo 1851)
	(de_autor [recomendadorLibros_Class90027])
	(de_epoca [recomendadorLibros_Class4])
	(de_genero [recomendadorLibros_Class90025])
	(en_idioma_original [recomendadorLibros_Class50003])
	(es_clasico TRUE)
	(nivel_lenguaje medio)
	(puntuacion 8)
	(titulo "La casa de los siete tejados"))

([recomendadorLibros_Class90027] of  Autor

	(autor "Nathaniel Hawthorne")
	(autor_libro [recomendadorLibros_Class90026])
	(de_epoca [recomendadorLibros_Class4])
	(de_nacionalidad [recomendadorLibros_Class60001]))




)


;;;  ----------------hasta aqui---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------ahora nuestro---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------codigo---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------



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


;;;  ----------------message---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------


;; Imprime los datos de un contenido
(defmessage-handler MAIN::Libro imprimir ()
	(format t "Titulo: %s %n" ?self:titulo)
	(printout t crlf)
	(format t "Anyo: %d" ?self:anyo)
	(printout t crlf)

)

(defmessage-handler MAIN::Recomendacion imprimir ()
	(printout t "-----------------------------------" crlf)
	(printout t (send ?self:contenido imprimir))
	(printout t crlf)
	(format t "Nivel de recomendacion: %d %n" ?self:puntuacion)
	(printout t "Justificacion: " crlf)
	(progn$ (?curr-just ?self:justificaciones)
		(printout t ?curr-just crlf)
	)
	(printout t crlf)
	(printout t "-----------------------------------" crlf)
)




;;;  ----------------TEMPLATES---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------


(deftemplate MAIN::Usuario
	(slot nombre (type STRING))
	(slot sexo (type SYMBOL) (default desconocido))
	(slot edad (type INTEGER) (default -1))
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	(multislot generos-favoritos (type INSTANCE))
	(multislot tematicas-favoritas (type INSTANCE))
	(multislot nacionalidades (type INSTANCE))
	(multislot idiomas (type INSTANCE))
	(multislot epocas-favoritas (type INSTANCE))
	(slot momento_lectura (type STRING))
	
	;Esto es provisional, podrian anyadirse/quitarse varios slots
)

;;; Template para una lista de recomendaciones sin orden
(deftemplate MAIN::lista-rec-desordenada
	(multislot recomendaciones (type INSTANCE))
)

;;; Template para una lista de recomendaciones con orden
(deftemplate MAIN::lista-rec-ordenada
	(multislot recomendaciones (type INSTANCE))
)

;;;  ----------------PREGUNTAS---------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------

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

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction MAIN::pregunta-general (?pregunta)
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

;;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction MAIN::pregunta-indice (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escoge una opcion:" 1 (length$ ?valores-posibles)))
	?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction MAIN::pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los numeros separados por un espacio: ")
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


;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------




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
    ;(focus recopilacion-prefs)
)

;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------


(defrule recopilacion-usuario::establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
	(not (Usuario))
	=>
	(bind ?nombre (pregunta-general "Nombre: "))
	(assert (Usuario (nombre ?nombre)))
)

(defrule recopilacion-usuario::establecer-edad "Establece la edad del usuario"
	?u <- (Usuario (edad ?edad))
	(test (< ?edad 0))
	=>
	(bind ?e (pregunta-numerica "Edad: " 1 110))
	(modify ?u (edad ?e))
)

(defrule recopilacion-usuario::establecer-sexo "Establece el sexo del usuario"
	?u <- (Usuario (sexo desconocido))
	=>
	(bind ?s (pregunta-opciones "Sexo: " hombre mujer))
	(modify ?u (sexo ?s))
)

(defrule recopilacion-usuario::pasar-a-preferencias "Pasa a la recopilacion de preferencias"
	(declare (salience -10))
	?u <- (Usuario (edad ?e) (sexo ~desconocido))
	(test (> ?e 0))
	=>
	(focus recopilacion-prefs)
)

;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------

(deffacts recopilacion-prefs::hechos-iniciales "Establece hechos para poder recopilar informacion"
	(genero-favorito ask)
	(tematica-favorita ask)
	(nacionalidad ask)
	(vo ask)
	(aclamado-critica ask)
	(clasicos ask)
    (habito-lectura ask)
	(epoca-favorita ask)
	(preferencias )
)

;;;  ----------------------------------------------

(defrule recopilacion-prefs::preguntar-genero-favorito "Pregunta al usuario si tiene algun genero favorito"
	?hecho <- (genero-favorito ask)
	;(vo ~ask)
	;(idioma ~ask)
	(nacionalidad ~ask&~choose)
	=>
	(bind ?respuesta (pregunta-si-no "Tiene preferencias en cuanto a los generos? "))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (genero-favorito choose))
		else 
		(assert (genero-favorito FALSE))
	)
)

(defrule recopilacion-prefs::establecer-genero-favorito "Establece el genero favorito del usuario"
	?hecho <- (genero-favorito choose)
	?pref <- (preferencias)
	=>
	(bind $?obj-generos (find-all-instances ((?inst Genero)) TRUE))
	(bind $?nom-generos (create$ ))
	(loop-for-count (?i 1 (length$ $?obj-generos)) do
		(bind ?curr-obj (nth$ ?i ?obj-generos))
		(bind ?curr-nom (send ?curr-obj get-genero))
		(bind $?nom-generos(insert$ $?nom-generos (+ (length$ $?nom-generos) 1) ?curr-nom))
	)
	(bind ?escogido (pregunta-multi "Escoja sus generos favoritos: " $?nom-generos))
	
	(bind $?respuesta (create$ ))
	(loop-for-count (?i 1 (length$ ?escogido)) do
		(bind ?curr-index (nth$ ?i ?escogido))
		(bind ?curr-gen (nth$ ?curr-index ?obj-generos))
		(bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-gen))
	)
	
	(retract ?hecho)
	(assert (genero-favorito TRUE))
	(modify ?pref (generos-favoritos $?respuesta))
)

;;;  ----------------------------------------------

(defrule recopilacion-prefs::preguntar-nacionalidad "Pregunta si se tiene una nacionalidad para el contenido favorita"
	;(formatos ~ask)
	;(idioma ~ask)
	;(vo ~ask)
	?hecho <- (nacionalidad ask)
	=>
	(bind ?respuesta (pregunta-si-no "Tiene preferencias en cuanto a la nacionalidad de los libros?"))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (nacionalidad choose))
		else (assert (nacionalidad FALSE))
	)
)

(defrule recopilacion-prefs::establecer-nacionalidad "Establece las nacionalidades favoritas del usuario"
	?hecho <- (nacionalidad choose)
	?pref <- (preferencias)
	=>
	(bind $?obj-nacion (find-all-instances ((?inst Nacionalidad)) TRUE))
	(bind $?nom-nacion (create$ ))
	(loop-for-count (?i 1 (length$ $?obj-nacion)) do
		(bind ?curr-obj (nth$ ?i ?obj-nacion))
		(bind ?curr-nom (send ?curr-obj get-nacionalidad))
		(bind $?nom-nacion (insert$ $?nom-nacion (+ (length$ $?nom-nacion) 1) ?curr-nom))
	)
	(bind ?escogido (pregunta-multi "Escoja las nacionalidades que prefiera: " $?nom-nacion))
	
	(bind $?respuesta (create$ ))
	(loop-for-count (?i 1 (length$ ?escogido)) do
		(bind ?curr-index (nth$ ?i ?escogido))
		(bind ?curr-gen (nth$ ?curr-index ?obj-nacion))
		(bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-gen))
	)
	
	(retract ?hecho)
	(assert (nacionalidad TRUE))
	(modify ?pref (nacionalidades $?respuesta))
)

; si el idioma original es el mismo que el de la nacionalidad, tambien aumentamos algunos puntos

;;;  ----------------------------------------------

(defrule recopilacion-prefs::aclamado-critica "Establece si al usuario tiene un gusto como el de la critica"
	?hecho <- (aclamado-critica ask)
	(nacionalidad TRUE|FALSE)
	=>
	(bind ?respuesta (pregunta-si-no "Sueles leer BestSellers?"))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (aclamado-critica TRUE))
		else (assert (aclamado-critica FALSE))
	)
)

;;;  ----------------------------------------------

(defrule recopilacion-prefs::clasicos "Establece si el usuario tiene predileccion por los clasicos"
	?hecho <- (clasicos ask)
	(nacionalidad TRUE|FALSE)
	=>
	(bind ?respuesta (pregunta-si-no "Le gustan los libros clasicos?"))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (clasicos TRUE))
		else (assert (clasicos FALSE))
	)
)

;;;  ----------------------------------------------

(defrule recopilacion-prefs::version-original "Establece version-original"
	?hecho <- (vo ask)
	(nacionalidad TRUE|FALSE)
	=>
	(bind ?respuesta (pregunta-si-no "Prefieres leer libros en version original?"))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (vo choose))
		else (assert (vo FALSE))
	)
)


(defrule recopilacion-prefs::establecer-idiomas "Establece las nacionalidades favoritas del usuario"
	?hecho <- (vo choose)
	?pref <- (preferencias)
	=>
	(bind $?obj-idioma (find-all-instances ((?inst Idioma)) TRUE))
	(bind $?nom-idioma (create$ ))
	(loop-for-count (?i 1 (length$ $?obj-idioma)) do
		(bind ?curr-obj (nth$ ?i ?obj-idioma))
		(bind ?curr-nom (send ?curr-obj get-idioma))
		(bind $?nom-idioma(insert$ $?nom-idioma (+ (length$ $?nom-idioma) 1) ?curr-nom))
	)
	(bind ?escogido (pregunta-multi "Que idiomas entiendes? : " $?nom-idioma))
	
	(bind $?respuesta (create$ ))
	(loop-for-count (?i 1 (length$ ?escogido)) do
		(bind ?curr-index (nth$ ?i ?escogido))
		(bind ?curr-gen (nth$ ?curr-index ?obj-idioma))
		(bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-gen))
	)
	
	(retract ?hecho)
    (assert (vo TRUE))
	;(assert (idioma TRUE))
	(modify ?pref (idiomas $?respuesta))
)

;;;  ---------------------------------------------- 

(defrule recopilacion-prefs::preguntar-tematica-favorita "Pregunta al usuario si tiene alguna tematica favorita"
	?hecho <- (tematica-favorita ask)
	(nacionalidad ~ask&~choose)
	=>
	(bind ?respuesta (pregunta-si-no "Prefieres alguna tematica particular? "))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (tematica-favorita choose))
		else 
		(assert (tematica-favorita FALSE))
	)
)
		

(defrule recopilacion-prefs::establecer-tematica-favorita "Establece la tematica favorita del usuario"
	?hecho <- (tematica-favorita choose)
	?pref <- (preferencias)
	=>
	(bind $?obj-tem (find-all-instances ((?inst Tematica)) TRUE))
	(bind $?nom-tem (create$ ))
	(loop-for-count (?i 1 (length$ $?obj-tem)) do
		(bind ?curr-obj (nth$ ?i ?obj-tem))
		(bind ?curr-nom (send ?curr-obj get-tematica))
		(bind $?nom-tem(insert$ $?nom-tem (+ (length$ $?nom-tem) 1) ?curr-nom))
	)
	(bind ?escogido (pregunta-multi "Escoja sus tematicas favoritas: " $?nom-tem))
	
	(bind $?respuesta (create$ ))
	(loop-for-count (?i 1 (length$ ?escogido)) do
		(bind ?curr-index (nth$ ?i ?escogido))
		(bind ?curr-gen (nth$ ?curr-index ?obj-tem))
		(bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-gen))
	)
	
	(retract ?hecho)
	(assert (tematica-favorita TRUE))
	(modify ?pref (tematicas-favoritas $?respuesta))
)

;;;  ---------------------------------------------- 

(defrule recopilacion-prefs::habito-lectura "Pregunta al usuario si habito lectura"
	?hecho <- (habito-lectura ask)
	(nacionalidad ~ask&~choose)
	=>
	(bind ?respuesta (pregunta-si-no "Tienes un habito de lectura? "))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (habito-lectura choose))
		else 
		(assert (habito-lectura FALSE))
	)
)

(defrule recopilacion-prefs::dias-horas-semana "Pregunta al usuario si habito lectura"
	?hecho <- (habito-lectura choose)
	=>
	(bind ?d (pregunta-numerica "Cuantos dias a la semana sueles leer?: " 1 7))
    (bind ?h (pregunta-numerica "Cuantas horas dedicas a leer en esos dias?: " 1 24))

	(retract ?hecho)
	(assert (habito-lectura TRUE))
    (assert (horas-semana (* ?d ?h)))
	(if (> (* ?d ?h) 10 )
		then (assert (nivel-lectura alto))
		else (assert (nivel-lectura medio))
	)
)

(defrule recopilacion-prefs::nivel-lenguaje "Pregunta al usuario si tiene alto nivel lenguaje"
	?hecho <- (habito-lectura FALSE)
	=>
	(bind ?respuesta (pregunta-si-no "Tienes un buen nivel de lectura? "))
	(if (eq ?respuesta TRUE)
		then (assert (nivel-lectura medio))
		else 
		(assert (nivel-lectura bajo))
	)
)

;;;  ---------------------------------------------- 


(defrule recopilacion-prefs::preguntar-epoca-favorita "Pregunta al usuario si tiene alguna epoca favorita"
	?hecho <- (epoca-favorita ask)
	(nacionalidad ~ask&~choose)
	=>
	(bind ?respuesta (pregunta-si-no "Prefieres alguna epoca literaria en particular? "))
	(retract ?hecho)
	(if (eq ?respuesta TRUE)
		then (assert (epoca-favorita choose))
		else 
		(assert (epoca-favorita FALSE))
	)
)
		

(defrule recopilacion-prefs::establecer-epoca-favorita "Establece la epoca favorita del usuario"
	?hecho <- (epoca-favorita choose)
	?pref <- (preferencias)
	=>
	(bind $?obj-epc (find-all-instances ((?inst Epoca)) TRUE))
	(bind $?nom-epc (create$ ))
	(loop-for-count (?i 1 (length$ $?obj-epc)) do
		(bind ?curr-obj (nth$ ?i ?obj-epc))
		(bind ?curr-nom (send ?curr-obj get-epoca))
		(bind $?nom-epc(insert$ $?nom-epc (+ (length$ $?nom-epc) 1) ?curr-nom))
	)
	(bind ?escogido (pregunta-multi "Escoja sus epocas favoritas: " $?nom-epc))
	
	(bind $?respuesta (create$ ))
	(loop-for-count (?i 1 (length$ ?escogido)) do
		(bind ?curr-index (nth$ ?i ?escogido))
		(bind ?curr-epc (nth$ ?curr-index ?obj-epc))
		(bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-epc))
	)
	
	(retract ?hecho)
	(assert (epoca-favorita TRUE))
	(modify ?pref (epocas-favoritas $?respuesta))
)


;;;  ---------------------------------------------- 


(defrule recopilacion-prefs::pasar_modulo_procesado "Pasa al modulo de procesado de datos"
	(declare (salience -10))
	?h1 <- (genero-favorito TRUE|FALSE)
	?h3 <- (tematica-favorita TRUE|FALSE)
	?h6 <- (nacionalidad TRUE|FALSE)
	(vo TRUE|FALSE)
	=>
	(printout t "Procesando datos..." crlf)
	(focus procesado)
)


;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------


(defrule procesado::anadir-libros "Se anyade todas los libros, luego se filtran"
	=>
	(bind $?lista (find-all-instances ((?inst Libro)) TRUE))
	(progn$ (?curr-con ?lista)
		(make-instance (gensym) of Recomendacion (contenido ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
		;(printout t "-->" ?curr-con "<--" crlf)
	)	
)

;;;  ----------------------------------------------

(defrule procesado::aux-genero "Crea hechos para poder procesar los generos favoritos"
	(preferencias (generos-favoritos $?gen))
	?hecho <- (genero-favorito ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then 
		(progn$ (?curr-gen $?gen)
			(assert (genero-favorito ?curr-gen))
		)
	)
)


(defrule procesado::valorar-genero-favorito-libros "Se mejora la puntuacion de los libros de genero favorito"
	?hecho <- (genero-favorito ?gen)
	?cont <-(object (is-a Libro) (de_genero $?generos))
	(test (member$ ?gen $?generos))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just)) ;;;no es lo mismo??
	(not (valorado-genero-favorito ?cont ?gen))
	=>
	(bind ?p (+ ?p 7))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Pertenece al genero favorito " (send ?gen get-genero) " -> +7"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-genero-favorito ?cont ?gen))
)

;;;  ----------------------------------------------

(defrule procesado::aux-tematica "Crea hechos para poder procesar las tematicas favoritas"
	(preferencias (tematicas-favoritas $?tem))
	?hecho <- (tematica-favorita ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then 
		(progn$ (?curr-tem $?tem)
			(assert (tematica-favorita ?curr-tem))
		)
	)
)

(defrule procesado::valorar-tematica-favorito-libros "Se mejora la puntuacion de los libros de tematica favorito"
	?hecho <- (tematica-favorita ?tem)
	?cont <-(object (is-a Libro) (de_tematica $?tematicas))
	(test (member$ ?tem $?tematicas))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just)) ;;;no es lo mismo??
	(not (valorado-tematica-favorita ?cont ?tem))
	=>
	(bind ?p (+ ?p 10))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Pertenece a la tematica favorita " (send ?tem get-tematica) " -> +10"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-tematica-favorita ?cont ?tem))
)

;;;  ----------------------------------------------

(defrule procesado::aux-nacionalidad "Crea hechos para poder procesar las nacionalidades favoritas"
	(preferencias (nacionalidades $?nac))
	?hecho <- (nacionalidad ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then 
		(progn$ (?curr-nac $?nac)
			(assert (nacionalidad ?curr-nac))
		)
	)
)

(defrule procesado::valorar-nacionalidad "Se mejora la puntuacion de los libros de nacionalidades favoritas"
	?hecho <- (nacionalidad ?nac)
	?autor <-(object (is-a Autor) (de_nacionalidad $?nacionalidades))
	(test (member$ ?nac $?nacionalidades))
	?cont <-(object (is-a Libro) (de_autor ?autor2))
	(test (eq (instance-name ?autor) (instance-name ?autor2)))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorado-nacionalidad-favorita ?cont ?nac))
	=>

	(bind ?p (+ ?p 4))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Pertenece a la nacionalidad favorita " (send ?nac get-nacionalidad) " -> +4"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-nacionalidad-favorita ?cont ?nac))
)

;;;  ----------------------------------------------

(defrule procesado::aux-idiomas "Crea hechos para poder procesar los idiomas originales"
	(preferencias (idiomas $?idi))
	?hecho <- (vo ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then 
		(progn$ (?curr-idi $?idi)
			(assert (idioma ?curr-idi))
		)
	)
)

(defrule procesado::valorar-idioma-favorito-libros "Se mejora la puntuacion de los libros en idioma original"
	?hecho <- (idioma ?idi)
	?cont <-(object (is-a Libro) (en_idioma_original ?idi))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just)) ;;;no es lo mismo??
	(not (valorado-idioma ?cont))
	=>
	(bind ?p (+ ?p 4))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "En idioma original " (send ?idi get-idioma) " -> +4"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-idioma ?cont))
)


;;;  ----------------------------------------------

(defrule procesado::aux-epoca "Crea hechos para poder procesar las epocas favoritas"
	(preferencias (epocas-favoritas $?epc))
	?hecho <- (epoca-favorita ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then 
		(progn$ (?curr-epc $?epc)
			(assert (epoca-favorita ?curr-epc))
		)
	)
)


(defrule procesado::valorar-epocas-favoritas-libros "Se mejora la puntuacion de las epocas favoritas"
	?hecho <- (epoca-favorita ?epc)
	?cont <-(object (is-a Libro) (de_epoca ?epc))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just)) ;;;no es lo mismo??
	(not (valorado-epoca-favorita ?cont))
	=>
	(bind ?p (+ ?p 5))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Pertenece a la epoca favorita " (send ?epc get-epoca) " -> +5"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-epoca-favorita ?cont))
)



;;;  ----------------------------------------------

(defrule procesado::valorarar-populares "Se mejora la puntuacion de los libros populares"
	?hecho <- (aclamado-critica TRUE)
	?cont <- (object (is-a Libro) (es_popular TRUE))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just))	;no funciona, porque???
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorado-popular ?cont))

	=>

	(bind ?p (+ ?p 5))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Es un BestSeller " " -> + 5"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-popular ?cont))

)

;;;  ----------------------------------------------

(defrule procesado::valorarar-clasicos "Se mejora la puntuacion de los libros clasicos"
	?hecho <- (clasicos TRUE)
	?cont <- (object (is-a Libro) (es_clasico TRUE))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just))	;no funciona, porque???
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorado-clasico ?cont))

	=>

	(bind ?p (+ ?p 5))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Es un clasico " " -> + 5"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-clasico ?cont))

)

;;;  ----------------------------------------------


(defrule procesado::valorarar-nivel-lectura "Se mejora la puntuacion de los libros adecuados segun habito lectura"
	?hecho <- (nivel-lectura ?lvl)

	?cont <- (object (is-a Libro) (nivel_lenguaje ?lvl))
	?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	;?rec <- (object (is-a Recomendacion) (contenido ?cont) (puntuacion ?p) (justificaciones $?just))	;no funciona, porque???

	(not (valorado-nivel ?cont))

	=>

	(bind ?p (+ ?p 5))
	(send ?rec put-puntuacion ?p)
	(bind ?text (str-cat "Nivel lectura adecuado " ?lvl " -> + 5"))
	(bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-justificaciones $?just)
	(assert (valorado-nivel ?cont))

)

;;;  ----------------------------------------------


(defrule procesado::pasar-a-generacion "Pasa al modulo de generacion de respuestas"
	(declare(salience -10))
	=>
	(printout t "Generando respuesta..." crlf)
	(focus generacion)
)

;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------

(defrule generacion::crea-lista-recomendaciones "Se crea una lista de recomendaciones para ordenarlas"
	(not (lista-rec-desordenada))
	=>
	(assert (lista-rec-desordenada))
)

(defrule generacion::anyadir-recomendacion "Anyade una recomendacion a la lista de recomendaciones"
	(declare (salience 10))
	?rec <- (object (is-a Recomendacion))
	?hecho <- (lista-rec-desordenada (recomendaciones $?lista))
	(test (not (member$ ?rec $?lista)))
	=>
	(bind $?lista (insert$ $?lista (+ (length$ $?lista) 1) ?rec))
	(modify ?hecho (recomendaciones $?lista))
)

(defrule generacion::crea-lista-ordenada "Se crea una lista ordenada de contenido"
	(not (lista-rec-ordenada))
	(lista-rec-desordenada (recomendaciones $?lista))
	=>
	;;; Hacemos una ordenacion buscando maximo a cada paso (lento per simple de implementar)
	(bind $?resultado (create$ ))
	(while (and (not (eq (length$ $?lista) 0)) (< (length$ $?resultado) 3))  do
		(bind ?curr-rec (maximo-puntuacion $?lista))
		(bind $?lista (delete-member$ $?lista ?curr-rec))
		(bind $?resultado (insert$ $?resultado (+ (length$ $?resultado) 1) ?curr-rec))
	)
	(assert (lista-rec-ordenada (recomendaciones $?resultado)))
)


(defrule generacion::pasar-a-presentacion "Se pasa al modulo de presentacion"
	(lista-rec-ordenada)
	=>
	(focus presentacion)
)

;;;  ----------------------------------------------
;;;  ----------------------------------------------
;;;  ----------------------------------------------


;;; Modulo de presentacion de resultados ----------------------------------------------------

(defrule presentacion::mostrar-respuesta "Muestra el contenido escogido"
	(lista-rec-ordenada (recomendaciones $?resultado))
	(Usuario (nombre ?nombre))
	(not (final))
	=>
	(printout t crlf)
	(format t "%s, esta es nuestra recomendacion para usted. Esperamos que la disfrute!" ?nombre)
	(printout t crlf)
	(progn$ (?curr-dia $?resultado)
		(printout t (send ?curr-dia imprimir))
	)
	(assert (final))
)

