package zeniware.common.plugin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.common.plugin.service.PluginService;
import zeniware.common.plugin.vo.SelectOption;
import zeniware.common.plugin.vo.TreeNode;
import zeniware.common.plugin.dao.PluginDao;

@Service
public class PluginServiceImpl implements PluginService {
  
  @Autowired
  private PluginDao pluginDao;

  @Override
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap) {
    return pluginDao.getSboxCodeList(paramMap);
  }
  
  @Override
  public List<TreeNode> getNodeListSearch(Map<String, Object> paramMap) {
    return pluginDao.getNodeListSearch(paramMap);
  }
  
  @Override
  public List<TreeNode> getNodeListDefer(Map<String, Object> paramMap) {
    return pluginDao.getNodeListDefer(paramMap);
  }
  
  @Override
  public int getChildNodeCount(Map<String, Object> paramMap) {
    return pluginDao.getChildNodeCount(paramMap);
  }
  
}
