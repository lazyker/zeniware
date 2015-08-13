package zeniware.common.plugin.vo;

public class TreeNodeState {
  
  private boolean opened;
  private boolean disabled;
  private boolean selected;
  
  public TreeNodeState() { }
  
  public boolean getOpened() {
    return this.opened;
  }
  
  public TreeNodeState setOpened(boolean opened) {
    this.opened = opened;
    return this;
  }
  
  public boolean getDisabled() {
    return this.disabled;
  }
  
  public TreeNodeState setDisabled(boolean disabled) {
    this.disabled = disabled;
    return this;
  }
  
  public boolean getSelected() {
    return this.selected;
  }
  
  public TreeNodeState setSelected(boolean selected) {
    this.selected = selected;
    return this;
  }

}
