package zeniware.admin.pluginman;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.pluginman.service.PluginManService;
import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.admin.pluginman.vo.TreeNode;

@Controller
public class PluginManController {
  
  @Autowired
  PluginManService pluginmanService;
  
  @RequestMapping("/admin/ajax/getSboxCodelist")
  public void getSboxCodelist(@RequestParam Map<String, Object> paramMap, 
      HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<SelectOption> list = pluginmanService.getSboxCodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getNodelist")
  public void getTreeNodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = pluginmanService.getTreeNodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getNodelistSearch")
  public void getTreeNodelistSearch(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = pluginmanService.getNodeListSearch(paramMap);
      
      if (list.size() == 0) {
        list.add(new TreeNode().setId("empty").setText("검색 결과가 없습니다").setParent("#").setIcon("fa fa-exclamation"));
      }
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getDeferredNodelist")
  public void getDeferredNodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = pluginmanService.getDeferredNodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }

}
