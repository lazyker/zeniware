package zeniware.admin.unitman.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.TreeNode;
import zeniware.admin.unitman.vo.User;

public interface UnitManService {
  
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap);
  
  public List<Company> getCompList(Map<String, Object> paramMap);
  
  public List<User> getUserList(Map<String, Object> paramMap);

}
