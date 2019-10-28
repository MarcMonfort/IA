import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;
import aima.util.Pair;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import IA.Bicing.Estaciones;
import IA.ProbBicing.BicingBoard;
import IA.ProbBicing.BicingGoalTest;
import IA.ProbBicing.BicingHeuristicFunction;
import IA.ProbBicing.BicingHeuristicFunction2;
import IA.ProbBicing.BicingSuccessorFunction;
import IA.ProbBicing.BicingSuccessorFunctionSA;
import java.util.Scanner;

public class Main {


	public static void main(String[] args) {
		
		
		Random myRandom = new Random();
		
		int f;
		int nest;
		int nbic;
		int dem;
		int seed;
		
		
		Scanner in = new Scanner(System.in);
		System.out.print("Numero de furgonetas: ");
        f = in.nextInt();
        System.out.print("Numero de estaciones : ");
        nest = in.nextInt();
        System.out.print("Numero de bicicletas : ");
        nbic = in.nextInt();
        System.out.print("Tipo de demanda (0 = Equilibrada; 1 = Hora Punta): ");
        dem = in.nextInt();
        System.out.print("Semilla : ");
        seed = in.nextInt();
        
		
		/*
		f = Integer.parseInt(args[0]);
		nest = Integer.parseInt(args[1]);
		nbic = Integer.parseInt(args[2]);
		dem = Integer.parseInt(args[3]);
		seed = Integer.parseInt(args[4]);
		*/

		//seed = myRandom.nextInt(9999);
		
		BicingBoard.setEstaciones(nest, nbic, dem, seed);
		BicingBoard BB = new BicingBoard(f);
		
		long start = System.currentTimeMillis();
		BicingHillClimbingSearch(BB);
		long end = System.currentTimeMillis();
		System.out.println("Time:  " + (end - start) + " ms");
		
		System.out.println();
		
		start = System.currentTimeMillis();
		BicingSimulatedAnnealingSearch(BB);
		end = System.currentTimeMillis();
		System.out.println("Time:  " + (end - start) + " ms");
		
		//System.out.println("Time:  " + (end - start) + " ms");
	}

	private static void BicingHillClimbingSearch(BicingBoard BB) {
		System.out.println("\nTSP HillClimbing  --------->");
		try {
			Problem problem = new Problem(BB, new BicingSuccessorFunction(), new BicingGoalTest(), new BicingHeuristicFunction2());
			
			Search search = new HillClimbingSearch();
			SearchAgent agent = new SearchAgent(problem, search);
			
			System.out.println();
			
			//printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
			
			
			BicingHeuristicFunction2 bHeur = new BicingHeuristicFunction2();
			double v = bHeur.getHeuristicValue(search.getGoalState());
			System.out.println(search.getGoalState());		//solucion final
			System.out.println("Beneficio(€):   " + -v);
			System.out.println("Distancia(km):   " + getDistance(search.getGoalState()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//borrar despues---
	private static double getDistance(Object state) {
		//double costs_transport = 0;
		double kms = 0;
		BicingBoard board = (BicingBoard) state;

		for (int i = 0; i < board.getNFurgos(); i++) {
			Pair pO = board.getFurgoOrigen(i);
			if ((int)pO.getFirst() != -1) {
				int nb = (int) pO.getSecond();
				
				Pair pD1 = board.getFurgoDest1(i);
				if ((int)pD1.getFirst() != -1) {
					if (nb != 0) kms += (board.distEst((int)pO.getFirst(), (int)pD1.getFirst())/1000);
					//costs_transport += kms*((int)((nb+9)/10));
					
					Pair pD2 = board.getFurgoDest2(i);
					if ((int)pD2.getFirst() != -1) {
						nb -= (int)pD1.getSecond();
						if (nb != 0) kms += (board.distEst((int)pD1.getFirst(), (int)pD2.getFirst())/1000);
						
						//costs_transport += kms*((int)((nb+9)/10));
					}
				}
			}
		}
		return (double) (kms);
	}

	private static void BicingSimulatedAnnealingSearch(BicingBoard BB) {
		System.out.println("\nTSP Simulated Annealing  --------->");
		try {
			Problem problem = new Problem(BB, new BicingSuccessorFunctionSA(), new BicingGoalTest(),
					new BicingHeuristicFunction2());
			SimulatedAnnealingSearch search = new SimulatedAnnealingSearch(100000, 200, 1, 0.01);
			// search.traceOn();
			SearchAgent agent = new SearchAgent(problem, search);

			System.out.println();
			//printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
			
			
			BicingHeuristicFunction2 bHeur = new BicingHeuristicFunction2();
			double v = bHeur.getHeuristicValue(search.getGoalState());
			System.out.println(search.getGoalState());		//solucion final
			System.out.println("Beneficio(€):   " + -v);
			System.out.println("Distancia(km):   " + getDistance(search.getGoalState()));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void printInstrumentation(Properties properties) {
		Iterator keys = properties.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			System.out.println(key + " : " + property);
		}

	}

	private static void printActions(List actions) {
		for (int i = 0; i < actions.size(); i++) {
			String action = (String) actions.get(i);
			System.out.println(action);
		}
	}

}
