package zeniware.admin.unitman.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.codeman.vo.CommonCode;
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
  public Department getSingleDept(Map<String, Object> paramMap) {
    return unitmanDao.getSingleDept(paramMap);
  }
  
  @Override
  public User getSingleUser(Map<String, Object> paramMap) {
    return unitmanDao.getSingleUser(paramMap);
  }
  
  @Override
  public int setSingleUser(User user) {
    return unitmanDao.setSingleUser(user);
  }
  
  @Override
  public int resignUserList(List<User> userlist) {
    
    int affectedRows = -1;
    
    try {
      for (User user : userlist) {
        affectedRows += unitmanDao.resignSingleUser(user);
      }
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
}
