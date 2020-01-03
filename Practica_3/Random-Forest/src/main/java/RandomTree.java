import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.concurrent.ThreadLocalRandom;
import java.util.prefs.PreferenceChangeEvent;

import com.sun.source.tree.Tree;
import javafx.util.Pair;
public class RandomTree {

    /* We represent Predecesors (and Parallels) as an array of pairs (p, s) so that
       p -> s,  p is predecessor of s (or p is parallel of s, if Parallels)
    */
    private static ArrayList<Pair<Integer, Integer>> Predecessors = new ArrayList<>();
    private ArrayList<Pair<Integer, Integer>> Parallels = new ArrayList<>();

    public static void finding_precedences(TreeNode predecessor, TreeNode successor) {
        for (TreeNode child: successor.getChildren()) {
            if (successor.getData() != child.getData()) Predecessors.add(new Pair(new Integer(predecessor.getData()), new Integer(child.getData())));
            finding_precedences(predecessor, child);
        }
    }

    public static void main(String[] args) throws IOException {

        InputOutput user_input = new InputOutput();
        if (args.length < 3) {InputOutput.usage(); return;}

        /*Integer TREES = user_input.input("Introuduce the MAX number of trees you want in the forest (min. 3)");
        if (TREES <= 2) {System.out.println("Number of trees must be > 2"); return;}
        Integer depth = user_input.input("Introuduce the MAX depth you want for any of the trees (min. 3)");
        if (depth <= 2) {System.out.println("Depth must be > 2"); return;}
        Integer degree = user_input.input("Introuduce the MAX degree you want for any of the trees (min. 3)");
        if (degree <= 2) {System.out.println("Depth must be > 2"); return;}*/

        int TREES = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[1]));
        System.out.println("We are generating " + TREES + " trees" + '\n');

        int value = -1;

        for (int T = 0; T < TREES; T++) {
            System.out.println('\n' + "Generating Tree " + (Integer) (T+1) + '\n');
            /* This one is a "ghost" node, doesn't represents any book */
            value++;
            TreeNode root = new TreeNode(value, false, 0);
            LinkedList<TreeNode> queue = new LinkedList<>();
            ArrayList<TreeNode> list_nodes = new ArrayList<>();
            queue.add(root);

            int random; int level = 1;

            int depth = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[2]));
            int degree = ThreadLocalRandom.current().nextInt(2, Integer.parseInt(args[3]));

            System.out.println("Depth of this tree is, at most: " + depth);
            System.out.println("Degree for nodes of this tree is, at most: " + degree + '\n');
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
                            TreeNode child = new TreeNode(value, leido, paginas);
                            parent.addChild(child);
                            queue.add(child); list_nodes.add(child);
                        }
                    }
                    size -= 1;
                }
                level += 1;
            }
            TreeUtils.doDFS(root, true, 1);
            /* We generate list of predecessors for a tree. Note: transitivity is not assumed => explicitly outputted */
            for (int index = 0; index < list_nodes.size(); index++) {
                finding_precedences(list_nodes.get(index), list_nodes.get(index));
            }
            user_input.print_predecessors(Predecessors);
            Predecessors.removeAll(Predecessors);
        }
    }
}
