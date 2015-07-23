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

@Controller
public class PluginManController {
  
  @Autowired
  PluginManService pluginmanService;
  
  @RequestMapping("/admin/ajax/getSboxCodelist")
  public void getAjaxSboxContent(@RequestParam Map<String, Object> paramMap, 
      HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<SelectOption> list = pluginmanService.getSboxCodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }

}
