package zeniware.admin.pluginman.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.pluginman.dao.PluginManDao;
import zeniware.admin.pluginman.service.PluginManService;
import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.admin.pluginman.vo.TreeNode;

@Service
public class PluginManServiceImpl implements PluginManService {
  
  @Autowired
  private PluginManDao pluginmanDao;

  @Override
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap) {
    return pluginmanDao.getSboxCodeList(paramMap);
  }
  
  @Override
  public List<TreeNode> getTreeNodeList(Map<String, Object> paramMap) {
    return pluginmanDao.getTreeNodeList(paramMap);
  }
  
}
