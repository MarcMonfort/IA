package IA.ProbBicing;

import java.util.ArrayList;
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
	private static int[][] distEst;

	private int nfurgos;
	private Pair[] origen;
	private Pair[] dest1;
	private Pair[] dest2;

	/* Constructor */
	public BicingBoard(int f) {
		// Random myRandom=new Random();
		origen = new Pair[f];
		dest1 = new Pair[f];
		dest2 = new Pair[f];
		nfurgos = f;

		for (int i = 0; i < f; ++i) {
			origen[i] = new Pair(-1, 0);
			dest1[i] = new Pair(-1, 0);
			dest2[i] = new Pair(-1, 0);
		}

	}

	public BicingBoard(int f, Pair[] origen, Pair[] dest1, Pair[] dest2) {
		// Random myRandom=new Random();

		this.origen = origen;
		this.dest1 = dest1;
		this.dest2 = dest2;
		nfurgos = f;
	}
	
	//ALGO RARO
	
	public static void setEstaciones(int nest, int nbic, int dem, int seed) {
		est = new Estaciones(nest, nbic, dem, seed);
		numEst = est.size();
		distEst = new int[nest][nest];
		
		for (int i = 0; i < nest; ++i) {
			for (int j = i+1; j < nest; ++j) {
				distEst[i][j] = Math.abs(est.get(i).getCoordX() - est.get(j).getCoordX()) + Math.abs(est.get(i).getCoordY() - est.get(j).getCoordY());
				distEst[j][i] = distEst[i][j];
			}
		}
	}
	
	
	//GETTERS

	public int getNFurgos() {
		return (nfurgos);
	}
	
	public int getNumEst() {
		//System.out.println("bbb" + nest);
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

	
	public int distEst(int i, int j) {
		return (distEst[i][j]);
	}
	
	
	
	
	
	
	//FIN-GETERS
	public void changeOrigen(int i, int id2) {
		Object n = origen[i].getSecond();
		origen[i] = new Pair(id2, n);
	}
	public void changeDest1(int i, int id2) {
		Object n = dest1[i].getSecond();
		dest1[i] = new Pair(id2, n);
	}
	
	public void changeDest2(int i, int id2) {
		Object n = dest2[i].getSecond();
		dest2[i] = new Pair(id2, n);
	}
	
	// Intercambia origen de furgo 1 con furgo 2
	// i != j
	// orgien[i] != dest1[j] y != dest2[j]
	// origen[j] != dest1[i] y != dest2[i]

	public void swapOrigen(int i, int j) {
		Pair tmp;
		tmp = origen[i];
		origen[i] = origen[j];
		origen[j] = tmp;
	}

	// Intercambio dest1 (no el num de bicicletas dejadas)
	// dest1[i].getFirst() != -1; dest1[j].getFirst() != -1;
	// dest1[i] != origen[j] y != dest2[j]
	// dest1[j] != origen[i] y != dest2[i]
	public void swapDest1(int i, int j) {
		Object id1 = dest1[j].getFirst();
		Object id2 = dest1[i].getFirst();

		Object n = dest1[i].getSecond();
		dest1[i] = new Pair(id1, n);

		n = dest1[j].getSecond();
		dest1[j] = new Pair(id2, n);
	}

	// Intercambio dest1 (no el num de bicicletas dejadas)
	// dest2[i].getFirst() != -1; dest2[i].getFirst() != -1;
	// no puede haber destino 2 sin destino 1
	// dest2[i] != origen[j] y != dest1[j]
	// dest2[j] != origen[i] y != dest1[i]
	public void swapDest2(int i, int j) {
		Object id1 = dest2[j].getFirst();
		Object id2 = dest2[i].getFirst();

		Object n = dest2[i].getSecond();
		dest2[i] = new Pair(id1, n);

		n = dest2[j].getSecond();
		dest2[j] = new Pair(id2, n);
	}

	// Poda: dist origen -> Dest1 > origen -> Dest2
	public void swapDest1Dest2(int i) {
		Pair tmp;
		tmp = dest1[i];
		dest1[i] = dest2[i];
		dest2[i] = tmp;
	}

	// n != origen[i].getSecond();
	public void changeCargaOrigen(int i, int n) {
		Object id = origen[i].getFirst();
		origen[i] = new Pair(id, n);
	}

	// n < origen[i].getSecond();
	// if dest2[i].getFirst() == -1 --> n == origen[i].getSecond;
	public void changeDescargaDest1(int i, int n) {
		Object id = dest1[i].getFirst();
		dest1[i] = new Pair(id, n);
	}

	// n == origen[i].getSecond - dest1[i].getSecond
	public void changeDescargaDest2(int i, int n) {
		Object id = dest2[i].getFirst();
		dest2[i] = new Pair(id, n);
	}

	
	
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
