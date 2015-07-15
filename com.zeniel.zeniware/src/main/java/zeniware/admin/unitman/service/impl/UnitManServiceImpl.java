package zeniware.admin.unitman.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.unitman.dao.UnitManDao;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.TreeNode;

@Service
public class UnitManServiceImpl implements UnitManService {
  
  @Autowired
  private UnitManDao unitmanDao;

  @Override
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return unitmanDao.getTreeNodeList(paramMap);
  }
}
