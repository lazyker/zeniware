package zeniware.admin.pluginman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.admin.pluginman.vo.TreeNode;
import zeniware.common.sql.AbstractDao;

@Repository
public class PluginManDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap) {
    return (List<SelectOption>)selectList("admin.pluginman.getSboxCodeList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("admin.pluginman.getNodeListRecursive", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNode> getNodeListSearch(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("admin.pluginman.getNodeListSearch", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNode> getDeferredNodeList(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("admin.pluginman.getNodeListDeferred", paramMap);
  }
  
}
