import java.util.ArrayList;
import java.util.List;

public class TreeNode {
    private int data;
    private boolean leido;
    private int paginas;
    private List<TreeNode> children;

    public TreeNode(int data, boolean leido, int paginas) {
        this.data = data;
        this.leido = leido;
        this.paginas = paginas;
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

    public boolean isLeido() {
        return leido;
    }

    public int getPaginas() {
        return paginas;
    }

    public void setPaginas(int paginas) {
        this.paginas = paginas;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }

    public List<TreeNode> getChildren() {
        return children;
    }
}
