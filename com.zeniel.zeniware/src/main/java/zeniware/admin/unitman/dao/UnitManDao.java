package zeniware.admin.unitman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.unitman.vo.TreeNode;
import zeniware.common.sql.AbstractDao;

@Repository
public class UnitManDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("admin.getTreeNodeList", paramMap);
  }
  
}
