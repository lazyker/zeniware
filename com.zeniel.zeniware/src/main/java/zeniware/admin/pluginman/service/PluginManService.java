package zeniware.admin.pluginman.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.admin.pluginman.vo.TreeNode;

public interface PluginManService {
  
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap);
  
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap);
  
  public List<TreeNode> getNodeListSearch(Map<String, Object> paramMap);
  
  public List<TreeNode> getDeferredNodeList(Map<String, Object> paramMap);

}
