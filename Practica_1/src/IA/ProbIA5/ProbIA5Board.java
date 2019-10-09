package IA.ProbIA5;

/**
 * Created by bejar on 17/01/17.
 */
public class ProbIA5Board {
    
	//private static final ArrayList<Estacion> = Estaciones(int nest, int nbic, int dem, int seed);
    
	private int [] board;
    private static int [] solution;

    /* Constructor */
    public ProbIA5Board(int []init, int[] goal) {

        board = new int[init.length];
        solution = new int[init.length];

        for (int i = 0; i< init.length; i++) {
            board[i] = init[i];
            solution[i] = goal[i];
        }

    }
    
   /* public BicingBoard(ArrayList<Estacion>int []init, int[] goal) {

        

    }*/
    
    
    

    /* vvvvv TO COMPLETE vvvvv */
    public void flip_it(int i){
        // flip the coins i and i + 1
    	board[i] = 1-board[i]; 
    	i = (i+1)%board.length;
    	board[i] = 1-board[i]; 
    }

    /* Heuristic function */
    public double heuristic(){
        // compute the number of coins out of place respect to solution
    	double sum = 0;
    	for(int i = 0; i < board.length; ++i) {
    		if (board[i] != solution[i]) ++sum;
    	}
        return sum;
    }

     /* Goal test */
     public boolean is_goal(){
         // compute if board = solution
    	 for(int i = 0; i < board.length; ++i) {
     		if (board[i] != solution[i]) return false;
     	}
         return true;
     }

     /* auxiliary functions */

     // Some functions will be needed for creating a copy of the state
     
     public int [] getBoard() {
    	 return board;
     }
     public int [] getSolution() {
    	 return solution;
     }
     
     public String toString(){
    	 String retVal = "|";
    	 for (int i = 0; i < board.length; ++i) {
    		 retVal = retVal + board[i] + "|";
    	 }
         return retVal;
      }
     
     public int getLength() {
    	 return board.length;
     }

    /* ^^^^^ TO COMPLETE ^^^^^ */

}
