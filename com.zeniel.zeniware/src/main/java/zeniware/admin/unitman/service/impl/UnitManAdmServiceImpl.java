package zeniware.admin.unitman.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.unitman.dao.UnitManAdmDao;
import zeniware.admin.unitman.service.UnitManAdmService;
import zeniware.admin.unitman.vo.CompanyVo;
import zeniware.admin.unitman.vo.DepartmentVo;
import zeniware.admin.unitman.vo.UserVo;

@Service
public class UnitManAdmServiceImpl implements UnitManAdmService {
  
  @Autowired
  private UnitManAdmDao unitmanAdmDao;
  
  @Override
  public List<CompanyVo> getCompList(Map<String, Object> paramMap) {
    return unitmanAdmDao.getCompList(paramMap);
  }
  
  @Override
  public List<DepartmentVo> getDeptList(Map<String, Object> paramMap) {
    return unitmanAdmDao.getDeptList(paramMap);
  }
  
  @Override
  public List<UserVo> getUserList(Map<String, Object> paramMap) {
    return unitmanAdmDao.getUserList(paramMap);
  }
  
  @Override
  public CompanyVo getSingleComp(Map<String, Object> paramMap) {
    return unitmanAdmDao.getSingleComp(paramMap);
  }
  
  @Override
  public DepartmentVo getSingleDept(Map<String, Object> paramMap) {
    return unitmanAdmDao.getSingleDept(paramMap);
  }
  
  @Override
  public UserVo getSingleUser(Map<String, Object> paramMap) {
    return unitmanAdmDao.getSingleUser(paramMap);
  }
  
  @Override
  public String getRootDept(String compId) {
    return unitmanAdmDao.getRootDept(compId);
  }
  
  @Override
  public int deleteSingleComp(Map<String, Object> paramMap) {
    return unitmanAdmDao.deleteSingleComp(paramMap);
  }
  
  @Override
  public int deleteSingleDept(Map<String, Object> paramMap) {
    return unitmanAdmDao.deleteSingleDept(paramMap);
  }
  
  @Override
  public int restoreSingleComp(Map<String, Object> paramMap) {
    return unitmanAdmDao.restoreSingleComp(paramMap);
  }
  
  @Override
  public int restoreDeptList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("deptlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<DepartmentVo> deptlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, DepartmentVo.class));
      
      for (DepartmentVo dept : deptlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", dept.getCompId());
        map.put("deptId", dept.getDeptId());
        map.put("parentDeptId", paramMap.get("parentDeptId"));
        
        affectedRows += unitmanAdmDao.restoreSingleDept(map);
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
      
      List<UserVo> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, UserVo.class));
      
      for (UserVo user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        map.put("deptId", paramMap.get("deptId"));
        
        affectedRows += unitmanAdmDao.restoreSingleUser(map);
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
      CompanyVo comp = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(CompanyVo.class));
      
      affectedRows = unitmanAdmDao.setSingleComp(comp);
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleDept(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("dept");
      ObjectMapper objectMapper = new ObjectMapper();
      DepartmentVo dept = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(DepartmentVo.class));
      
      affectedRows = unitmanAdmDao.setSingleDept(dept);
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setSingleUser(Map<String, Object> paramMap) throws Throwable {
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("user");
      ObjectMapper objectMapper = new ObjectMapper();
      UserVo user = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(UserVo.class));
      
      affectedRows = unitmanAdmDao.setSingleUser(user);
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int deleteUserList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<UserVo> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, UserVo.class));
      
      for (UserVo user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("mode", paramMap.get("mode"));
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        
        affectedRows += unitmanAdmDao.deleteSingleUser(map);
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
      List<UserVo> userlist = objectMapper.readValue(jsonString, 
          objectMapper.getTypeFactory().constructCollectionType(List.class, UserVo.class));
      
      for (UserVo user : userlist) {
        affectedRows += unitmanAdmDao.setSingleUserSort(user);
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
        paramMap.put("parentDeptId", unitmanAdmDao.getRootDept(compId));
      }
      
      affectedRows = unitmanAdmDao.moveSingleDept(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      List<DepartmentVo> deptlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, DepartmentVo.class));
      
      for (DepartmentVo dept : deptlist) {
        affectedRows += unitmanAdmDao.setSingleDeptSort(dept);
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
      List<UserVo> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, UserVo.class));
      
      for (UserVo user : userlist) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("compId", user.getCompId());
        map.put("userId", user.getUserId());
        map.put("deptId", paramMap.get("deptId"));
        
        affectedRows += unitmanAdmDao.moveSingleUser(map);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
    
}
