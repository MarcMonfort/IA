import javafx.util.Pair;

import java.util.*;

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
    public StringBuilder print_parallels(Map<Integer, List<Integer>> Parallels) {
        StringBuilder paralelos = new StringBuilder();
        Set< Map.Entry< Integer,List<Integer>> > st = Parallels.entrySet();
        for (Map.Entry< Integer,List<Integer>> me:st) {
            if (me.getValue().size() > 1) {
                for (int i = 0; i < me.getValue().size(); i++){
                    for(int j = i; j < me.getValue().size(); ++j) {
                        paralelos.append("(paralelo " + me.getValue().get(i) + " " + me.getValue().get(j) + ")");
                    }
                    paralelos.append("\n");
                }
                paralelos.append("\n");
            }
        }
        return paralelos;
    }

    public static void usage() {
        //System.out.println("Expected input expects following parameters:");
        //System.out.println("Number_Trees, Max Depth, Max Degree");
    }

    public StringBuilder print_predecessors(ArrayList<Pair<Integer, Integer>> Predecessors) {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < Predecessors.size(); i++)
            s.append("(predecesor " + Predecessors.get(i).getKey() + ' ' + Predecessors.get(i).getValue() + ')' + "\n");
        s.append("\n");
        return s;
    }
}
