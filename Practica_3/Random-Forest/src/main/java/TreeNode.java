import java.util.ArrayList;
import java.util.List;

public class TreeNode {
    private int data;
    private List<TreeNode> children;

    public TreeNode(int data) {
        this.data = data;
        this.children = new ArrayList<TreeNode>();
    }

    public void addChild(TreeNode node) {
        this.children.add(node);
    }

    public int getData() {
        return data;
    }

    public void setData(int data) {
        this.data = data;
    }

    public List<TreeNode> getChildren() {
        return children;
    }
}
