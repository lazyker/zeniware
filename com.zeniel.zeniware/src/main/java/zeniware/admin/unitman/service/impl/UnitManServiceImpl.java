package zeniware.admin.unitman.service.impl;

import java.util.HashMap;
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
  public List<Department> getDeptList(Map<String, Object> paramMap) {
    return unitmanDao.getDeptList(paramMap);
  }
  
  @Override
  public List<User> getUserList(Map<String, Object> paramMap) {
    return unitmanDao.getUserList(paramMap);
  }
  
  @Override
  public Company getSingleComp(Map<String, Object> paramMap) {
    return unitmanDao.getSingleComp(paramMap);
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
  public String getRootDept(String compId) {
    return unitmanDao.getRootDept(compId);
  }
  
  @Override
  public int deleteSingleComp(Map<String, Object> paramMap) {
    return unitmanDao.deleteSingleComp(paramMap);
  }
  
  @Override
  public int deleteSingleDept(Map<String, Object> paramMap) {
    return unitmanDao.deleteSingleDept(paramMap);
  }
  
  @Override
  public int restoreSingleComp(Map<String, Object> paramMap) {
    return unitmanDao.restoreSingleComp(paramMap);
  }
  
  @Override
  public int restoreDeptList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("deptlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<Department> deptlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, Department.class));
      
      for (Department dept : deptlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", dept.getCompId());
        map.put("deptId", dept.getDeptId());
        map.put("parentDeptId", paramMap.get("parentDeptId"));
        
        affectedRows += unitmanDao.restoreSingleDept(map);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int restoreUserList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<User> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      for (User user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        map.put("deptId", paramMap.get("deptId"));
        
        affectedRows += unitmanDao.restoreSingleUser(map);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleComp(Map<String, Object> paramMap) throws Throwable {

    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("comp");
      ObjectMapper objectMapper = new ObjectMapper();
      Company comp = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(Company.class));
      
      affectedRows = unitmanDao.setSingleComp(comp);
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleDept(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("dept");
      ObjectMapper objectMapper = new ObjectMapper();
      Department dept = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(Department.class));
      
      affectedRows = unitmanDao.setSingleDept(dept);
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleUser(Map<String, Object> paramMap) throws Throwable {
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("user");
      ObjectMapper objectMapper = new ObjectMapper();
      User user = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(User.class));
      
      affectedRows = unitmanDao.setSingleUser(user);
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int deleteUserList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<User> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      for (User user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("mode", paramMap.get("mode"));
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        
        affectedRows += unitmanDao.deleteSingleUser(map);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setUserListSort(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      
      ObjectMapper objectMapper = new ObjectMapper();
      List<User> userlist = objectMapper.readValue(jsonString, 
          objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      for (User user : userlist) {
        affectedRows += unitmanDao.setSingleUserSort(user);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
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
      
      ObjectMapper objectMapper = new ObjectMapper();
      List<Department> deptlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, Department.class));
      
      for (Department dept : deptlist) {
        affectedRows += unitmanDao.setSingleDeptSort(dept);
      }
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int moveUserList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      
      ObjectMapper objectMapper = new ObjectMapper();
      List<User> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      for (User user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        map.put("deptId", paramMap.get("deptId"));
        
        affectedRows += unitmanDao.moveSingleUser(map);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
    
}
