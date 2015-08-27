package zeniware.admin.unitman.vo;

public class CompanyVo {
  
  private String compId;
  private String compName;
  private String description;
  private int sortOrder;
  private boolean useYn;
  private boolean activateYn;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public CompanyVo() { }
  
  public String getCompId() {
    return this.compId;
  }
  
  public CompanyVo setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getCompName() {
    return this.compName;
  }
  
  public CompanyVo setCompName(String compName) {
    this.compName = compName;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public CompanyVo setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public CompanyVo setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public CompanyVo setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public CompanyVo setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public CompanyVo setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public CompanyVo setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public CompanyVo setDelDate(String delDate) {
    this.delDate = delDate;
    return this;
  }

}
