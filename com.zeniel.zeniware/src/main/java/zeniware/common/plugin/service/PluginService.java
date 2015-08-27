package zeniware.common.plugin.service;

import java.util.List;
import java.util.Map;

import zeniware.common.plugin.vo.SelectOptionVo;
import zeniware.common.plugin.vo.TreeNodeVo;

public interface PluginService {
  
  public List<SelectOptionVo> getSboxCodeList(Map<String, Object> paramMap);
  
  public List<TreeNodeVo> getNodeListSearch(Map<String, Object> paramMap);
  
  public List<TreeNodeVo> getNodeListDefer(Map<String, Object> paramMap);
  
  public int getChildNodeCount(Map<String, Object> paramMap);

}
