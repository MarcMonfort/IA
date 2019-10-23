package IA.ProbBicing;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.lang.Math;

import IA.Bicing.*;
import aima.util.Pair;

/**
 * Created by bejar on 17/01/17.
 */
public class BicingBoard {

	// private static final ArrayList<Estacion> = Estaciones(int nest, int nbic, int
	// dem, int seed);

	// List<Pair<String, Integer>> list = new ArrayList<Pair<String, Integer>>();

	private static Estaciones est;
	private static int numEst;
	private static double[][] distEst;

	private int nfurgos;
	private Pair[] origen;
	private Pair[] dest1;
	private Pair[] dest2;

	int[] bicisLibres;
	boolean[] esOrigen;
	
	private static final int MAX_FURGO = 30;

	/* Constructor */
	public BicingBoard(int f) {
		// Random myRandom=new Random();
		origen = new Pair[f];
		dest1 = new Pair[f];
		dest2 = new Pair[f];
		nfurgos = f;

		bicisLibres = new int[numEst];
		esOrigen = new boolean[numEst];

		for (int i = 0; i < numEst; ++i) {
			bicisLibres[i] = Math.min(Math.min(est.get(i).getNumBicicletasNoUsadas(), est.get(i).getNumBicicletasNext() - est.get(i).getDemanda()),MAX_FURGO);
		}

		
		for (int i = 0; i < f; ++i) {
			int max = 0;
			int id = -1;
			boolean stop = false;
			for (int j = 0; j < numEst && !stop; ++j) {
				if (bicisLibres[j] > max && !esOrigen[j]) {
					max = bicisLibres[j];
					id = j;
					if (max == MAX_FURGO) stop = true;
				}

			}
			origen[i] = new Pair(id, 0);
			if (id != -1) esOrigen[id] = true;

			dest1[i] = new Pair(-1, 0);
			dest2[i] = new Pair(-1, 0);
		}
		//solucion random
		
		/*for (int i = 0; i < f; ++i) {
			boolean stop = false;
			int id = -1;
			for (int j = 0; j < numEst && !stop; ++j) {
				if (bicisLibres[j] > 5 && !esOrigen[j]) {
					id = j;
					stop = true;
				}

			}
			origen[i] = new Pair(id , 0);
			if (id != -1) esOrigen[id] = true;
			dest1[i] = new Pair(-1, 0);
			dest2[i] = new Pair(-1, 0);
		}*/
		
	}

	public BicingBoard(int f, Pair[] origen, Pair[] dest1, Pair[] dest2, int[] bicisLibres, boolean[] esOrigen) {
		// Random myRandom=new Random();

		this.origen = origen;
		this.dest1 = dest1;
		this.dest2 = dest2;
		nfurgos = f;
		this.bicisLibres = bicisLibres;
		this.esOrigen = esOrigen;
	}

	// ALGO RARO

	public static void setEstaciones(int nest, int nbic, int dem, int seed) {
		est = new Estaciones(nest, nbic, dem, seed);
		numEst = est.size();
		distEst = new double[nest][nest];

		for (int i = 0; i < nest; ++i) {
			for (int j = i + 1; j < nest; ++j) {
				distEst[i][j] = Math.abs(est.get(i).getCoordX() - est.get(j).getCoordX())+ Math.abs(est.get(i).getCoordY() - est.get(j).getCoordY());
				distEst[j][i] = distEst[i][j];
			}
		}
	}

	// GETTERS

	public int getNFurgos() {
		return (nfurgos);
	}

	public int getNumEst() {
		return (numEst);
	}

	public Estaciones getEstaciones() {
		return (est);
	}

	public Estacion getEst(int i) {
		return (est.get(i));
	}

	public Pair[] getOrigen() {
		return (origen);
	}

	public Pair[] getDest1() {
		return (dest1);
	}

	public Pair[] getDest2() {
		return (dest2);
	}

	public Pair getFurgoOrigen(int i) {
		return (origen[i]);
	}

	public Pair getFurgoDest1(int i) {
		return (dest1[i]);
	}

	public Pair getFurgoDest2(int i) {
		return (dest2[i]);
	}

	public double distEst(int i, int j) {
		return (distEst[i][j]);
	}

	public int[] getBicisLibres() {
		return bicisLibres;
	}

	public int getBicisLibres(int i) {
		return bicisLibres[i];
	}

	public boolean[] getEsOrigen() {
		return esOrigen;
	}
	public boolean getEsOrigen(int i) {
		return esOrigen[i];
	}

	// FIN-GETERS
	//solo si el origen idE no esta coigdo y tiene exceso
	public void changeOrigen(int i, int idE) { // nada//habira que adaptar todo
		
		if (!esOrigen[idE]) {
			if ((int)origen[i].getFirst() != -1) {
				bicisLibres[(int)origen[i].getFirst()] += (int)origen[i].getSecond();
				esOrigen[(int)origen[i].getFirst()] = false;
				origen[i] = new Pair(idE, 0);
				esOrigen[idE] = true;
				
				if ((int)dest1[i].getFirst() != -1 ) {
					bicisLibres[(int)dest1[i].getFirst()] -= (int)dest1[i].getSecond();
					int a = (int)dest1[i].getFirst();
					dest1[i] = new Pair(-1, 0);
					changeDest1(i, a);
					
					if ((int)dest2[i].getFirst() != -1 ) {
						bicisLibres[(int)dest2[i].getFirst()] -= (int)dest2[i].getSecond();
						a = (int)dest2[i].getFirst();
						dest2[i] = new Pair(-1, 0);
						changeDest2(i, a);
					}
				}
			}
			else {
				origen[i] = new Pair(idE, 0);
			}
		}
	}

