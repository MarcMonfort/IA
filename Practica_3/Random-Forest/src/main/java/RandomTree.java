import java.io.IOException;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.prefs.PreferenceChangeEvent;

import com.sun.source.tree.Tree;
import javafx.util.Pair;
public class RandomTree {

    /* We represent Predecesors (and Parallels) as an array of pairs (p, s) so that
       p -> s,  p is predecessor of s (or p is parallel of s, if Parallels)
    */
    private static ArrayList<Pair<Integer, Integer>> Predecessors = new ArrayList<>();
    private static ArrayList<Integer> Leidos = new ArrayList<>();
    private static ArrayList<Integer> Paginas = new ArrayList<>();
    private static StringBuilder bufferparal = new StringBuilder();
    private static StringBuilder bufferpre = new StringBuilder();
    //private ArrayList<Pair<Integer, Integer>> Parallels = new ArrayList<>();

    public static void finding_precedences(TreeNode predecessor, TreeNode successor) {
        for (TreeNode child: successor.getChildren()) {
            if (successor.getData() != child.getData()) Predecessors.add(new Pair(new Integer(predecessor.getData()), new Integer(child.getData())));
            finding_precedences(predecessor, child);
        }
    }


    private static int last_node;

    public static void pddl(boolean extension2){
        InputOutput user_input = new InputOutput();
        System.out.println("(define (problem ext3-1)\n" +
                " (:domain ext3)\n" +
                " (:objects\n" +
                "  Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre - mes");
        for(int i = 1; i <= last_node; ++i) System.out.println(i + " ");
        System.out.println("- libro\n" +
                ")");
        System.out.print("(:init\n" +
                "  (pre Enero Febrero)\n" +
                "  (anterior Enero Febrero)\n" +
                "  (anterior Enero Marzo)\n" +
                "  (anterior Enero Abril)\n" +
                "  (anterior Enero Mayo)\n" +
                "  (anterior Enero Junio)\n" +
                "  (anterior Enero Julio)\n" +
                "  (anterior Enero Agosto)\n" +
                "  (anterior Enero Septiembre)\n" +
                "  (anterior Enero Octubre)\n" +
                "  (anterior Enero Noviembre)\n" +
                "  (anterior Enero Diciembre)\n" +
                "\n" +
                "  (pre Febrero Marzo)\n" +
                "  (anterior Febrero Marzo)\n" +
                "  (anterior Febrero Abril)\n" +
                "  (anterior Febrero Mayo)\n" +
                "  (anterior Febrero Junio)\n" +
                "  (anterior Febrero Julio)\n" +
                "  (anterior Febrero Agosto)\n" +
                "  (anterior Febrero Septiembre)\n" +
                "  (anterior Febrero Octubre)\n" +
                "  (anterior Febrero Noviembre)\n" +
                "  (anterior Febrero Diciembre)\n" +
                "\n" +
                "  (pre Marzo Abril)\n" +
                "  (anterior Marzo Abril)\n" +
                "  (anterior Marzo Mayo)\n" +
                "  (anterior Marzo Junio)\n" +
                "  (anterior Marzo Julio)\n" +
                "  (anterior Marzo Agosto)\n" +
                "  (anterior Marzo Septiembre)\n" +
                "  (anterior Marzo Octubre)\n" +
                "  (anterior Marzo Noviembre)\n" +
                "  (anterior Marzo Diciembre)\n" +
                "\n" +
                "  (pre Abril Mayo)\n" +
                "  (anterior Abril Mayo)\n" +
                "  (anterior Abril Junio)\n" +
                "  (anterior Abril Julio)\n" +
                "  (anterior Abril Agosto)\n" +
                "  (anterior Abril Septiembre)\n" +
                "  (anterior Abril Octubre)\n" +
                "  (anterior Abril Noviembre)\n" +
                "  (anterior Abril Diciembre)\n" +
                "\n" +
                "\t(pre Mayo Junio)\n" +
                "  (anterior Mayo Junio)\n" +
                "  (anterior Mayo Julio)\n" +
                "  (anterior Mayo Agosto)\n" +
                "  (anterior Mayo Septiembre)\n" +
                "  (anterior Mayo Octubre)\n" +
                "  (anterior Mayo Noviembre)\n" +
                "  (anterior Mayo Diciembre)\n" +
                "\n" +
                "\t(pre Junio Julio)\n" +
                "  (anterior Junio Julio)\n" +
                "  (anterior Junio Agosto)\n" +
                "  (anterior Junio Septiembre)\n" +
                "  (anterior Junio Octubre)\n" +
                "  (anterior Junio Noviembre)\n" +
                "  (anterior Junio Diciembre)\n" +
                "\n" +
                "\t(pre Julio Agosto)\n" +
                "  (anterior Julio Agosto)\n" +
                "  (anterior Julio Septiembre)\n" +
                "  (anterior Julio Octubre)\n" +
                "  (anterior Julio Noviembre)\n" +
                "  (anterior Julio Diciembre)\n" +
                "\n" +
                "\t(pre Agosto Septiembre)\n" +
                "  (anterior Agosto Septiembre)\n" +
                "  (anterior Agosto Octubre)\n" +
                "  (anterior Agosto Noviembre)\n" +
                "  (anterior Agosto Diciembre)\n" +
                "\n" +
                "\t(pre Septiembre Octubre)\n" +
                "  (anterior Septiembre Octubre)\n" +
                "  (anterior Septiembre Noviembre)\n" +
                "  (anterior Septiembre Diciembre)\n" +
                "\n" +
                "\t(pre Octubre Noviembre)\n" +
                "  (anterior Octubre Noviembre)\n" +
                "  (anterior Octubre Diciembre)\n" +
                "  \n" +
                "\t(pre Noviembre Diciembre)\n" +
                "  (anterior Noviembre Diciembre)");
        System.out.println(bufferparal.toString());
        System.out.println(bufferpre.toString());
        for(int i = 0; i < Leidos.size(); ++i) System.out.println("(leido " + Leidos.get(i) + ")");
        Leidos.removeAll(Leidos);
        if (extension2) {
            System.out.println("(= (paginas Enero) 0)\n" +
                    "  (= (paginas Febrero) 0)\n" +
                    "  (= (paginas Marzo) 0)\n" +
                    "  (= (paginas Abril) 0)\n" +
                    "  (= (paginas Mayo) 0)\n" +
                    "  (= (paginas Junio) 0)\n" +
                    "  (= (paginas Julio) 0)\n" +
                    "  (= (paginas Agosto) 0)\n" +
                    "  (= (paginas Septiembre) 0)\n" +
                    "  (= (paginas Octubre) 0)\n" +
                    "  (= (paginas Noviembre) 0)\n" +
                    "  (= (paginas Diciembre) 0)");
            for (int i = 0; i < last_node; ++i)
                System.out.println("(= (paginas " + i + 1 + ") " + Paginas.get(i) + ")");
            Paginas.removeAll(Paginas);
        }
        for(int i = 1; i <= last_node; ++i){
            int random = ThreadLocalRandom.current().nextInt(1, 10);
            if (random < 4) System.out.println("(leer " + i + ")");
        }
        System.out.println(")\n" +
                "  (:goal (and (forall (?l2 - libro) (imply (leer ?l2)\n" +
                "                                (asignado ?l2)))\n" +
                "              ;(forall (?m2 - mes) (<= (paginas ?m2) 800))       \n" +
                "                                )\n" +
                "  )\n" +
                "\n" +
                "  ;(:metric minimize (paginas-totales))\n" +
                ")");
    }

