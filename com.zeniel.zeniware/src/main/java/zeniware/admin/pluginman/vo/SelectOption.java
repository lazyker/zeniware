package zeniware.admin.pluginman.vo;

public class SelectOption {
  
  private String id;
  private String text;
  
  public SelectOption() { }
  
  public String getId() {
    return this.id;
  }
  
  public SelectOption setId(String id) {
    this.id = id;
    return this;
  }
  
  public String getText() {
    return this.text;
  }
  
  public SelectOption setText(String text) {
    this.text = text;
    return this;
  }

}
