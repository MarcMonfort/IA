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

public class BicingHeuristicFunction implements HeuristicFunction {

	/* First criteria only */
	public double getHeuristicValue(Object state) {

		/*
		 * This method evaluates the cost of a solution only taking into account the
		 * benefits and losses caused by modifying the number of bycicles of a station
		 */

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
	

}
