package zeniware.common.plugin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.common.plugin.vo.SelectOption;
import zeniware.common.plugin.vo.TreeNode;
import zeniware.common.sql.AbstractDao;

@Repository
public class PluginDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap) {
    return (List<SelectOption>)selectList("common.plugin.getSboxCodeList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNode> getNodeListSearch(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("common.plugin.getNodeListSearch", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNode> getNodeListDefer(Map<String, Object> paramMap) {
    return (List<TreeNode>)selectList("common.plugin.getNodeListDefer", paramMap);
  }
  
  public int getChildNodeCount(Map<String, Object> paramMap) {
    return (int)selectOne("common.plugin.getChildNodeCount", paramMap);
  }
  
}
