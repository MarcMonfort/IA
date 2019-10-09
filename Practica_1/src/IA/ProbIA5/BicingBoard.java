package IA.ProbIA5;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import IA.Bicing.*;
import aima.util.Pair;


/**
 * Created by bejar on 17/01/17.
 */
public class BicingBoard {
    
	//private static final ArrayList<Estacion> = Estaciones(int nest, int nbic, int dem, int seed);
	
    //List<Pair<String, Integer>> list = new ArrayList<Pair<String, Integer>>();
	
	private static Estaciones est;
	
    private int nfurgos;
    private Pair[] origen;
    private Pair[] dest1;
    private Pair[] dest2;

    
    /* Constructor */
    public BicingBoard(int f, int nest, int nbic, int dem, int seed) {
    	//Random myRandom=new Random();
    	
    	origen = new Pair[f];
    	dest1 = new Pair[f];
    	dest2 = new Pair[f];
    	nfurgos = f;
    	
    	for (int i = 0; i < f; ++i) {
    		origen[i] = new Pair(-1,0);
    		dest1[i] = new Pair(-1,0);
    		dest2[i] = new Pair(-1,0);
    	}
    	
    	est = new Estaciones(nest, nbic, dem, seed);
    }
    
    public BicingBoard(int f, Pair[] origen, Pair[] dest1, Pair[] dest2, int nest, int nbic, int dem, int seed) {
    	//Random myRandom=new Random();
    	
    	this.origen = origen;
    	this.dest1 = dest1;
    	this.dest2 = dest2;
    	nfurgos = f;
    	
    	est = new Estaciones(nest, nbic, dem, seed);
    }
    
    
    public int getNFurgos() {return(nfurgos);}
    
    public Pair[] getOrigen() {return(origen);}
    
    public Pair[] getDest1() {return(dest1);}

    public Pair[] getDest2() {return(dest2);}
    
    
    //Intercambia origen de furgo 1 con furgo 2
    public void swapOrigen(int i, int j) {
    	Pair tmp;
    	
    	tmp = origen[i];
    	origen[i] = origen[j];
    	origen[j] = origen[i];
    }
    
    public void changeOrigen(int i, int n) {
    	Object id = origen[i].getFirst();
    	origen[i] = new Pair(id, n);
}	
    	
    
    
    

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
