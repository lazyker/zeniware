package zeniware.admin.unitman.vo;

public class Department {
  
  private String deptId;
  private String compId;
  private String deptName;
  private String simpleName;
  private String parentDeptId;
  private String parentDeptName;
  private int deptLevel;
  private int sortOrder;
  private String mailId;
  private String managerId;
  private boolean useYn;
  private boolean activateYn;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public Department() { }
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public Department setDeptId(String deptId) {
    this.deptId = deptId;
    return this;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public Department setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public Department setDeptName(String deptName) {
    this.deptName = deptName;
    return this;
  }
  
  public String getSimpleName() {
    return this.simpleName;
  }
  
  public Department setSimpleName(String simpleName) {
    this.simpleName = simpleName;
    return this;
  }
  
  public String getParentDeptId() {
    return this.parentDeptId;
  }
  
  public Department setParentDeptId(String parentDeptId) {
    this.parentDeptId = parentDeptId;
    return this;
  }
  
  public String getParentDeptName() {
    return this.parentDeptName;
  }
  
  public Department setParentDeptName(String parentDeptName) {
    this.parentDeptName = parentDeptName;
    return this;
  }
  
  public int getDeptLevel() {
    return this.deptLevel;
  }
  
  public Department setDeptLevel(int deptLevel) {
    this.deptLevel = deptLevel;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public Department setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public Department setMainId(String mailId) {
    this.mailId = mailId;
    return this;
  }
  
  public String getMamagerId() {
    return this.managerId;
  }
  
  public Department setManagerId(String managerId) {
    this.managerId = managerId;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public Department setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public Department setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public Department setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public Department setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public Department setDelDate(String delDate) {
    this.delDate = delDate;
    return this;
  }

}
