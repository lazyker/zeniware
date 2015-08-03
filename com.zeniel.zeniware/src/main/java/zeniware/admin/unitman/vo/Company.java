package zeniware.admin.unitman.vo;

public class Company {
  
  private String compId;
  private String compName;
  private int sortOrder;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public String getCompId() {
    return this.compId;
  }
  
  public void setCompId(String compId) {
    this.compId = compId;
  }
  
  public String getCompName() {
    return this.compName;
  }
  
  public void setCompName(String compName) {
    this.compName = compName; 
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public void setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public void setRegDate(String regDate) {
    this.regDate = regDate;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public void setModDate(String modDate) {
    this.modDate = modDate;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public void setDelDate(String delDate) {
    this.delDate = delDate;
  }

}
