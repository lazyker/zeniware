package zeniware.admin.unitman.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserVo implements UserDetails {
  
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
  private String postCode;
  private String address1;
  private String address2;
  private String joinDate;
  private String resignDate;
  private boolean useSolarYn;
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
  
  public UserVo() { }
  
  public String getUserId() {
    return this.userId;
  }
  
  public UserVo setUserId(String userId) {
    this.userId = userId;
    return this;
  }
  
  public String getDeptId() {
    return this.deptId;
  }
  
  public UserVo setDeptId(String deptId) {
    this.deptId = deptId;
    return this;
  }
  
  public String getDeptName() {
    return this.deptName;
  }
  
  public UserVo setDeptName(String deptName) {
    this.deptName = deptName;
    return this;
  }
  
  public String getCompId() {
    return this.compId;
  }
  
  public UserVo setCompId(String compId) {
    this.compId = compId;
    return this;
  }
  
  public String getUserName() {
    return this.userName;
  }
  
  public UserVo setUserName(String userName) {
    this.userName = userName;
    return this;
  }
  
  public String getPassword() {
    return this.password;
  }
  
  public UserVo setPassword(String password) {
    this.password = password;
    return this;
  }
  
  public String getEmpNumber() {
    return this.empNumber;
  }
  
  public UserVo setEmpNumber(String empNumber) {
    this.empNumber = empNumber;
    return this;
  }
  
  public String getMailId() {
    return this.mailId;
  }
  
  public UserVo setMailId(String mailId) {
    this.mailId = mailId;
    return this;
  }
  
  public String getOfficePhone() {
    return this.officePhone;
  }
  
  public UserVo setOfficePhone(String officePhone) {
    this.officePhone = officePhone;
    return this;
  }
  
  public String getHomePhone() {
    return this.homePhone;
  }
  
  public UserVo setHomePhone(String homePhone) {
    this.homePhone = homePhone;
    return this;
  }
  
  public String getFax() {
    return this.fax;
  }
  
  public UserVo setFax(String fax) {
    this.fax = fax;
    return this;
  }
  
  public String getMobile() {
    return this.mobile;
  }
  
  public UserVo setMobile(String mobile) {
    this.mobile = mobile;
    return this;
  }
  
  public String getPostCode() {
    return this.postCode;
  }
  
  public UserVo setPostCode(String postCode) {
    this.postCode = postCode;
    return this;
  }
  
  public String getAddress1() {
    return this.address1;
  }
  
  public UserVo setAddress1(String address1) {
    this.address1 = address1;
    return this;
  }
  
  public String getAddress2() {
    return this.address2;
  }
  
  public UserVo setAddress2(String address2) {
    this.address2 = address2;
    return this;
  }
  
  public String getJoinDate() {
    return this.joinDate;
  }
  
  public UserVo setJoinDate(String joinDate) {
    this.joinDate = joinDate;
    return this;
  }
  
  public String getResignDate() {
    return this.resignDate;
  }
  
  public UserVo setResignDate(String resignDate) {
    this.resignDate = resignDate;
    return this;
  }
  
  public String getPhotoFileId() {
    return this.photoFileId;
  }
  
  public UserVo setPhotoFileId(String photoFileId) {
    this.photoFileId = photoFileId;
    return this;
  }
  
  public String getSignFileId() {
    return this.signFileId;
  }
  
  public UserVo setSignFileId(String signFileId) {
    this.signFileId = signFileId;
    return this;
  }
  
  public int getSecurityLevel() {
    return this.securityLevel;
  }
  
  public UserVo setSecurityLevel(int securityLevel) {
    this.securityLevel = securityLevel;
    return this;
  }
  
  public String getJobTitleCode() {
    return this.jobTitleCode;
  }
  
  public UserVo setJobTitleCode(String jobTitleCode) {
    this.jobTitleCode = jobTitleCode;
    return this;
  }
  
  public String getJobTitleName() {
    return this.jobTitleName;
  }
  
  public UserVo setJobTitleName(String jobTitleName) {
    this.jobTitleName = jobTitleName;
    return this;
  }
  
  public String getJobGradeCode() {
    return this.jobGradeCode;
  }
  
  public UserVo setJobGradeCode(String jobGradeCode) {
    this.jobGradeCode = jobGradeCode;
    return this;
  }
  
  public String getJobRoleCode() {
    return this.jobRoleCode;
  }
  
  public UserVo setJobRoleCode(String jobRoleCode) {
    this.jobRoleCode = jobRoleCode;
    return this;
  }
  
  public String getEntitlement() {
    return this.entitlement;
  }
  
  public UserVo setEntitlement(String entitlement) {
    this.entitlement = entitlement;
    return this;
  }
  
  public String getDescription() {
    return this.description;
  }
  
  public UserVo setDescription(String description) {
    this.description = description;
    return this;
  }
  
  public String getBirthDate() {
    return this.birthDate;
  }
  
  public UserVo setBirthDate(String birthDate) {
    this.birthDate = birthDate;
    return this;
  }
  
  public boolean getUseSolarYn() {
    return this.useSolarYn;
  }
  public UserVo setUseSolarYn(boolean useSolarYn) {
    this.useSolarYn = useSolarYn;
    return this;
  }
  
  public String getLanguageCode() {
    return this.languageCode;
  }
  
  public UserVo setLanguageCode(String languageCode) {
    this.languageCode = languageCode;
    return this;
  }
  
  public int getSortOrder() {
    return this.sortOrder;
  }
  
  public UserVo setSortOrder(int sortOrder) {
    this.sortOrder = sortOrder;
    return this;
  }
  
  public boolean getUseYn() {
    return this.useYn;
  }
  
  public UserVo setUseYn(boolean useYn) {
    this.useYn = useYn;
    return this;
  }
  
  public boolean getActivateYn() {
    return this.activateYn;
  }
  
  public UserVo setActivateYn(boolean activateYn) {
    this.activateYn = activateYn;
    return this;
  }
  
  public String getRegDate() {
    return this.regDate;
  }
  
  public UserVo setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }
  
  public String getModDate() {
    return this.modDate;
  }
  
  public UserVo setModDate(String modDate) {
    this.modDate = modDate;
    return this;
  }
  
  public String getDelDate() {
    return this.delDate;
  }
  
  public UserVo setDelDate(String delDate) {
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
