package IA.ProbBicing;
import java.lang.Math;


/**
 * Created by bejar on 17/01/17.
 */

import aima.search.framework.HeuristicFunction;
import aima.util.Pair;

/*public class BicingHeuristicFunction implements HeuristicFunction {

    public double getHeuristicValue(Object n){

        return ((BicingBoard) n).heuristic();
    }
}*/

import java.util.*;

import IA.Bicing.Estacion;

public class BicingHeuristicFunction2 implements HeuristicFunction {

	/* First criteria only */
	public double getHeuristicValue_xxx(Object state) {

		/*
		 * This method evaluates the cost of a solution only taking into account the
		 * benefits and losses caused by modifying the number of bycicles of a station
		 */
		//System.out.println("holallaaaaa");
		BicingBoard board = (BicingBoard) state;
		double sum = 0;

		int[] est = new int[board.getNumEst()];
		
		for (int i = 0; i < board.getNFurgos(); ++i) {
			
			Pair Pb = board.getFurgoOrigen(i);
			int id = (int) Pb.getFirst();
			if (id != -1) {
				est[id] = -(int)Pb.getSecond();
				
				Pb = board.getFurgoDest1(i);
				id = (int) Pb.getFirst();
				if (id != -1) {
					est[id] += (int) Pb.getSecond();
					
					Pb = board.getFurgoDest2(i);
					id = (int) Pb.getFirst();
					if (id != -1) {
						est[id] += (int) Pb.getSecond();
					}
				}
			}
		}
		
		for (int i = 0; i < est.length; ++i) {
			if (est[i] != 0) {
				Estacion e = board.getEst(i);
				if (e.getNumBicicletasNext() <= e.getDemanda()) {
					sum += Math.min(e.getNumBicicletasNext() + est[i], e.getDemanda()) - e.getNumBicicletasNext();
				}
				else {
					sum += Math.min(e.getNumBicicletasNext() + est[i], e.getDemanda()) - e.getDemanda();
				}
			}
		}
		return -sum;
	}
	
	/* This second criteria is just a balance between between benefits obtained by making stations
	being closer to their demand point, and resources we spend by moving those bikes */
	
	public double getHeuristicValue(Object state) {
		double benefit_demand = getHeuristicValue_xxx(state);
		double costs_transport = 0;

		BicingBoard board = (BicingBoard) state;

		for (int i = 0; i < board.getNFurgos(); i++) {
			Pair pO = board.getFurgoOrigen(i);
			if ((int)pO.getFirst() != -1) {
				int nb = (int) pO.getSecond();
				
				Pair pD1 = board.getFurgoDest1(i);
				if ((int)pD1.getFirst() != -1) {
					double kms = (board.distEst((int)pO.getFirst(), (int)pD1.getFirst())/1000);
					costs_transport += kms*((int)((nb+9)/10));
					
					Pair pD2 = board.getFurgoDest2(i);
					if ((int)pD2.getFirst() != -1) {
						nb -= (int)pD1.getSecond();
						kms = (board.distEst((int)pD1.getFirst(), (int)pD2.getFirst())/1000);
						
						costs_transport += kms*((int)((nb+9)/10));
					}
				}
			}
		}
		return (double) (benefit_demand + costs_transport);
	}
			

}
