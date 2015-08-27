package zeniware.admin.codeman.vo;

import java.sql.Date;

public class CodeVo {
  private String groupId;
  private String codeId;
  private String orgCodeId;
  private String codeNameKo;
  private String codeNameEn;
  private String codeNameZh;
  private String codeNameJa;
  private String groupNameKo;
  private int sortOrder;
  private boolean useYn;
  private String description;
  private Date regDate;
  private Date modDate;
  
  public CodeVo() { }
    
  public String getGroupId() {
    return this.groupId;
  }
  
  public CodeVo setGroupId(String groupId) {
    this.groupId = groupId;
    return this;
  }
  
  public String getCodeId() {
    return this.codeId;
  }
  
  public CodeVo setCodeId(String codeId) {
    this.codeId = codeId;
    return this;
  }
  
  public String getOrgCodeId() {
    return this.orgCodeId;
  }
  
  public CodeVo setOrgCodeId(String orgCodeId) {
    this.orgCodeId = orgCodeId;
    return this;
  }
  
  public String getGroupNameKo() {
    return this.groupNameKo;
  }
  
  public CodeVo setGroupNameKo(String groupNameKo) {
    this.groupNameKo = groupNameKo;
    return this;
  }
  
  public String getCodeNameKo() {
    return this.codeNameKo;
  }
  
  public CodeVo setCodeNameKo(String codeNameKo) {
    this.codeNameKo = codeNameKo;
    return this;
  }
  
  public String getCodeNameEn() {
    return this.codeNameEn;
  }
  
  public CodeVo setCodeNameEn(String codeNameEn) {
    this.codeNameEn = codeNameEn;
    return this;
  }
  
  public String getCodeNameZh() {
    return this.codeNameZh;
  }
  
  public CodeVo setCodeNameZh(String codeNameZh) {
    this.codeNameZh = codeNameZh;
    return this;
  }
  
  public String getCodeNameJa() {
    return this.codeNameJa;
  }
  
  public CodeVo setCodeNameJa(String codeNameJa) {
    this.codeNameJa = codeNameJa;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public CodeVo setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public CodeVo setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public CodeVo setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public Date getRegDate() {
    return this.regDate;
  }
  
  public CodeVo setRegDate(Date regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public Date getModDate() {
    return this.modDate;
  }
  
  public CodeVo setModDate(Date modDate) {
    this.modDate = modDate;
    return this;
  }
  
}
