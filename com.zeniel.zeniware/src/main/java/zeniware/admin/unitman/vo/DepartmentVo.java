package zeniware.admin.unitman.vo;

public class DepartmentVo {
  
  private String deptId;
  private String compId;
  private String deptName;
  private String simpleName;
  private String parentDeptId;
  private String parentDeptName;
  private int sortOrder;
  private String mailId;
  private String managerId;
  private boolean useYn;
  private boolean activateYn;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public DepartmentVo() { }
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public DepartmentVo setDeptId(String deptId) {
    this.deptId = deptId;
    return this;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public DepartmentVo setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public DepartmentVo setDeptName(String deptName) {
    this.deptName = deptName;
    return this;
  }
  
  public String getSimpleName() {
    return this.simpleName;
  }
  
  public DepartmentVo setSimpleName(String simpleName) {
    this.simpleName = simpleName;
    return this;
  }
  
  public String getParentDeptId() {
    return this.parentDeptId;
  }
  
  public DepartmentVo setParentDeptId(String parentDeptId) {
    this.parentDeptId = parentDeptId;
    return this;
  }
  
  public String getParentDeptName() {
    return this.parentDeptName;
  }
  
  public DepartmentVo setParentDeptName(String parentDeptName) {
    this.parentDeptName = parentDeptName;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public DepartmentVo setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public DepartmentVo setMainId(String mailId) {
    this.mailId = mailId;
    return this;
  }
  
  public String getManagerId() {
    return this.managerId;
  }
  
  public DepartmentVo setManagerId(String managerId) {
    this.managerId = managerId;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public DepartmentVo setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public DepartmentVo setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public DepartmentVo setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public DepartmentVo setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public DepartmentVo setDelDate(String delDate) {
    this.delDate = delDate;
    return this;
  }

}
