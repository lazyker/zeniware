package zeniware.admin.codeman;

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

import zeniware.admin.codeman.service.CodeManService;
import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;
import zeniware.common.login.MemberInfo;

@Controller
public class CodeManController {
  
  @Autowired
  CodeManService codemanService;

  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/codeMain")
  public String requestCodeMain(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {

    try {
      model.put("currentUser", auth.getPrincipal());
      model.put("groupId", paramMap.get("groupId"));
      System.out.println("entitlement: " + ((MemberInfo)auth.getPrincipal()).getEntitlement());
    } catch (Exception e) { throw e; }
    
    return "/preferenceLayout/codeMain";
  }
  
  @RequestMapping(value="/admin/preference/codeNew", method=RequestMethod.GET)
  public String requestSingleCodeForm(
    @RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) throws Throwable {

    try {
      String paramGroupId = (String)paramMap.get("groupId");
      String paramCodeId = (String)paramMap.get("codeId");
      
      model.put("currentUser", auth.getPrincipal());
      model.put("commonCode", (paramCodeId == null) ? this.codeMaker(paramGroupId) : this.codeMaker(paramMap));
      
    } catch (Exception e) { throw e; }

    return "/preferenceLayout/codeNew";
  }
  
  @RequestMapping(value="/admin/preference/codeNew", method=RequestMethod.POST)
  public String requestSingleCodeSubmit(@ModelAttribute CommonCode commonCode, ModelMap model) throws Throwable {
    
    try {
      codemanService.setSingleCode(commonCode);
      
    } catch (Exception e) { throw e; }
    
    return "redirect:/admin/preference/codeMain";
  }
    
  @RequestMapping("/admin/ajax/getGrouplist")
  public void getGroupList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      List<CommonGroup> list = codemanService.getGroupList();
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getCodelist")
  public void getCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    try {
      List<CommonCode> list = codemanService.getCodeList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/getSingleCodeExists")
  public void getSingleCodeExists(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      int cnt = codemanService.getSingleCodeExists(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), cnt);
      
    } catch (Exception e) { throw e; }
  }
  
  @RequestMapping("/admin/ajax/deleteCodelist")
  public void deleteCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    try {
      String jsonString = (String)paramMap.get("codelist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<CommonCode> codelist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, CommonCode.class));
      
      int affectedRows = codemanService.delCodeList(codelist);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), affectedRows);
      
    } catch (Exception e) { throw e; }
  }
  
  /*********************
   * Private Procedures
   *********************/
  private CommonCode codeMaker(String groupID) {
    
    return new CommonCode(groupID);
  }
  
  private CommonCode codeMaker(Map<String, Object> paramMap) {
    
    return codemanService.getSingleCode(paramMap);
  }
  
}
