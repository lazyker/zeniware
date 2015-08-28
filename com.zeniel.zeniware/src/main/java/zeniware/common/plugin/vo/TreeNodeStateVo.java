package zeniware.common.plugin.vo;

public class TreeNodeStateVo {
  
  private boolean opened;
  private boolean disabled;
  private boolean selected;
  
  public TreeNodeStateVo() { }
  
  public boolean getOpened() {
    return this.opened;
  }
  
  public TreeNodeStateVo setOpened(boolean opened) {
    this.opened = opened;
    return this;
  }
  
  public boolean getDisabled() {
    return this.disabled;
  }
  
  public TreeNodeStateVo setDisabled(boolean disabled) {
    this.disabled = disabled;
    return this;
  }
  
  public boolean getSelected() {
    return this.selected;
  }
  
  public TreeNodeStateVo setSelected(boolean selected) {
    this.selected = selected;
    return this;
  }

}
