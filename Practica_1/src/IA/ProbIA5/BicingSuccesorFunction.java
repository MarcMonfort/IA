package IA.ProbIA5;

import aima.search.framework.SuccessorFunction;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bejar on 17/01/17
 */
public class BicingSuccesorFunction implements SuccessorFunction{

    public List getSuccessors(Object state){
        ArrayList retval = new ArrayList();
        BicingBoard board = (BicingBoard) state;

        // Some code here
        // (flip all the consecutive pairs of coins and generate new states
        // Add the states to retval as Succesor("flip i j", new_state)
        // new_state has to be a copy of state
        
        for (int i = 0; i < board.getLength(); ++i) {
        	//ProbIA5Board newBoard= new ProbIA5Board(board.getConfiguration());
        	BicingBoard newBoard= new BicingBoard(board.getBoard(),board.getSolution());
            newBoard.flip_it(i);
            retval.add(new Successor(new String("flip: " + i +" "+newBoard.toString()),newBoard));
            System.out.println(newBoard.toString());
            
        }
        
        System.out.println("\n");

        return retval;

    }

}
