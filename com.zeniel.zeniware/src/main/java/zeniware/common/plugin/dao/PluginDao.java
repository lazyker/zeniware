package zeniware.common.plugin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.common.plugin.vo.SelectOptionVo;
import zeniware.common.plugin.vo.TreeNodeVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class PluginDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<SelectOptionVo> getSboxCodeList(Map<String, Object> paramMap) {
    return (List<SelectOptionVo>)selectList("common.plugin.getSboxCodeList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNodeVo> getNodeListSearch(Map<String, Object> paramMap) {
    return (List<TreeNodeVo>)selectList("common.plugin.getNodeListSearch", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<TreeNodeVo> getNodeListDefer(Map<String, Object> paramMap) {
    return (List<TreeNodeVo>)selectList("common.plugin.getNodeListDefer", paramMap);
  }
  
  public int getChildNodeCount(Map<String, Object> paramMap) {
    return (int)selectOne("common.plugin.getChildNodeCount", paramMap);
  }
  
}
