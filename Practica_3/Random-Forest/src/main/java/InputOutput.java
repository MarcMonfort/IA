import java.util.LinkedList;
import java.util.concurrent.ThreadLocalRandom;

public class TreeUtils {
    public static int getRandomInt() {
        return ThreadLocalRandom.current().nextInt(0, 1000000);
    }

    public static void doBFS(TreeNode root, boolean verbose) {
        if (root==null)
            return;

        LinkedList<TreeNode> queue = new LinkedList<>();
        queue.add(root);

        while (!queue.isEmpty()) {
            TreeNode node = queue.pop();
            if (verbose) System.out.println(node.getData());
            for (TreeNode child: node.getChildren()) {
                queue.add(child);
            }
        }
    }

    public static void doDFS(TreeNode root, Boolean verbose, int level) {
        if (root==null)
            return;

        if (verbose) System.out.println(root.getData() + ' ' + child.getPaginas() + " at level " + level);
        level += 1;
        for (TreeNode child: root.getChildren()) {
            System.out.println(child.getData() + ' ' + child.getPaginas() +  " at level " + level);
        }
        for (TreeNode child: root.getChildren()) {
            doDFS(child, false, level);
        }
    }
}
