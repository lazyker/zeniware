package zeniware.admin.unitman;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.codeman.vo.CommonGroup;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.TreeNode;

@Controller
public class UnitManController {
  
  @Autowired
  UnitManService unitmanService;
  
  @RequestMapping("/admin/preference/memberMain")
  public String redirectMemberMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    return "/preferenceLayout/preference/memberMain";
  }
  
  @RequestMapping("/admin/ajax/getTreeNodelist")
  public void getAjaxTreeNodeList(@RequestParam Map<String, Object> paramMap, 
      HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = unitmanService.getTreeNodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }

}
