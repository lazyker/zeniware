package zeniware.admin.unitman.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.unitman.dao.UnitManDao;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.TreeNode;
import zeniware.admin.unitman.vo.User;

@Service
public class UnitManServiceImpl implements UnitManService {
  
  @Autowired
  private UnitManDao unitmanDao;

  @Override
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return unitmanDao.getTreeNodeList(paramMap);
  }
  
  @Override
  public List<Company> getCompList(Map<String, Object> paramMap) {
    return unitmanDao.getCompList(paramMap);
  }
  
  @Override
  public List<User> getUserList(Map<String, Object> paramMap) {
    return unitmanDao.getUserList(paramMap);
  }
}
