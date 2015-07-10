package zeniware.admin.preference;

import java.sql.Date;

public class CommonCode {
  private String sGroupId;
  private String sCodeId;
  private String sCodeNameKo;
  private String sCodeNameEn;
  private String sCodeNameCn;
  private String sCodeNameJp;
  private int iSortOrder;
  private Boolean bUseYn;
  private String sDescription;
  private Date dRegDate;
  private Date dModDate;
  
  public String getGroupId() {
    return this.sGroupId;
  }
  
  public void setGroupId(String sGroupId) {
    this.sGroupId = sGroupId;
  }
  
  public String getCodeId() {
    return this.sCodeId;
  }
  
  public void setCodeId(String sCodeId) {
    this.sCodeId = sCodeId;
  }
  
  public String getCodeNameKo() {
    return this.sCodeNameKo;
  }
  
  public void setCodeNameKo(String sCodeNameKo) {
    this.sCodeNameKo = sCodeNameKo;
  }
  
  public String getCodeNameEn() {
    return this.sCodeNameEn;
  }
  
  public void setCodeNameEn(String sCodeNameEn) {
    this.sCodeNameEn = sCodeNameEn;
  }
  
  public String getCodeNameCn() {
    return this.sCodeNameCn;
  }
  
  public void setCodeNameCn(String sCodeNameCn) {
    this.sCodeNameCn = sCodeNameCn;
  }
  
  public String getCodeNameJp() {
    return this.sCodeNameJp;
  }
  
  public void setCodeNameJp(String sCodeNameJp) {
    this.sCodeNameJp = sCodeNameJp;
  }
  
  public int getSortOrder() {
    return this.iSortOrder;
  }
  
  public void setSortOrder(int iSortOrder) {
    this.iSortOrder = iSortOrder;
  }
  
  public Boolean getUseYn() {
    return this.bUseYn;
  }
  
  public void setUseYn(Boolean bUseYn) {
    this.bUseYn = bUseYn;
  }
  
  public String getDescription() {
    return this.sDescription;
  }
  
  public void setDescription(String sDescription) {
    this.sDescription = sDescription;
  }
  
  public Date getRegDate() {
    return this.dRegDate;
  }
  
  public void setRegDate(Date dRegDate) {
    this.dRegDate = dRegDate;
  }
  
  public Date getModDate() {
    return this.dModDate;
  }
  
  public void setModDate(Date dModDate) {
    this.dModDate = dModDate;
  }
  
}
