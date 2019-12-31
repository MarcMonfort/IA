import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomBinaryTree {
    public static void main(String[] args) {
        RandomBinaryTree w = new RandomBinaryTree();
        Node tree = w.randomBinaryTree(5);
        w.visitInOrder(tree);
    }

    /** in-order visit: (Left, Root, Right) */
    private void visitInOrder(Node tree) {
        if (tree == null) return;
        visitInOrder(tree.left);
        StringBuilder s=new StringBuilder();
        if (tree.d==0){
            s.append(0+"[root] ");
        }else if ( tree.left== null && tree.right== null){
            s.append(tree.d+"[leaf] ");
        }else {
            s.append(tree.d+"[internal] ");
        }
        System.out.print (s.toString());
        visitInOrder(tree.right);
    }

    /**
     * Generate binary tree with n internal nodes and n+1 leaf nodes
     * <p>
     * We start with a minimal tree with a root and two leaves.
     * Next we choose one of the leaves and then add two branches to it
     * We continue choosing leaves (randomly) and adding branches till
     * we have n+1 leaf nodes
     *
     * @param n
     * @return
     */
    Node randomBinaryTree(int n) {
        List<Node> nodeList = new ArrayList<>();
        int nodeIndex = 0;
        Node root = Node.of(nodeIndex++);
        Node firstLeaf = Node.of(nodeIndex++);
        Node secondLeaf = Node.of(nodeIndex++);
        root.left = firstLeaf;
        root.right = secondLeaf;
        nodeList.add(firstLeaf);
        nodeList.add(secondLeaf);
        Random random = new Random();

        while (nodeList.size() < n + 1) {
            int nextInternalNodeIndex = random.nextInt(nodeList.size());
            Node internalNode = nodeList.get(nextInternalNodeIndex);
            internalNode.left = Node.of(nodeIndex++);
            internalNode.right = Node.of(nodeIndex++);
            nodeList.remove(nextInternalNodeIndex);
            nodeList.add(internalNode.left);
            nodeList.add(internalNode.right);
        }
        return root;

    }

    static class Node {
        int d;
        Node left, right;

        static Node of(int v) {
            return new Node(v);
        }

        Node(int v) {
            this.d = v;
        }
    }
}