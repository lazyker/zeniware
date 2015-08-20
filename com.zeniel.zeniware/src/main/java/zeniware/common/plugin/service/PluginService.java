package zeniware.common.plugin.service;

import java.util.List;
import java.util.Map;

import zeniware.common.plugin.vo.SelectOption;
import zeniware.common.plugin.vo.TreeNode;

public interface PluginService {
  
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap);
  
  public List<TreeNode> getNodeListSearch(Map<String, Object> paramMap);
  
  public List<TreeNode> getNodeListDefer(Map<String, Object> paramMap);
  
  public int getChildNodeCount(Map<String, Object> paramMap);

}