	// solo si existe origen // solo remplazar si hay bicis que poner // no es
	// origen y diff de cero , vamos que si es negativo..
	public void changeDest1(int i, int idEst) { // cambiar numero bicis origen // es rentable?
		int nAnt = (int) dest1[i].getSecond(); // antigua
		if ((int) dest1[i].getFirst() != -1) { // se podria quitar mas codigo si se cumple esto...
			bicisLibres[(int) dest1[i].getFirst()] -= nAnt;
		}
		int n = -bicisLibres[idEst]; // esta en negativo

		if (n < nAnt) {
			dest1[i] = new Pair(idEst, n);
			bicisLibres[idEst] = 0;
			if ((int) dest2[i].getFirst() != -1 && bicisLibres[(int) dest2[i].getFirst()] < 0) { // existe dest2?
				int p = bicisLibres[(int) dest2[i].getFirst()];
				if (p > n - nAnt) { // se puede poner al maximo y puede que sobren (pra origen)
					dest2[i] = new Pair(dest2[i].getFirst(), (int) dest2[i].getSecond() + (-p)); // error??? se crea
																									// antes o
																									// despues???? o
																									// referencia
					bicisLibres[(int) dest2[i].getFirst()] = 0;
					origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() - (nAnt - n + p));
					bicisLibres[(int) origen[i].getFirst()] += (nAnt - n + p);
				} else { // se ponen todas
					dest2[i] = new Pair(dest2[i].getFirst(), (int) dest2[i].getSecond() + nAnt - n);
					bicisLibres[(int) dest2[i].getFirst()] += (nAnt - n);
					// el origen no lo tocamos
				}
			}

			else { // no existe dest2! o no nos importa (p>0)
				origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() - (nAnt - n));
				bicisLibres[(int) origen[i].getFirst()] += (nAnt - n);
			}
		} else { // n > Ant
			// dest1[i] = new Pair(idEst, n);
			int r = bicisLibres[(int) origen[i].getFirst()];

			if (r > 0) {
				dest1[i] = new Pair(idEst, Math.min(nAnt + r, n));
				bicisLibres[idEst] += Math.min(nAnt + r, n);

				origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() + Math.min(n - nAnt, r)); // referencia??
																													// error?
				bicisLibres[(int) origen[i].getFirst()] -= Math.min(n - nAnt, r);
			} else {

				dest1[i] = new Pair(idEst, nAnt);
				bicisLibres[idEst] += nAnt;

			}
		}
	}

	// solo si existe dest1
	public void changeDest2(int i, int idEst) { // cambiar numero bicis origen // es rentable?
		int nAnt = (int) dest2[i].getSecond(); // antigua
		if ((int) dest2[i].getFirst() != -1) {
			bicisLibres[(int) dest2[i].getFirst()] -= nAnt;
		}
		int n = -bicisLibres[idEst]; // esta en negativo

		if (n < nAnt) {
			dest2[i] = new Pair(idEst, n);
			bicisLibres[idEst] = 0;

			origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() - (nAnt - n));
			bicisLibres[(int) origen[i].getFirst()] += (nAnt - n);
		}

		else {
			int r = bicisLibres[(int) origen[i].getFirst()];
			//int f = 17;
			//int d = 3;
			/*System.out.println("uff" + Math.min(est.get(f).getNumBicicletasNoUsadas(),
					est.get(f).getNumBicicletasNext() - est.get(f).getDemanda()));
			System.out.println("uff" + Math.min(est.get(d).getNumBicicletasNoUsadas(),
					est.get(d).getNumBicicletasNext() - est.get(d).getDemanda()));*/
			if (r > 0) {
				dest2[i] = new Pair(idEst, Math.min(nAnt + r, n));
				bicisLibres[idEst] += Math.min(nAnt + r, n);

				origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() + Math.min(n - nAnt, r)); // referencia??
																													// error?
				bicisLibres[(int) origen[i].getFirst()] -= Math.min(n - nAnt, r);
			} else {
				dest2[i] = new Pair(idEst, nAnt);
				bicisLibres[idEst] += nAnt;

			}
		}
	}

	// Intercambia origen de furgo 1 con furgo 2
	// i != j
	// orgien[i] != dest1[j] y != dest2[j]
	// origen[j] != dest1[i] y != dest2[i]

	/*public void swapOrigen(int i, int j) { // eliminar //con restriccon de numero bicis //conservar n
		Pair tmp;
		tmp = origen[i];
		origen[i] = origen[j];
		origen[j] = tmp;
	}*/

	// Intercambio dest1 (no el num de bicicletas dejadas)
	// dest1[i].getFirst() != -1; dest1[j].getFirst() != -1;
	// dest1[i] != origen[j] y != dest2[j] //daigual
	// dest1[j] != origen[i] y != dest2[i]
	public void swapDest1(int i, int j) { // poner n la mejor posible, adaptar origen

		int id1 = (int) dest1[i].getFirst();
		int id2 = (int) dest1[j].getFirst();
		
		if (id1 != -1) {
			bicisLibres[(int) origen[i].getFirst()] += (int) dest1[i].getSecond();
			origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() - (int) dest1[i].getSecond());
			bicisLibres[id1] -= (int) dest1[i].getSecond();
			dest1[i] = new Pair(-1, 0);
		}
		if (id2 != -1) {
			bicisLibres[(int) origen[j].getFirst()] += (int) dest1[j].getSecond();
			origen[j] = new Pair(origen[j].getFirst(), (int) origen[j].getSecond() - (int) dest1[j].getSecond());
			bicisLibres[id2] -= (int) dest1[j].getSecond();
			dest1[j] = new Pair(-1, 0);
		}

		if (id2 != -1) changeDest1(i, id2);
		if (id1 != -1) changeDest1(j, id1);
		
		//actualizar dest"???
		if ((int)dest2[i].getFirst() != -1 && bicisLibres[(int)origen[i].getFirst()] > 0 && bicisLibres[(int)dest2[i].getFirst()] < 0) {		//no entra nunca??
			int a = Math.min(bicisLibres[(int)origen[i].getFirst()], -bicisLibres[(int)dest2[i].getFirst()]);
			dest2[i] = new Pair(dest2[i].getFirst(), (int) dest2[i].getSecond() + a);
			bicisLibres[(int)dest2[i].getFirst()] += a;
			
			origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() + a);
			bicisLibres[(int) origen[i].getFirst()] -= a;
			
			
		}
		if ((int)dest2[j].getFirst() != -1 && bicisLibres[(int)origen[j].getFirst()] > 0 && bicisLibres[(int)dest2[j].getFirst()] < 0) {		//no entra nunca??
			int a = Math.min(bicisLibres[(int)origen[j].getFirst()], -bicisLibres[(int)dest2[j].getFirst()]);
			dest2[j] = new Pair(dest2[j].getFirst(), (int) dest2[j].getSecond() + a);
			bicisLibres[(int)dest2[j].getFirst()] += a;
			
			origen[j] = new Pair(origen[j].getFirst(), (int) origen[j].getSecond() + a);
			bicisLibres[(int) origen[j].getFirst()] -= a;
			
			
		}
		
	}

	// Intercambio dest1 (no el num de bicicletas dejadas)
	// dest2[i].getFirst() != -1; dest2[i].getFirst() != -1;
	// no puede haber destino 2 sin destino 1
	// dest2[i] != origen[j] y != dest1[j]
	// dest2[j] != origen[i] y != dest1[i]
	public void swapDest2(int i, int j) { // poner n la mejor posible, adaptar origen
		int id1 = (int) dest2[i].getFirst();
		int id2 = (int) dest2[j].getFirst();
		if (id1 != -1) {
			bicisLibres[(int) origen[i].getFirst()] += (int) dest2[i].getSecond();
			origen[i] = new Pair(origen[i].getFirst(), (int) origen[i].getSecond() - (int) dest2[i].getSecond());
			bicisLibres[id1] -= (int) dest2[i].getSecond();
			dest2[i] = new Pair(-1, 0);
		}
		if (id2 != -1) {
			bicisLibres[(int) origen[j].getFirst()] += (int) dest2[j].getSecond();
			origen[j] = new Pair(origen[j].getFirst(), (int) origen[j].getSecond() - (int) dest2[j].getSecond());
			bicisLibres[id2] -= (int) dest2[j].getSecond();
			dest2[j] = new Pair(-1, 0);
		}

		if (id2 != -1) changeDest2(i, id2);
		if (id1 != -1) changeDest2(j, id1);
	}

	// Poda: dist origen -> Dest1 > origen -> Dest2
	public void swapDest1Dest2(int i) { // tambien passar la n del primer al segun destino (msimo en dest)
		Pair tmp;
		tmp = dest1[i];		//error referencia??
		dest1[i] = dest2[i];
		dest2[i] = tmp;
		
		//se deberia de modificar tambien las bicis que dejamos en cada lugar... pero mucho trabajo...
	}

	

	
	//eliminar dest1 // dest2 //origen?
	
	
	/* Heuristic function */

	public String toString() {
		String retVal = "Origen = |";
		String Dest1 = "Dest1 = |";
		String Dest2 = "Dest2 = |";
		for (int i = 0; i < nfurgos; ++i) {
			retVal = retVal + origen[i] + "|";
			Dest1 = Dest1 + dest1[i] + "|";
			Dest2 = Dest2 + dest2[i] + "|";
		}
		retVal = retVal + "\n";
		Dest1 = Dest1 + "\n";
		retVal = retVal + Dest1 + Dest2 + "\n";
		return retVal;
	}

	/* ^^^^^ TO COMPLETE ^^^^^ */

}
