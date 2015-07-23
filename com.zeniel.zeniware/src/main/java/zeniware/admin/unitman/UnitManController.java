package zeniware.admin.unitman;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.TreeNode;
import zeniware.admin.unitman.vo.User;

@Controller
public class UnitManController {
  
  @Autowired
  UnitManService unitmanService;
  
  @RequestMapping("/admin/preference/unitSelect")
  public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    return "/preferenceLayout/unitSelect";
  }
  
  @RequestMapping("/admin/preference/unitMain")
  public String requestUnitMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    
    return "/preferenceLayout/unitMain";
  }
  
  @RequestMapping("/admin/preference/unitClosedDept")
  public String requestUnitClosedDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    
    return "/preferenceLayout/unitClosedDept";
  }
  
  @RequestMapping(value="/admin/preference/unitAddUser", method=RequestMethod.GET)
  public String requestUnitAddUserForm(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

    try {
      model.put("compId", paramMap.get("compId"));
      model.put("deptId", paramMap.get("deptId"));
      model.put("deptName", paramMap.get("deptName"));
      
    } catch (Exception e) { throw e; }

    return "/preferenceLayout/unitAddUser";
  }
  
  @RequestMapping(value="/admin/preference/unitAddUser", method=RequestMethod.POST)
  public String requestUnitAddUserSubmit(@ModelAttribute CommonCode commonCode, ModelMap model) throws Throwable {
    
    try {
    } catch (Exception e) { throw e; }
    
    return "redirect:/admin/preference/unitMain";
  }
  
  @RequestMapping("/admin/ajax/getNodelist")
  public void getAjaxTreeNodeList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<TreeNode> list = unitmanService.getTreeNodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getComplist")
  public void getAjaxCompList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<Company> list = unitmanService.getCompList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  
  @RequestMapping("/admin/ajax/getUserlist")
  public void getAjaxUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<User> list = unitmanService.getUserList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
}
