package zeniware.admin.pluginman.vo;

import java.util.Map;

public class TreeNode {

  private String id;
  private String parent;
  private String text;
  private String icon;
  private boolean children;
  private Map<String, Object> state;
  
  public TreeNode() { }
  
  public String getId() {
    return this.id;
  }
  
  public TreeNode setId(String id) {
    this.id = id;
    return this;
  }
  
  public String getParent() {
    return this.parent;
  }
  
  public TreeNode setParent(String parent) {
    this.parent = parent;
    return this;
  }
  
  public String getText() {
    return this.text;
  }
  
  public TreeNode setText(String text) {
    this.text = text;
    return this;
  }
  
  public String getIcon() {
    return this.icon;
  }
  
  public TreeNode setIcon(String icon) {
    this.icon = icon;
    return this;
  }
  
  public boolean getChildren() {
    return this.children;
  }
  
  public TreeNode setChildren(boolean children) {
    this.children = children;
    return this;
  }
  
  public Map<String, Object> getState() {
    return this.state;
  }
  
  public TreeNode setState(Map<String, Object> state) {
    this.state = state;
    return this;
  }
  
}
