package zeniware.common.plugin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.plugin.service.PluginService;
import zeniware.common.util.StreamMapper;

@Controller
public class PluginController {
  
  @Autowired
  PluginService pluginService;
  
  @RequestMapping("/plugin/ajax/getNodelistSearch")
  public void getTreeNodelistSearch(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, pluginService.getNodeListSearch(paramMap));
  }
  
  @RequestMapping("/plugin/ajax/getNodelistDefer")
  public void getNodelistDefer(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, pluginService.getNodeListDefer(paramMap));
  }
  
  @RequestMapping("/plugin/ajax/getChildNodeCount")
  public void getChildNodeCount(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, pluginService.getChildNodeCount(paramMap));
  }

}
