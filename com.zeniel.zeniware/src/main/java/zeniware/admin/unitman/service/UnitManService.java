package zeniware.admin.unitman.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

public interface UnitManService {
  
  
  public List<Company> getCompList(Map<String, Object> paramMap);
  
  public List<User> getUserList(Map<String, Object> paramMap);
  
  public Company getSingleComp(Map<String, Object> paramMap);
  
  public Department getSingleDept(Map<String, Object> paramMap);
  
  public User getSingleUser(Map<String, Object> paramMap);
  
  public String getRootDept(String compId);
  
  @Transactional(value="transactionManager")
  public int setSingleComp(Company comp);
  
  @Transactional(value="transactionManager")
  public int setSingleDept(Department dept);
  
  @Transactional(value="transactionManager")
  public int setSingleUser(User user);
  
  @Transactional(value="transactionManager")
  public int resignUserList(List<User> userlist);
  
  @Transactional(value="transactionManager")
  public int moveSingleDept(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  public int setUserListSort(Map<String, Object> paramMap) throws Throwable;

}
