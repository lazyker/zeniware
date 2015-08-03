package zeniware.admin.pluginman.vo;

import java.util.Map;

public class TreeNode {

  private String id;
  private String parent;
  private String text;
  private String icon;
  private Map<String, Object> state;
  
  public String getId() {
    return this.id;
  }
  
  public void setId(String id) {
    this.id = id;
  }
  
  public String getParent() {
    return this.parent;
  }
  
  public void setParent(String parent) {
    this.parent = parent;
  }
  
  public String getText() {
    return this.text;
  }
  
  public void setText(String text) {
    this.text = text;
  }
  
  public String getIcon() {
    return this.icon;
  }
  
  public void setIcon(String icon) {
    this.icon = icon;
  }
  
  public Map<String, Object> getState() {
    return this.state;
  }
  
  public void setState(Map<String, Object> state) {
    this.state = state;
  }
  
}
