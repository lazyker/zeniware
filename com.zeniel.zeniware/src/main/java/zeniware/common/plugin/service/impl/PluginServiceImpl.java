package zeniware.common.plugin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.common.plugin.service.PluginService;
import zeniware.common.plugin.vo.SelectOptionVo;
import zeniware.common.plugin.vo.TreeNodeVo;
import zeniware.common.plugin.dao.PluginDao;

@Service
public class PluginServiceImpl implements PluginService {
  
  @Autowired
  private PluginDao pluginDao;

  @Override
  public List<SelectOptionVo> getSboxCodeList(Map<String, Object> paramMap) {
    return pluginDao.getSboxCodeList(paramMap);
  }
  
  @Override
  public List<TreeNodeVo> getNodeListSearch(Map<String, Object> paramMap) {
    List<TreeNodeVo> list = pluginDao.getNodeListSearch(paramMap);
    
    if (list.size() == 0) {
      list.add(new TreeNodeVo().setId("empty").setText("검색 결과가 없습니다").setParent("#").setIcon("fa fa-exclamation"));
    }
    
    return list;
  }
  
  @Override
  public List<TreeNodeVo> getNodeListDefer(Map<String, Object> paramMap) {
    return pluginDao.getNodeListDefer(paramMap);
  }
  
  @Override
  public int getChildNodeCount(Map<String, Object> paramMap) {
    return pluginDao.getChildNodeCount(paramMap);
  }
  
}
