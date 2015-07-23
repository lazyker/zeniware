package zeniware.admin.unitman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.TreeNode;
import zeniware.admin.unitman.vo.User;
import zeniware.common.sql.AbstractDao;

@Repository
public class UnitManDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("admin.unitman.getTreeNodeList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<Company> getCompList(Map<String, Object> paramMap) {
    return (List<Company>)selectList("admin.unitman.getCompList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<User> getUserList(Map<String, Object> paramMap) {
    return (List<User>)selectList("admin.unitman.getUserList", paramMap);
  }
  
}
