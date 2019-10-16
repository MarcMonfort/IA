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
		System.out.println("holallaaaaa");
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
		System.out.println("----------" + benefit_demand);

		BicingBoard board = (BicingBoard) state;

		for (int i = 0; i < board.getNFurgos(); i++) {
			Pair Pb = board.getFurgoOrigen(i);
			int origen = (int) Pb.getFirst();
			if (origen != -1) {
				int nb = (int) Pb.getSecond();
				Estacion e = board.getEst(origen);
				int point_origen_x = e.getCoordX(), point_origen_y = e.getCoordY();
				Pb = board.getFurgoDest1(i);
				int dest1 = (int) Pb.getFirst();
				e = board.getEst(dest1);
				int point_dest1_x = e.getCoordX(), point_dest1_y = e.getCoordY();
				double kms = (Math.abs(point_origen_x - point_dest1_x) + Math.abs(point_origen_y - point_dest1_y))/1000;  //distance in Km
				costs_transport += kms*((int)((nb+9)/10));

				Pb = board.getFurgoDest2(i);
				int dest2 = (int) Pb.getFirst();
				if (dest2 != -1) {
					e = board.getEst(dest2);
					int point_dest2_x = e.getCoordX(), point_dest2_y = e.getCoordY();
					kms = (Math.abs(point_dest2_x - point_dest1_x) + Math.abs(point_dest2_y - point_dest1_y));
					nb = (int) Pb.getSecond();
					costs_transport += kms*((int)((nb+9)/10));
				}
			}
		}
		System.out.println("++++++++++++" + benefit_demand);
		System.out.println("++++++mm+++++" + costs_transport);
		return (double) (benefit_demand - costs_transport);
	}

}
