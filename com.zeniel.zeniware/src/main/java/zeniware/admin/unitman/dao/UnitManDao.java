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
  
  @SuppressWarnings("unchecked")
  public List<Company> getCompList(Map<String, Object> paramMap) {
    return (List<Company>)selectList("admin.unitman.getCompList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<User> getUserList(Map<String, Object> paramMap) {
    return (List<User>)selectList("admin.unitman.getUserList", paramMap);
  }
  
  public Department getSingleDept(Map<String, Object> paramMap) {
    return (Department)selectOne("admin.unitman.getSingleDept", paramMap);
  }
  
  public User getSingleUser(Map<String, Object> paramMap) {
    return (User)selectOne("admin.unitman.getSingleUser", paramMap);
  }
  
  public int setSingleUser(User user) {
    return (int)insert("admin.unitman.setSingleUser", user);
  }
  
  public int resignSingleUser(User user) {
    return (int)update("admin.unitman.resignSingleUser", user);
  }
  
}
