package zeniware.admin.unitman.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

public interface UnitManService {
  
  
  public List<Company> getCompList(Map<String, Object> paramMap);
  
  public List<Department> getDeptList(Map<String, Object> paramMap);
  
  public List<User> getUserList(Map<String, Object> paramMap);
  
  public Company getSingleComp(Map<String, Object> paramMap);
  
  public Department getSingleDept(Map<String, Object> paramMap);
  
  public User getSingleUser(Map<String, Object> paramMap);
  
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
