package zeniware.common.plugin.vo;

public class TreeNodeVo {

  private String id;
  private String parent;
  private String text;
  private String icon;
  private boolean children;
  private TreeNodeStateVo state;
  
  public TreeNodeVo() { }
  
  public String getId() {
    return this.id;
  }
  
  public TreeNodeVo setId(String id) {
    this.id = id;
    return this;
  }
  
  public String getParent() {
    return this.parent;
  }
  
  public TreeNodeVo setParent(String parent) {
    this.parent = parent;
    return this;
  }
  
  public String getText() {
    return this.text;
  }
  
  public TreeNodeVo setText(String text) {
    this.text = text;
    return this;
  }
  
  public String getIcon() {
    return this.icon;
  }
  
  public TreeNodeVo setIcon(String icon) {
    this.icon = icon;
    return this;
  }
  
  public boolean getChildren() {
    return this.children;
  }
  
  public TreeNodeVo setChildren(boolean children) {
    this.children = children;
    return this;
  }
  
  public TreeNodeStateVo getState() {
    return this.state;
  }
  
  public TreeNodeVo setState(TreeNodeStateVo state) {
    this.state = state;
    return this;
  }
  
}