    public static void main(String[] args) throws IOException {

        InputOutput user_input = new InputOutput();
        if (args.length != 4) {InputOutput.usage(); return;}

        /*Integer TREES = user_input.input("Introuduce the MAX number of trees you want in the forest (min. 3)");
        if (TREES <= 2) {System.out.println("Number of trees must be > 2"); return;}
        Integer depth = user_input.input("Introuduce the MAX depth you want for any of the trees (min. 3)");
        if (depth <= 2) {System.out.println("Depth must be > 2"); return;}
        Integer degree = user_input.input("Introuduce the MAX degree you want for any of the trees (min. 3)");
        if (degree <= 2) {System.out.println("Depth must be > 2"); return;}*/

        int TREES = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[0]));
        //System.out.println("We are generating " + TREES + " trees" + '\n');

        int value = -1;
        last_node = 0;

        for (int T = 0; T < TREES; T++) {
            //System.out.println('\n' + "Generating Tree " + (Integer) (T+1) + '\n');
            /* This one is a "ghost" node, doesn't represents any book */
            value++;
            TreeNode root = new TreeNode(value, false, 0);
            LinkedList<TreeNode> queue = new LinkedList<>();
            ArrayList<TreeNode> list_nodes = new ArrayList<>();
            Map<Integer, List<Integer>> Parallels = new HashMap<Integer, List<Integer>>();
            queue.add(root);

            int random; int level = 1;

            int depth = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[1]));
            int degree = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[2]));

            //System.out.println("Depth of this tree is, at most: " + depth);
            //System.out.println("Degree for nodes of this tree is, at most: " + degree + '\n');
            while (level < depth) {
                int size = queue.size();
                while (size > 0) {
                    TreeNode parent = queue.pollFirst();
                    for (int i = 0; i < degree; i++) {
                        random = ThreadLocalRandom.current().nextInt(1, 10);  //Random generation of successors; Note: parallels are those in the same level
                        if (random <= 6) {  /* Change this value for altering probability of adding a new node */
                            value++;
                            boolean leido = false;
                            random = ThreadLocalRandom.current().nextInt(1, 10);
                            if (random <= 4) leido = true;
                            int paginas = ThreadLocalRandom.current().nextInt(50, 801);
                            Paginas.add(paginas);
                            TreeNode child = new TreeNode(value, leido, paginas);
                            if (leido)
                            //if (value > last_node) last_node = value;
                            parent.addChild(child);
                            queue.add(child); list_nodes.add(child);
                        }
                    }
                    size -= 1;
                }
                level += 1;
            }
            last_node = value;
            /* We generate list of predecessors for a tree. Note: transitivity is not assumed => explicitly outputted */
            for (int index = 0; index < list_nodes.size(); index++) {
                finding_precedences(list_nodes.get(index), list_nodes.get(index));
            }
            bufferpre.append(user_input.print_predecessors(Predecessors));
            Predecessors.removeAll(Predecessors);
            TreeUtils.doDFS(root, true, 1, Parallels);
            bufferparal.append(user_input.print_parallels(Parallels));
        }
        pddl(args[3] == "1");
    }
}
