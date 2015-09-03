package zeniware.admin.unitman.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.unitman.vo.CompanyVo;
import zeniware.admin.unitman.vo.DepartmentVo;
import zeniware.admin.unitman.vo.UserVo;

public interface UnitManAdmService {
  
  public List<CompanyVo> getCompList(Map<String, Object> paramMap);
  
  public List<DepartmentVo> getDeptList(Map<String, Object> paramMap);
  
  public List<UserVo> getUserList(Map<String, Object> paramMap);
  
  public CompanyVo getSingleComp(Map<String, Object> paramMap);
  
  public DepartmentVo getSingleDept(Map<String, Object> paramMap);
  
  public UserVo getSingleUser(Map<String, Object> paramMap);
  
  public String getRootDept(String compId);
  
  @Transactional(value="transactionManager")
  public int deleteSingleComp(Map<String, Object> paramMap);
  
  @Transactional(value="transactionManager")
  public int deleteSingleDept(Map<String, Object> paramMap);

  @Transactional(value="transactionManager")
  public int restoreSingleComp(Map<String, Object> paramMap);
  
  @Transactional(value="transactionManager")
  public int restoreDeptList(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int restoreUserList(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int setSingleComp(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int setSingleDept(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int setSingleUser(Map<String, Object> paramMap) throws Throwable;

  @Transactional(value="transactionManager")
  public int deleteUserList(Map<String, Object> paramMap) throws Throwable;  
  
  @Transactional(value="transactionManager")
  public int moveSingleDept(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int moveUserList(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int setUserListSort(Map<String, Object> paramMap) throws Throwable;

}
