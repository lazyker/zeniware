package zeniware.admin.preference;

import java.sql.Date;

public class CommonCode {
  private String groupId;
  private String codeId;
  private String codeNameKo;
  private String codeNameEn;
  private String codeNameCn;
  private String codeNameJp;
  private int sortOrder;
  private Boolean useYn;
  private String description;
  private Date regDate;
  private Date modDate;
  
  public String getGroupId() {
    return this.groupId;
  }
  
  public void setGroupId(String groupId) {
    this.groupId = groupId;
  }
  
  public String getCodeId() {
    return this.codeId;
  }
  
  public void setCodeId(String codeId) {
    this.codeId = codeId;
  }
  
  public String getCodeNameKo() {
    return this.codeNameKo;
  }
  
  public void setCodeNameKo(String codeNameKo) {
    this.codeNameKo = codeNameKo;
  }
  
  public String getCodeNameEn() {
    return this.codeNameEn;
  }
  
  public void setCodeNameEn(String codeNameEn) {
    this.codeNameEn = codeNameEn;
  }
  
  public String getCodeNameCn() {
    return this.codeNameCn;
  }
  
  public void setCodeNameCn(String codeNameCn) {
    this.codeNameCn = codeNameCn;
  }
  
  public String getCodeNameJp() {
    return this.codeNameJp;
  }
  
  public void setCodeNameJp(String codeNameJp) {
    this.codeNameJp = codeNameJp;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public void setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
  }
  
  public Boolean getUseYn() {
    return this.useYn;
  }
  
  public void setUseYn(Boolean useYn) {
    this.useYn = useYn;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public void setDescription(String description) {
    this.description = description;
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
