package zeniware.common.modal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Company;
import zeniware.admin.unitman.vo.Department;
import zeniware.admin.unitman.vo.User;
import zeniware.common.plugin.service.PluginService;
import zeniware.common.plugin.vo.SelectOption;

@Controller
public class ModalController {
  
  @Autowired
  UnitManService unitmanService;
  
  @Autowired
  PluginService pluginService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/modal/admin/compNew")
  public String requestCompNew(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmCompId = (String)paramMap.get("compId");      
      model.put("comp", prmCompId == null ? this.compMaker() : this.compMaker(paramMap));
      
    } catch (Exception e) { throw e; }
    
    return "/modal/admin/compNew";
  }
  
  @RequestMapping("/modal/admin/deptNew")
  public String requestDeptNew(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmCompId = (String)paramMap.get("compId");
      String prmDeptId = (String)paramMap.get("deptId");
      String prmParDeptId = (String)paramMap.get("parDeptId");
      String prmParDeptName = (String)paramMap.get("parDeptName");
      
      model.put("dept", prmDeptId == null ? 
        this.deptMaker(prmCompId, prmParDeptId, prmParDeptName) : this.deptMaker(paramMap));
      
      model.put("sboxUser", this.userlistMaker(prmCompId, prmDeptId));
      model.put("opener", paramMap.get("opener"));
      
    } catch (Exception e) { throw e; }
    
    return "/modal/admin/deptNew";
  }
  
  @RequestMapping("/modal/admin/userNew")
  public String requestUserNew(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmCompId = (String)paramMap.get("compId");
      String prmUserId = (String)paramMap.get("userId");
      String prmDeptId = (String)paramMap.get("deptId");
      String prmDeptName = (String)paramMap.get("deptName");
      
      model.put("user", prmUserId == null ? 
        this.userMaker(prmCompId, prmDeptId, prmDeptName) : this.userMaker(paramMap));
      
      model.put("sboxEntitle", this.makeSelectbox("A0000", "KO"));
      model.put("sboxJobTitle", this.makeSelectbox("A0001", "KO"));
      model.put("sboxJobGrade", this.makeSelectbox("A0002", "KO"));
      model.put("sboxJobRole", this.makeSelectbox("A0003", "KO"));
      model.put("sboxLanguage", this.makeSelectbox("A0004", "KO"));     
      
    } catch (Exception e) { throw e; }
    
    return "/modal/admin/userNew";
  }
  
  @RequestMapping("/modal/admin/userTable")
  public String requestDeptMemberSort(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    model.put("deptId", paramMap.get("deptId"));
    
    return "/modal/admin/userTable";
  }
  
  @RequestMapping("/modal/admin/deptTree")
  public String requestJstreeDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("opener", paramMap.get("opener"));
    
    return "/modal/admin/deptTree";
  }
  
  @RequestMapping("/modal/unitTest")
  public String requestUnitTest(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    model.put("deptId", paramMap.get("deptId"));
    
    return "/modal/unitTest";
  }
  
  /*********************
   * Private Procedures
   *********************/
  private Company compMaker() {
    return new Company().setActivateYn(true);
  }
  
  private Company compMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleComp(paramMap);
  }
  
  private Department deptMaker(String compId, String parentDeptId, String parentDeptName) {
    return new Department().setCompId(compId)
      .setParentDeptId(parentDeptId).setParentDeptName(parentDeptName).setActivateYn(true);
  }
  
  private Department deptMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleDept(paramMap);
  }
  
  private User userMaker(String compId, String deptId, String deptName) {
    return new User().setCompId(compId).setDeptId(deptId)
      .setDeptName(deptName).setActivateYn(true).setUseSolarYn(true).setSecurityLevel(10);
  }
  
  private User userMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleUser(paramMap);
  }
  
  private List<User> userlistMaker(String compId, String deptId) {
    
    Map<String, Object> paramMap = new HashMap<String, Object>();
    
    paramMap.put("compId", compId);
    paramMap.put("deptId", deptId);
    paramMap.put("resigned", 0);
   
    return unitmanService.getUserList(paramMap);
  }
  
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

}
