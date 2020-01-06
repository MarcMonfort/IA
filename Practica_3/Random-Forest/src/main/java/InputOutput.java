import javafx.util.Pair;

import java.util.ArrayList;
import java.util.Scanner;

class InputOutput {
    public static Integer input(String message) {
        try {
            Scanner myObj = new Scanner(System.in);  // Create a Scanner object
            System.out.println(message);
            Integer input_data = myObj.nextInt();  // Read user input
            return input_data;
        } catch (Exception e) {
            System.out.println("Invalid input format");
            return 0;
        }
    }

    public static void usage() {
        //System.out.println("Expected input expects following parameters:");
        //System.out.println("Number_Trees, Max Depth, Max Degree");
    }

    public void print_predecessors(ArrayList<Pair<Integer, Integer>> Predecessors) {
        for (int i = 0; i < Predecessors.size(); i++)
            System.out.println("(predecesor " + Predecessors.get(i).getKey() + ' ' + Predecessors.get(i).getValue() + ')');
    }
}
