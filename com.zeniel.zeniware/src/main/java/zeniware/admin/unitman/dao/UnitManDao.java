package zeniware.admin.unitman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;
import zeniware.common.sql.AbstractDao;

@Repository
public class UnitManDao extends AbstractDao {
  
  /*********************
   * Select List
   *********************/
  @SuppressWarnings("unchecked")
  public List<Company> getCompList(Map<String, Object> paramMap) {
    return (List<Company>)selectList("admin.unitman.getCompList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<User> getUserList(Map<String, Object> paramMap) {
    return (List<User>)selectList("admin.unitman.getUserList", paramMap);
  }
  
  /*********************
   * Select One
   *********************/
  public Company getSingleComp(Map<String, Object> paramMap) {
    return (Company)selectOne("admin.unitman.getSingleComp", paramMap);
  }
  
  public Department getSingleDept(Map<String, Object> paramMap) {
    return (Department)selectOne("admin.unitman.getSingleDept", paramMap);
  }
  
  public User getSingleUser(Map<String, Object> paramMap) {
    return (User)selectOne("admin.unitman.getSingleUser", paramMap);
  }
  
  public String getRootDept(String compId) {
    return (String)selectOne("admin.unitman.getRootDept", compId);
  }
  
  /*********************
   * Insert/Update One
   *********************/
  public int setSingleComp(Company comp) {
    return (int)insert("admin.unitman.setSingleComp", comp);
  }
  
  public int setSingleDept(Department dept) {
    return (int)insert("admin.unitman.setSingleDept", dept);
  }
  
  public int setSingleUser(User user) {
    return (int)insert("admin.unitman.setSingleUser", user);
  }
  
  /*********************
   * Update One
   *********************/
  public int moveSingleDept(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.moveSingleDept", paramMap);
  }
  
  public int setSingleDeptSort(Department dept) {
    return (int)update("admin.unitman.setSingleDeptSort", dept);
  }
  
  public int resignSingleUser(User user) {
    return (int)update("admin.unitman.resignSingleUser", user);
  }
  
  /*********************
   * Update List
   *********************/
  public int setSingleUserSort(User user) {
    return (int)update("admin.unitman.setSingleUserSort", user);
  }
  
}
