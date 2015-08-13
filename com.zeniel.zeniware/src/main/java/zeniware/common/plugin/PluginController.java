package zeniware.common.plugin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.plugin.vo.SelectOption;
import zeniware.common.plugin.vo.TreeNode;
import zeniware.common.plugin.service.PluginService;

@Controller
public class PluginController {
  
  @Autowired
  PluginService pluginService;
  
  @RequestMapping("/admin/ajax/getSboxCodelist")
  public void getSboxCodelist(@RequestParam Map<String, Object> paramMap, 
      HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<SelectOption> list = pluginService.getSboxCodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getNodelistSearch")
  public void getTreeNodelistSearch(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = pluginService.getNodeListSearch(paramMap);
      
      if (list.size() == 0) {
        list.add(new TreeNode().setId("empty").setText("검색 결과가 없습니다").setParent("#").setIcon("fa fa-exclamation"));
      }
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getNodelistDefer")
  public void getNodelistDefer(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = pluginService.getNodeListDefer(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }

}
