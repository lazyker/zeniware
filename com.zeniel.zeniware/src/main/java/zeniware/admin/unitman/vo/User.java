package zeniware.admin.unitman.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {
  
  private static final long serialVersionUID = 1L;
  
  private String userId;
  private String deptId;
  private String deptName;
  private String compId;
  private String userName;
  private String password;
  private String empNumber;
  private String mailId;
  private String officePhone;
  private String homePhone;
  private String fax;
  private String mobile;
  private int postCode;
  private String address1;
  private String address2;
  private String joinDate;
  private String resignDate;
  private boolean useLunarYn;
  private String birthDate;
  private String photoFileId;
  private String signFileId;
  private int securityLevel;
  private String jobTitleCode;
  private String jobTitleName;
  private String jobGradeCode;
  private String jobRoleCode;
  private String entitlement;
  private String description;  
  private String languageCode;
  private int sortOrder;
  private boolean useYn;
  private boolean activateYn;
  private String regDate;
  private String modDate;
  private String delDate;
  
  public User() { }
  
  public User(String compId, String deptId) {
    this.compId = compId;
    this.deptId = deptId;
    this.activateYn = true;
    this.useLunarYn = false;
    this.securityLevel = 10;
    this.sortOrder = 0;
  }
  
  public String getUserId() {
    return this.userId;
  }
  
  public void setUserId(String userId) {
    this.userId = userId;
  }
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public void setDeptId(String deptId) {
    this.deptId = deptId;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public void setCompId(String compId) {
    this.compId = compId;
  }
  
  public String getUserName() {
    return this.userName;
  }
  
  public void setUserName(String userName) {
    this.userName = userName;
  }
  
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(String password) {
    this.password = password;
  }
  
  public String getEmpNumber() {
    return this.empNumber;
  }
  
  public void setEmpNumber(String empNumber) {
    this.empNumber = empNumber;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public void setMailId(String mailId) {
    this.mailId = mailId;
  }
  
  public String getOfficePhone() {
    return this.officePhone;
  }
  
  public void setOfficePhone(String officePhone) {
    this.officePhone = officePhone;
  }
  
  public String getHomePhone() {
    return this.homePhone;
  }
  
  public void setHomePhone(String homePhone) {
    this.homePhone = homePhone;
  }
  
  public String getFax() {
    return this.fax;
  }
  
  public void setFax(String fax) {
    this.fax = fax;
  }
  
  public String getMobile() {
    return this.mobile;
  }
  
  public void setMobile(String mobile) {
    this.mobile = mobile;
  }
  
  public int getPostCode() {
    return this.postCode;
  }
  
  public void setPostCode(int postCode) {
    this.postCode = postCode;
  }
  
  public String getAddress1() {
    return this.address1;
  }
  
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  
  public String getAddress2() {
    return this.address2;
  }
  
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  
  public String getJoinDate() {
    return this.joinDate;
  }
  
  public void setJoinDate(String joinDate) {
    this.joinDate = joinDate;
  }
  
  public String getResignDate() {
    return this.resignDate;
  }
  
  public void setResignDate(String resignDate) {
    this.resignDate = resignDate;
  }
  
  public String getPhotoFileId() {
    return this.photoFileId;
  }
  
  public void setPhotoFileId(String photoFileId) {
    this.photoFileId = photoFileId;
  }
  
  public String getSignFileId() {
    return this.signFileId;
  }
  
  public void setSignFileId(String signFileId) {
    this.signFileId = signFileId;
  }
  
  public int getSecurityLevel() {
    return this.securityLevel;
  }
  
  public void setSecurityLevel(int securityLevel) {
    this.securityLevel = securityLevel;
  }
  
  public String getJobTitleCode() {
    return this.jobTitleCode;
  }
  
  public void setJobTitleCode(String jobTitleCode) {
    this.jobTitleCode = jobTitleCode;
  }
  
  public String getJobTitleName() {
    return this.jobTitleName;
  }
  
  public void setJobTitleName(String jobTitleName) {
    this.jobTitleName = jobTitleName;
  }
  
  public String getJobGradeCode() {
    return this.jobGradeCode;
  }
  
  public void setJobGradeCode(String jobGradeCode) {
    this.jobGradeCode = jobGradeCode;
  }
  
  public String getJobRoleCode() {
    return this.jobRoleCode;
  }
  
  public void setJobRoleCode(String jobRoleCode) {
    this.jobRoleCode = jobRoleCode;
  }
  
  public String getEntitlement() {
    return this.entitlement;
  }
  
  public void setEntitlement(String entitlement) {
    this.entitlement = entitlement;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public void setDescription(String description) {
    this.description = description;
  }
  
  public String getBirthDate() {
    return this.birthDate;
  }
  
  public void setBirthDate(String birthDate) {
    this.birthDate = birthDate;
  }
  
  public boolean getUseLunarYn() {
    return this.useLunarYn;
  }
  public void setUseLunarYn(boolean useLunarYn) {
    this.useLunarYn = useLunarYn;
  }
  
  public String getLanguageCode() {
    return this.languageCode;
  }
  
  public void setLanguageCode(String languageCode) {
    this.languageCode = languageCode;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public void setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
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
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public void setRegDate(String regDate) {
    this.regDate = regDate;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public void setModDate(String modDate) {
    this.modDate = modDate;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public void setDelDate(String delDate) {
    this.delDate = delDate;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public String getUsername() {
    // TODO Auto-generated method stub
    return getUserId();
  }

  @Override
  public boolean isAccountNonExpired() {
    // TODO Auto-generated method stub
    return false;
  }

  @Override
  public boolean isAccountNonLocked() {
    // TODO Auto-generated method stub
    return false;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    // TODO Auto-generated method stub
    return false;
  }

  @Override
  public boolean isEnabled() {
    // TODO Auto-generated method stub
    return false;
  }

}
