package zeniware.admin.unitman.service.impl;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.unitman.dao.UnitManDao;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

@Service
public class UnitManServiceImpl implements UnitManService {
  
  @Autowired
  private UnitManDao unitmanDao;
  
  @Override
  public List<Company> getCompList(Map<String, Object> paramMap) {
    return unitmanDao.getCompList(paramMap);
  }
  
  @Override
  public List<User> getUserList(Map<String, Object> paramMap) {
    return unitmanDao.getUserList(paramMap);
  }
  
  @Override
  public String getRootDept(String compId) {
    return unitmanDao.getRootDept(compId);
  }
  
  @Override
  public Department getSingleDept(Map<String, Object> paramMap) {
    return unitmanDao.getSingleDept(paramMap);
  }
  
  @Override
  public User getSingleUser(Map<String, Object> paramMap) {
    return unitmanDao.getSingleUser(paramMap);
  }
  
  @Override
  public int moveSingleDept(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String compId = (String)paramMap.get("compId");
      String parentDeptId = (String)paramMap.get("parentDeptId");
      String jsonString = (String)paramMap.get("children");
      
      if (parentDeptId.equals("#")) {
        paramMap.put("parentDeptId", unitmanDao.getRootDept(compId));
      }
      
      affectedRows = unitmanDao.moveSingleDept(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      List<Department> deptlist = 
        mapper.readValue(jsonString, mapper.getTypeFactory().constructCollectionType(List.class, Department.class));
      
      for (Department dept : deptlist) {
        affectedRows += unitmanDao.setSingleDeptSort(dept);
      }
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleUser(User user) {
    return unitmanDao.setSingleUser(user);
  }
  
  @Override
  public int setUserListSort(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      
      ObjectMapper mapper = new ObjectMapper();
      List<User> userlist = 
        mapper.readValue(jsonString, mapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      for (User user : userlist) {
        affectedRows += unitmanDao.setSingleUserSort(user);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int resignUserList(List<User> userlist) {
    
    int affectedRows = 0;
    
    try {
      for (User user : userlist) {
        affectedRows += unitmanDao.resignSingleUser(user);
      }
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
}
