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

		int[] est = new int[board.getNEst()];
		
		for (int i = 0; i < board.getNFurgos(); ++i) {
			
			Pair Pb = board.getFurgoOrigen(i);
			int id = (int) Pb.getFirst();
			if (id != -1) {
				est[id] = - (int) Pb.getSecond();
				
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
		return sum;
	}
		
		
		/*
		 * First thing we do is, for every van,checking whether it is used and, in
		 * positive case, evaluate impact of remo- ving bikes from origin station
		 */
		/*HashMap<Integer, Integer> table = new HashMap<Integer, Integer>();
		for (int i = 0; i < board.getNFurgos(); ++i) {
			if ((int) board.getOrigen(i).getFirst() != -1) {
				table.put(state.getOrigen[i].getKey(), -state.getOrigen[i].getValue());
				if (board.getDest1(i).getKey() != -1) {
					int new_nb = state.getDest1().getValue();
					int val = table.get(state.getDest1().getKey());
					if (val != null)
						new_nb += val;
					table.put(state.getDest1[i].getKey(), new_nb);

					if (state.getDest2().getKey() != 1) {
						new_nb = state.getDest2().getValue();
						val = table.get(state.getDest2().getKey());
						if (val != null)
							new_nb += val;
						table.put(state.getDest1[i].getKey(), new_nb);
					}
				}
			}
		}*/
		/*
		 * At this point we have, for each station, the total number of bikes that will
		 * be transported
		 */
		/*for (Integer key : table.keySet()) {
			int k = table.get(key);
			if (k >= 0) { // We add bikes

				/*
				 * IMPORTANT!!! Necessito accés a l'estructura d'estacions => getters al file
				 * Board o fer-la pública
				 */

				/*int delta = state.est[key].getDemanda() - (state.est[key].getNumBicicletasNext() + k);
				if (delta >= 0)
					sum += k;
				else
					sum += state.est[key].getDemanda() - state.est[key].getNumBicicletasNext();
			} else { // We remove bikes
				if (state.est[key].getNumBicicletasNext() + k < state.est[key].getDemanda()) {
					if (state.est[key].getNumBicicletasNext() < state.est[key].getDemanda())
						sum += k;
					else
						sum += (k + (state.est[key].getNumBicicletasNext() - state.est[key].getDemanda()));
				}
			}
		}
		return sum;
	}*/

	/* Mixing both criterias */
	/*public double getHeuristicSecondValue(Object state) {
	}*/
}
