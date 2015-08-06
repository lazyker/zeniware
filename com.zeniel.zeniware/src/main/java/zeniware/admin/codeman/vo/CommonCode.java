package zeniware.admin.codeman.vo;

import java.sql.Date;

public class CommonCode {
  private String groupId;
  private String codeId;
  private String orgCodeId;
  private String codeNameKo;
  private String codeNameEn;
  private String codeNameZh;
  private String codeNameJa;
  private int sortOrder;
  private boolean useYn;
  private String description;
  private Date regDate;
  private Date modDate;
  
  public CommonCode() { }
    
  public String getGroupId() {
    return this.groupId;
  }
  
  public CommonCode setGroupId(String groupId) {
    this.groupId = groupId;
    return this;
  }
  
  public String getCodeId() {
    return this.codeId;
  }
  
  public CommonCode setCodeId(String codeId) {
    this.codeId = codeId;
    return this;
  }
  
  public String getOrgCodeId() {
    return this.orgCodeId;
  }
  
  public CommonCode setOrgCodeId(String orgCodeId) {
    this.orgCodeId = orgCodeId;
    return this;
  }
  
  public String getCodeNameKo() {
    return this.codeNameKo;
  }
  
  public CommonCode setCodeNameKo(String codeNameKo) {
    this.codeNameKo = codeNameKo;
    return this;
  }
  
  public String getCodeNameEn() {
    return this.codeNameEn;
  }
  
  public CommonCode setCodeNameEn(String codeNameEn) {
    this.codeNameEn = codeNameEn;
    return this;
  }
  
  public String getCodeNameZh() {
    return this.codeNameZh;
  }
  
  public CommonCode setCodeNameZh(String codeNameZh) {
    this.codeNameZh = codeNameZh;
    return this;
  }
  
  public String getCodeNameJa() {
    return this.codeNameJa;
  }
  
  public CommonCode setCodeNameJa(String codeNameJa) {
    this.codeNameJa = codeNameJa;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public CommonCode setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public CommonCode setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public CommonCode setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public Date getRegDate() {
    return this.regDate;
  }
  
  public CommonCode setRegDate(Date regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public Date getModDate() {
    return this.modDate;
  }
  
  public CommonCode setModDate(Date modDate) {
    this.modDate = modDate;
    return this;
  }
  
}
