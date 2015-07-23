package zeniware.admin.unitman.vo;

import java.sql.Date;

public class Company {
  
  private String compId;
  private String compName;
  private int sortOrder;
  private Date regDate;
  private Date modDate;
  private Date delDate;
  
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
  
  public Date getDelDate() {
    return this.delDate;
  }
  
  public void setDelDate(Date delDate) {
    this.delDate = delDate;
  }

}
