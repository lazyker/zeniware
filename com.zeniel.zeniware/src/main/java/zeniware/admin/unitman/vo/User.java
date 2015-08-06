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
  
  public String getUserId() {
    return this.userId;
  }
  
  public User setUserId(String userId) {
    this.userId = userId;
    return this;
  }
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public User setDeptId(String deptId) {
    this.deptId = deptId;
    return this;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public User setDeptName(String deptName) {
    this.deptName = deptName;
    return this;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public User setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getUserName() {
    return this.userName;
  }
  
  public User setUserName(String userName) {
    this.userName = userName;
    return this;
  }
  
  public String getPassword() {
    return this.password;
  }
  
  public User setPassword(String password) {
    this.password = password;
    return this;
  }
  
  public String getEmpNumber() {
    return this.empNumber;
  }
  
  public User setEmpNumber(String empNumber) {
    this.empNumber = empNumber;
    return this;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public User setMailId(String mailId) {
    this.mailId = mailId;
    return this;
  }
  
  public String getOfficePhone() {
    return this.officePhone;
  }
  
  public User setOfficePhone(String officePhone) {
    this.officePhone = officePhone;
    return this;
  }
  
  public String getHomePhone() {
    return this.homePhone;
  }
  
  public User setHomePhone(String homePhone) {
    this.homePhone = homePhone;
    return this;
  }
  
  public String getFax() {
    return this.fax;
  }
  
  public User setFax(String fax) {
    this.fax = fax;
    return this;
  }
  
  public String getMobile() {
    return this.mobile;
  }
  
  public User setMobile(String mobile) {
    this.mobile = mobile;
    return this;
  }
  
  public int getPostCode() {
    return this.postCode;
  }
  
  public User setPostCode(int postCode) {
    this.postCode = postCode;
    return this;
  }
  
  public String getAddress1() {
    return this.address1;
  }
  
  public User setAddress1(String address1) {
    this.address1 = address1;
    return this;
  }
  
  public String getAddress2() {
    return this.address2;
  }
  
  public User setAddress2(String address2) {
    this.address2 = address2;
    return this;
  }
  
  public String getJoinDate() {
    return this.joinDate;
  }
  
  public User setJoinDate(String joinDate) {
    this.joinDate = joinDate;
    return this;
  }
  
  public String getResignDate() {
    return this.resignDate;
  }
  
  public User setResignDate(String resignDate) {
    this.resignDate = resignDate;
    return this;
  }
  
  public String getPhotoFileId() {
    return this.photoFileId;
  }
  
  public User setPhotoFileId(String photoFileId) {
    this.photoFileId = photoFileId;
    return this;
  }
  
  public String getSignFileId() {
    return this.signFileId;
  }
  
  public User setSignFileId(String signFileId) {
    this.signFileId = signFileId;
    return this;
  }
  
  public int getSecurityLevel() {
    return this.securityLevel;
  }
  
  public User setSecurityLevel(int securityLevel) {
    this.securityLevel = securityLevel;
    return this;
  }
  
  public String getJobTitleCode() {
    return this.jobTitleCode;
  }
  
  public User setJobTitleCode(String jobTitleCode) {
    this.jobTitleCode = jobTitleCode;
    return this;
  }
  
  public String getJobTitleName() {
    return this.jobTitleName;
  }
  
  public User setJobTitleName(String jobTitleName) {
    this.jobTitleName = jobTitleName;
    return this;
  }
  
  public String getJobGradeCode() {
    return this.jobGradeCode;
  }
  
  public User setJobGradeCode(String jobGradeCode) {
    this.jobGradeCode = jobGradeCode;
    return this;
  }
  
  public String getJobRoleCode() {
    return this.jobRoleCode;
  }
  
  public User setJobRoleCode(String jobRoleCode) {
    this.jobRoleCode = jobRoleCode;
    return this;
  }
  
  public String getEntitlement() {
    return this.entitlement;
  }
  
  public User setEntitlement(String entitlement) {
    this.entitlement = entitlement;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public User setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public String getBirthDate() {
    return this.birthDate;
  }
  
  public User setBirthDate(String birthDate) {
    this.birthDate = birthDate;
    return this;
  }
  
  public boolean getUseLunarYn() {
    return this.useLunarYn;
  }
  public User setUseLunarYn(boolean useLunarYn) {
    this.useLunarYn = useLunarYn;
    return this;
  }
  
  public String getLanguageCode() {
    return this.languageCode;
  }
  
  public User setLanguageCode(String languageCode) {
    this.languageCode = languageCode;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public User setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public User setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public User setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public User setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public User setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public User setDelDate(String delDate) {
    this.delDate = delDate;
    return this;
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
