package zeniware.admin.unitman.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.unitman.vo.TreeNode;

public interface UnitManService {
  
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap);

}
