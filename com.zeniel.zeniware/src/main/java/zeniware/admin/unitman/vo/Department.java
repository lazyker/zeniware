package zeniware.admin.unitman.vo;

import java.sql.Date;

public class Department {
  
  private String deptId;
  private String compId;
  private String deptName;
  private String simpleName;
  private String parentDeptId;
  private int deptLevel;
  private int sortOrder;
  private String mailId;
  private String managerId;
  private boolean useYn;
  private boolean activateYn;
  private Date regDate;
  private Date modDate;
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public void setDeptId(String deptId) {
    this.deptId = deptId;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public void setCompId(String compId) {
    this.compId = compId;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }
  
  public String getSimpleName() {
    return this.simpleName;
  }
  
  public void setSimpleName(String simpleName) {
    this.simpleName = simpleName;
  }
  
  public String getParentDeptId() {
    return this.parentDeptId;
  }
  
  public void setParentDeptId(String parentDeptId) {
    this.parentDeptId = parentDeptId;
  }
  
  public int getDeptLevel() {
    return this.deptLevel;
  }
  
  public void setDeptLevel(int deptLevel) {
    this.deptLevel = deptLevel;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public void setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public void setMainId(String mailId) {
    this.mailId = mailId;
  }
  
  public String getMamagerId() {
    return this.managerId;
  }
  
  public void setManagerId(String managerId) {
    this.managerId = managerId;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public void setUseYn(boolean useYn) {
    this.useYn = useYn;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public void setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
  }
  
  public Date getRegDate() {
    return this.regDate;
  }
  
  public void setRegDate(Date regDate) {
    this.regDate = regDate;
  }
  
  public Date getModDate() {
    return this.modDate;
  }
  
  public void setModDate(Date modDate) {
    this.modDate = modDate;
  }

}
