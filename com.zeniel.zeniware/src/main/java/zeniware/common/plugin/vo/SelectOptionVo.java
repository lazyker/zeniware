package zeniware.common.plugin.vo;

public class SelectOptionVo {
  
  private String id;
  private String text;
  
  public SelectOptionVo() { }
  
  public String getId() {
    return this.id;
  }
  
  public SelectOptionVo setId(String id) {
    this.id = id;
    return this;
  }
  
  public String getText() {
    return this.text;
  }
  
  public SelectOptionVo setText(String text) {
    this.text = text;
    return this;
  }

}
