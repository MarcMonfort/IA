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
		BicingHeuristicFunction2 bHeur = new BicingHeuristicFunction2();

		for (int i = 0; i < board.getNFurgos(); ++i) {
			
			for (int f = 0; f < board.getNumEst(); ++f) { // puede que sea estupido hacer nuevo for dependiendo de la solucion inicial //no influye
				if (!board.getEsOrigen(f) && board.getBicisLibres(f) > 0) {
					Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
					Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
					Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
					int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
					boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

					BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2, bicisLibres,
							esOrigen);

					newBoard.changeOrigen(i, f);
					double v = bHeur.getHeuristicValue(newBoard);
					String S = "Beneficio("+ -v + ")\n" + newBoard.toString();
					retval.add(new Successor(S, newBoard));
					//System.out.println(S);
				}
			}
			
			
			if ((int) board.getFurgoOrigen(i).getFirst() != -1) { // changeDest1 && changeDest2 && swapDest1
				for (int j = 0; j < board.getNumEst(); ++j) {
					if (board.getBicisLibres(j) < 0) {

						// changeDest1

						Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
						Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
						Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
						int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
						boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

						BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2, bicisLibres,
								esOrigen);

						newBoard.changeDest1(i, j);
						double v = bHeur.getHeuristicValue(newBoard);
						String S = "Beneficio("+ -v + ")\n" + newBoard.toString();
						retval.add(new Successor(S, newBoard));
						//System.out.println(S);

						// changeDest2
						if ((int) board.getFurgoDest1(i).getFirst() != -1) {
							origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
							dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
							dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
							bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
							esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

							newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2, bicisLibres, esOrigen);

						
							newBoard.changeDest2(i, j);
							v = bHeur.getHeuristicValue(newBoard);
							S = "Beneficio("+ -v + ")\n" + newBoard.toString();
							retval.add(new Successor(S, newBoard));
							//System.out.println(S);
						}
					}

				}

				for (int z = i; z < board.getNFurgos(); ++z) {
					if ((int) board.getFurgoOrigen(z).getFirst() != -1 ) {
						
						//swapDest1
						if ((int) board.getFurgoDest1(i).getFirst() != -1 || (int) board.getFurgoDest1(z).getFirst() != -1) {
							Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
							Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
							Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
							int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
							boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

							BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2,
									bicisLibres, esOrigen);

							newBoard.swapDest1(i, z);
							double v = bHeur.getHeuristicValue(newBoard);
							String S = "Beneficio("+ -v + ")\n" + newBoard.toString();
							retval.add(new Successor(S, newBoard));
							// System.out.println(S);
						}
						//swapDest2 -- casi no se usa
						if (((int) board.getFurgoDest2(i).getFirst() != -1 || (int) board.getFurgoDest2(z).getFirst() != -1) && ((int) board.getFurgoDest1(i).getFirst() != -1 && (int) board.getFurgoDest1(z).getFirst() != -1)) {
							Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
							Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
							Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
							int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
							boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

							BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2,
									bicisLibres, esOrigen);

							newBoard.swapDest2(i, z);
							double v = bHeur.getHeuristicValue(newBoard);
							String S = "Beneficio("+ -v + ")\n" + newBoard.toString();
							retval.add(new Successor(S, newBoard));
							// System.out.println(S);
						}
					}
				}
				
				//swatDest1Dest2			se usa poco
				if ((int) board.getFurgoDest2(i).getFirst() != -1) { // existe Dest1 y Dest2
					Pair[] origen = Arrays.copyOf(board.getOrigen(), board.getNFurgos());
					Pair[] dest1 = Arrays.copyOf(board.getDest1(), board.getNFurgos());
					Pair[] dest2 = Arrays.copyOf(board.getDest2(), board.getNFurgos());
					int[] bicisLibres = Arrays.copyOf(board.getBicisLibres(), board.getNumEst());
					boolean[] esOrigen = Arrays.copyOf(board.getEsOrigen(), board.getNumEst());

					BicingBoard newBoard = new BicingBoard(board.getNFurgos(), origen, dest1, dest2, bicisLibres,
							esOrigen);

					newBoard.swapDest1Dest2(i);
					double v = bHeur.getHeuristicValue(newBoard);
					String S = "Beneficio("+ -v + ")\n" + newBoard.toString();
					retval.add(new Successor(S, newBoard));
					//System.out.println(S);
				}
				
			}
			
			

		}

		return retval;

	}

}
