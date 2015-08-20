package zeniware.admin.unitman.vo;

public class Company {
  
  private String compId;
  private String compName;
  private String description;
  private int sortOrder;
  private boolean useYn;
  private boolean activateYn;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public Company() { }
  
  public String getCompId() {
    return this.compId;
  }
  
  public Company setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getCompName() {
    return this.compName;
  }
  
  public Company setCompName(String compName) {
    this.compName = compName;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public Company setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public Company setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public Company setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public Company setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public Company setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public Company setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public Company setDelDate(String delDate) {
    this.delDate = delDate;
    return this;
  }

}
