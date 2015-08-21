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

import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

@Controller
public class UnitManController {
  
  @Autowired
  UnitManService unitmanService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/unitSelect")
  public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    return "/preferenceLayout/unitSelect";
  }
  
  @RequestMapping("/admin/preference/unitMain")
  public String requestUnitMain(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitMain";
  }
  
  @RequestMapping("/admin/preference/unitDeletedComp")
  public String requestUnitDeletedComp(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    return "/preferenceLayout/unitDeletedComp";
  }
  
  @RequestMapping("/admin/preference/unitDeletedDept")
  public String requestUnitClosedDept(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedDept";
  }
  
  @RequestMapping("/admin/preference/unitDeletedUser")
  public String requestUnitResignedUser(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedUser";
  }
  
  @RequestMapping("/admin/ajax/getComplist")
  public void getCompList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<Company> list = unitmanService.getCompList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getDeptlist")
  public void getDeptList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<Department> list = unitmanService.getDeptList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getUserlist")
  public void getUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    try {
      List<User> list = unitmanService.getUserList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getSingleUser")
  public void getSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      User user = unitmanService.getSingleUser(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), user);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleComp")
  public void setSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {      
      int affectedRows = unitmanService.setSingleComp(paramMap);

      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleDept")
  public void setSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.setSingleDept(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleUser")
  public void setSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.setSingleUser(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/moveSingleDept")
  public void moveSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.moveSingleDept(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/moveUserList")
  public void moveUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.moveUserList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setUserListSort")
  public void setUserListSort(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.setUserListSort(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/deleteSingleComp")
  public void deleteSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.deleteSingleComp(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/deleteUserList")
  public void deleteUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.deleteUserList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/deleteSingleDept")
  public void deleteSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.deleteSingleDept(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  
  @RequestMapping("/admin/ajax/restoreSingleComp")
  public void restoreSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.restoreSingleComp(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/restoreUserList")
  public void restoreSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int affectedRows = unitmanService.restoreUserList(paramMap);
      
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
    
}
