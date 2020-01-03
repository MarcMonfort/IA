#include <stdlib.h>
#include <iostream>

using namespace std;

int main(){
    int status = system("java RandomTree 3 3 3");
    cout << "(define (problem ext3-1)\n" << 
 "(:domain ext3)\n" <<
 "(:objects\n" <<
  "Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - mes\n";
  PR_1 PR_2 PR_3 PR_4 PR_5 - libro
  PA_1 PA_2 PA_3 PA_4 PA_5 - libro
 cout << ")\n"
 "(:init\n" <<
  "(pre Enero Febrero)\n" <<
  "(anterior Enero Febrero)\n" <<
  "(anterior Enero Marzo)\n" <<
  "(anterior Enero Abril)\n" <<
  "(anterior Enero Mayo)\n" <<
  "(anterior Enero Junio)\n" <<
  "(anterior Enero Julio)\n" <<
  "(anterior Enero Agosto)\n" <<
  "(anterior Enero Septiembre)\n" <<
  "(anterior Enero Octubre)\n" <<
  "(anterior Enero Noviembre)\n" <<
  "(anterior Enero Diciembre)\n" <<

  "(pre Febrero Marzo)\n" <<
  "(anterior Febrero Marzo)\n" <<
  "(anterior Febrero Abril)\n" <<
  "(anterior Febrero Mayo)\n" <<
  "(anterior Febrero Junio)\n" <<
  "(anterior Febrero Julio)\n" <<
  "(anterior Febrero Agosto)\n" <<
  "(anterior Febrero Septiembre)\n" <<
  "(anterior Febrero Octubre)\n" <<
  "(anterior Febrero Noviembre)\n" <<
  "(anterior Febrero Diciembre)\n" <<

  "(pre Marzo Abril)\n" <<
  "(anterior Marzo Abril)\n" <<
  "(anterior Marzo Mayo)\n" <<
  "(anterior Marzo Junio)\n" <<
  (anterior Marzo Julio)\n" <<
  (anterior Marzo Agosto)\n" <<
  (anterior Marzo Septiembre)\n" <<
  (anterior Marzo Octubre)\n" <<
  (anterior Marzo Noviembre)\n" <<
  (anterior Marzo Diciembre)\n" <<

  (pre Abril Mayo)\n" <<
  (anterior Abril Mayo)\n" <<
  (anterior Abril Junio)\n" <<
  (anterior Abril Julio)\n" <<
  (anterior Abril Agosto)\n" <<
  (anterior Abril Septiembre)\n" <<
  (anterior Abril Octubre)\n" <<
  (anterior Abril Noviembre)\n" <<
  (anterior Abril Diciembre)\n" <<

	(pre Mayo Junio)\n" <<
  (anterior Mayo Junio)\n" <<
  (anterior Mayo Julio)\n" <<
  (anterior Mayo Agosto)\n" <<
  (anterior Mayo Septiembre)\n" <<
  (anterior Mayo Octubre)\n" <<
  (anterior Mayo Noviembre)\n" <<
  (anterior Mayo Diciembre)\n" <<

	(pre Junio Julio)\n" <<
  (anterior Junio Julio)\n" <<
  (anterior Junio Agosto)\n" <<
  (anterior Junio Septiembre)\n" <<
  (anterior Junio Octubre)\n" <<
  (anterior Junio Noviembre)\n" <<
  (anterior Junio Diciembre)\n" <<

	(pre Julio Agosto)\n" <<
  (anterior Julio Agosto)\n" <<
  (anterior Julio Septiembre)\n" <<
  (anterior Julio Octubre)\n" <<
  (anterior Julio Noviembre)\n" <<
  (anterior Julio Diciembre)\n" <<

	(pre Agosto Septiembre)\n" <<
  (anterior Agosto Septiembre)\n" <<
  (anterior Agosto Octubre)\n" <<
  (anterior Agosto Noviembre)\n" <<
  (anterior Agosto Diciembre)\n" <<

	(pre Septiembre Octubre)\n" <<
  (anterior Septiembre Octubre)\n" <<
  (anterior Septiembre Noviembre)\n" <<
  (anterior Septiembre Diciembre)\n" <<

	(pre Octubre Noviembre)\n" <<
  (anterior Octubre Noviembre)\n" <<
  (anterior Octubre Diciembre)\n" <<
  
	(pre Noviembre Diciembre)\n" <<
  (anterior Noviembre Diciembre)\n" <<


  ; - - - - - - - - - - - - -   Predecesores\n" <<


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


; - - - - - - - - - - - - -		Fluentes\n" <<

  (= (paginas Enero) 0)\n" <<
  (= (paginas Febrero) 0)\n" <<
  (= (paginas Marzo) 0)\n" <<
  (= (paginas Abril) 0)\n" <<
  (= (paginas Mayo) 0)\n" <<
  (= (paginas Junio) 0)\n" <<
  (= (paginas Julio) 0)\n" <<
  (= (paginas Agosto) 0)\n" <<
  (= (paginas Septiembre) 0)\n" <<
  (= (paginas Octubre) 0)\n" <<
  (= (paginas Noviembre) 0)\n" <<
  (= (paginas Diciembre) 0)\n" <<

  (= (paginas PR_1) 700)
  (= (paginas PR_2) 700)
  (= (paginas PR_3) 700)
  (= (paginas PR_4) 700)
  (= (paginas PR_5) 700)

  (= (paginas PA_1) 100)
  (= (paginas PA_2) 300)
  (= (paginas PA_3) 300)
  (= (paginas PA_4) 200)
  (= (paginas PA_5) 500)


  ; - - - - - - - - - - - - -		Leidos\n" <<

  ;(leido PA_2)

  ; - - - - - - - - - - - - -   Leer\n" <<

  (leer PA_5)
  (leer PR_5)

  )
  (:goal (and (forall (?l2 - libro) (imply (leer ?l2)\n" <<
                                (asignado ?l2)))\n" <<
              ;(forall (?m2 - mes) (<= (paginas ?m2) 800))   \n" <<    
                                )\n" <<
  )\n" <<

  ;(:metric minimize (paginas-totales))\n" <<
)\n" <<

    
}
