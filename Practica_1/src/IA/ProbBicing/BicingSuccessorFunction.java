package IA.ProbBicing;

import aima.search.framework.SuccessorFunction;
import aima.util.Pair;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by bejar on 17/01/17
 */
public class BicingSuccessorFunction implements SuccessorFunction {

	public List getSuccessors(Object state) {
		ArrayList retval = new ArrayList();
		BicingBoard board = (BicingBoard) state;
		BicingHeuristicFunction bHeur = new BicingHeuristicFunction();

		// Some code here
		// (flip all the consecutive pairs of coins and generate new states
		// Add the states to retval as Succesor("flip i j", new_state)
		// new_state has to be a copy of state
		for (int i = 0; i < board.getNFurgos(); ++i) {
			// ProbIA5Board newBoard= new ProbIA5Board(board.getConfiguration());
			for (int j = 0; j < board.getNumEst(); ++j) {
				
				Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
				Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
				Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());				
				int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
				boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());
				
				BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2, bicisLibres, esOrigen);
				//newBoard.changeCargaOrigen(i, 100);
				//newBoard.changeOrigen(i, j);
				if (newBoard.getBicisLibres(j) < 0) newBoard.changeDest1(i, j);
				//newBoard.changeDescargaDest1(i, 100);


				double v = bHeur.getHeuristicValue(newBoard);
				
				String S = "Beneficio(" + v + ") ---> \n" + newBoard.toString();
				
				retval.add(new Successor(S, newBoard));
				System.out.println(S);

				//System.out.println(newBoard.toString() + "   " + v);
				
			}

			/*for (int j = 0; j < 20; ++j) {

			}*/

		}

		// System.out.println("\n");
		//System.out.println("hola");
		return retval;

	}

}
