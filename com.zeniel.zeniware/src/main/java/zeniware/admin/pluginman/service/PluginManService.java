package zeniware.admin.pluginman.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.pluginman.vo.SelectOption;

public interface PluginManService {
  
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap);

}
