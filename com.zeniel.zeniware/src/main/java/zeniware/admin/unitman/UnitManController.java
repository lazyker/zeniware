package zeniware.admin.unitman;

import java.util.HashMap;
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

import zeniware.common.plugin.service.PluginService;
import zeniware.common.plugin.vo.SelectOption;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

@Controller
public class UnitManController {
  
  @Autowired
  PluginService pluginService;
  
  @Autowired
  UnitManService unitmanService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/unitSelect")
  public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/preferenceLayout/unitSelect";
  }
  
  @RequestMapping("/admin/preference/unitMain")
  public String requestUnitMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitMain";
  }
  
  @RequestMapping("/admin/preference/unitDeletedComp")
  public String requestUnitDeletedComp(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/preferenceLayout/unitDeletedComp";
  }
  
  @RequestMapping("/admin/preference/unitDeletedDept")
  public String requestUnitClosedDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedDept";
  }
  
  @RequestMapping("/admin/preference/unitResignedUser")
  public String requestUnitResignedUser(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitResignedUser";
  }
  
  @RequestMapping(value="/admin/preference/unitNewUser", method=RequestMethod.GET)
  public String requestUnitNewUserForm(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

    try {
      String paramCompId = (String)paramMap.get("compId");
      String paramUserId = (String)paramMap.get("userId");
      String paramDeptId = (String)paramMap.get("deptId");
      String paramDeptName = (String)paramMap.get("deptName");
      
      model.put("user", paramUserId == null ? this.userMaker(paramCompId, paramDeptId) : this.userMaker(paramMap));
      
      model.put("compId", paramCompId);
      model.put("deptName", paramDeptName);

      model.put("sboxEntitle", this.makeSelectbox("A0000", "KO"));
      model.put("sboxJobTitle", this.makeSelectbox("A0001", "KO"));
      model.put("sboxJobGrade", this.makeSelectbox("A0002", "KO"));
      model.put("sboxJobRole", this.makeSelectbox("A0003", "KO"));
      model.put("sboxLanguage", this.makeSelectbox("A0004", "KO"));      
      
    } catch (Exception e) { throw e; }

    return "/preferenceLayout/unitNewUser";
  }
  
  @RequestMapping(value="/admin/preference/unitNewUser", method=RequestMethod.POST)
  public String requestUnitNewUserSubmit(@ModelAttribute User user) throws Throwable {
    
    try {
      unitmanService.setSingleUser(user);
      
    } catch (Exception e) { throw e; }
    
    return "redirect:/admin/preference/unitMain?compId=" + user.getCompId();
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
      User user = this.userMaker(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), user);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleComp")
  public void setSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {      
      String jsonString = (String)paramMap.get("comp");
      ObjectMapper objectMapper = new ObjectMapper();
      Company comp = objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructType(Company.class));
      
      int affectedRows = unitmanService.setSingleComp(comp);
      
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleDept")
  public void setSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {      
      String jsonString = (String)paramMap.get("dept");
      ObjectMapper objectMapper = new ObjectMapper();
      Department dept = objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructType(Department.class));
      
      int affectedRows = unitmanService.setSingleDept(dept);
      
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/setSingleUser")
  public void setSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      String jsonString = (String)paramMap.get("user");
      ObjectMapper objectMapper = new ObjectMapper();
      User user = objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructType(User.class));
      
      int affectedRows = unitmanService.setSingleUser(user);
      
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
  
  @RequestMapping("/admin/ajax/softDeleteUserlist")
  public void softDeleteUserlist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<User> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      int affectedRows = unitmanService.softDeleteUserList(userlist);
      
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
  
  /*********************
   * Private Procedures
   *********************/
  private List<SelectOption> makeSelectbox(String groupId, String langCode) {
    
    List<SelectOption> list = null;
    
    try {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("groupId", groupId);
      paramMap.put("langCode", langCode);
      
      list = pluginService.getSboxCodeList(paramMap);
      
    } catch (Exception e) { throw e; }
    
    return list;
  }
  
  private User userMaker(String compId, String deptId) {
    return new User().setCompId(compId).setDeptId(deptId)
      .setActivateYn(true).setUseSolarYn(true).setSecurityLevel(10).setSortOrder(0);
  }
  
  private User userMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleUser(paramMap);
  }
  
}
