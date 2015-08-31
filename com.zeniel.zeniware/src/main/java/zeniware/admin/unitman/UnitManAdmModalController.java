package zeniware.admin.unitman;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.unitman.service.UnitManAdmService;
import zeniware.admin.unitman.vo.CompanyVo;
import zeniware.admin.unitman.vo.DepartmentVo;
import zeniware.admin.unitman.vo.UserVo;
import zeniware.common.plugin.service.PluginService;
import zeniware.common.plugin.vo.SelectOptionVo;
import zeniware.common.util.StreamMapper;

@Controller
public class UnitManAdmModalController {
  
  @Autowired
  UnitManAdmService unitmanAdmService;
  
  @Autowired
  PluginService pluginService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/empty")
  public void requestEmpty(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, "");
  }
  
  @RequestMapping("/admin/preference/modal/compNew")
  public String requestCompNew(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmCompId = (String)paramMap.get("compId");
      
      model.put("comp", prmCompId == null ? this.compMaker() : this.compMaker(paramMap));
      
    } catch (Exception e) { throw e; }
    
    return "/admin/preference/modal/compNew";
  }
  
  @RequestMapping("/admin/preference/modal/deptNew")
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
    
    return "/admin/preference/modal/deptNew";
  }
  
  @RequestMapping("/admin/preference/modal/userNew")
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
    
    return "/admin/preference/modal/userNew";
  }
  
  @RequestMapping("/admin/preference/modal/userTable")
  public String requestDeptMemberSort(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("compId", paramMap.get("compId"));
    model.put("deptId", paramMap.get("deptId"));
    
    return "/admin/preference/modal/userTable";
  }
  
  @RequestMapping("/admin/preference/modal/deptTree")
  public String requestJstreeDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("opener", paramMap.get("opener"));
    
    return "/admin/preference/modal/deptTree";
  }
  
  @RequestMapping("/admin/preference/modal/addressTable")
  public String requestAddressTable(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/admin/preference/modal/addressTable";
  }
  
  /*********************
   * Private Procedures
   *********************/
  private CompanyVo compMaker() {
    return new CompanyVo().setActivateYn(true);
  }
  
  private CompanyVo compMaker(Map<String, Object> paramMap) {
    return unitmanAdmService.getSingleComp(paramMap);
  }
  
  private DepartmentVo deptMaker(String compId, String parentDeptId, String parentDeptName) {
    return new DepartmentVo().setCompId(compId)
      .setParentDeptId(parentDeptId).setParentDeptName(parentDeptName).setActivateYn(true);
  }
  
  private DepartmentVo deptMaker(Map<String, Object> paramMap) {
    return unitmanAdmService.getSingleDept(paramMap);
  }
  
  private UserVo userMaker(String compId, String deptId, String deptName) {
    return new UserVo().setCompId(compId).setDeptId(deptId)
      .setDeptName(deptName).setActivateYn(true).setUseSolarYn(true).setSecurityLevel(10);
  }
  
  private UserVo userMaker(Map<String, Object> paramMap) {
    return unitmanAdmService.getSingleUser(paramMap);
  }
  
  private List<UserVo> userlistMaker(String compId, String deptId) {
    
    Map<String, Object> paramMap = new HashMap<String, Object>();
    
    paramMap.put("compId", compId);
    paramMap.put("deptId", deptId);
    paramMap.put("resigned", 0);
   
    return unitmanAdmService.getUserList(paramMap);
  }
  
  private List<SelectOptionVo> makeSelectbox(String groupId, String langCode) {
    
    List<SelectOptionVo> list = null;
    
    try {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      
      paramMap.put("groupId", groupId);
      paramMap.put("langCode", langCode);
      
      list = pluginService.getSboxCodeList(paramMap);
      
    } catch (Exception e) { throw e; }
    
    return list;
  }
  
}
