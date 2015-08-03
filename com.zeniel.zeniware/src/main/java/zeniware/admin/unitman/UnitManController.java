package zeniware.admin.unitman;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.pluginman.service.PluginManService;
import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;

@Controller
public class UnitManController {
  
  @Autowired
  UnitManService unitmanService;
  
  @Autowired
  PluginManService pluginmanService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/unitSelect")
  public String requestUnitSelect(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {
    
    model.put("currentUser", auth.getPrincipal());
    
    return "/preferenceLayout/unitSelect";
  }
  
  @RequestMapping("/admin/preference/unitMain")
  public String requestUnitMain(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {
    
    model.put("currentUser", auth.getPrincipal());
    model.put("compId", paramMap.get("compId"));
    
    return "/preferenceLayout/unitMain";
  }
  
  @RequestMapping("/admin/preference/unitResignedUser")
  public String requestUnitResignedUser(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {
    
    model.put("currentUser", auth.getPrincipal());
    model.put("compId", paramMap.get("compId"));
    
    return "/preferenceLayout/unitResignedUser";
  }
  
  @RequestMapping("/admin/preference/unitClosedDept")
  public String requestUnitClosedDept(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {
    
    model.put("currentUser", auth.getPrincipal());
    model.put("compId", paramMap.get("compId"));
    
    return "/preferenceLayout/unitClosedDept";
  }
  
  @RequestMapping(value="/admin/preference/unitNewUser", method=RequestMethod.GET)
  public String requestUnitNewUserForm(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {

    try {
      String paramCompId = (String)paramMap.get("compId");
      String paramUserId = (String)paramMap.get("userId");
      String paramDeptId = (String)paramMap.get("deptId");
      String paramDeptName = (String)paramMap.get("deptName");
      
      model.put("currentUser", auth.getPrincipal());
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
  
  @RequestMapping(value="/admin/preference/unitNewDept", method=RequestMethod.GET)
  public String requestUnitNewDeptForm(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String paramCompId = (String)paramMap.get("compId");
      String paramDeptId = (String)paramMap.get("deptId");
      String paramPrtDeptId = (String)paramMap.get("prtDeptId");
      String paramPrtDeptName = (String)paramMap.get("prtDeptName");
      
      model.put("dept", paramDeptId == null ? 
        this.deptMaker(paramCompId, paramPrtDeptId, paramPrtDeptName) : this.deptMaker(paramMap));
      
    } catch (Exception e) { throw e; }
    
    return "/admin/preference/unitNewDept";
  }
    
  @RequestMapping("/admin/ajax/getComplist")
  public void getCompList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<Company> list = unitmanService.getCompList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getUserlist")
  public void getUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    try {
      List<User> list = unitmanService.getUserList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/resignUserlist")
  public void resignUserlist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<User> userlist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, User.class));
      
      int affectedRows = unitmanService.resignUserList(userlist);
      
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
      
      list = pluginmanService.getSboxCodeList(paramMap);
      
    } catch (Exception e) { throw e; }
    
    return list;
  }
  
  private Department deptMaker(String compId, String parentDeptId, String parentDeptName) {
    return new Department(compId, parentDeptId, parentDeptName);
  }
  
  private Department deptMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleDept(paramMap);
  }
  
  private User userMaker(String compId, String deptId) {
    return new User(compId, deptId);
  }
  
  private User userMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleUser(paramMap);
  }
  
}
