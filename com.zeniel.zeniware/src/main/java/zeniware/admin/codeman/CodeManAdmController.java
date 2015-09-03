package zeniware.admin.codeman;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.codeman.service.CodeManAdmService;
import zeniware.common.util.StreamMapper;

@Controller
@RequestMapping("/admin/preference")
public class CodeManAdmController {
  
  @Autowired
  CodeManAdmService codemanAdmService;

  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/codeMain")
  public String requestCodeMain(@RequestParam Map<String, Object> paramMap, ModelMap model) {

    model.put("groupId", paramMap.get("groupId"));
    return "/preferenceLayout/codeMain";
  }
  
  @RequestMapping("/ajax/getGrouplist")
  public void getGroupList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.getGroupList());
  }
  
  @RequestMapping("/ajax/getCodelist")
  public void getCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    StreamMapper.writeValue(response, codemanAdmService.getCodeList(paramMap));
  }
  
  @RequestMapping("/ajax/getSingleCodeExists")
  public void getSingleCodeExists(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.getSingleCodeExists(paramMap));
  }
  
  @RequestMapping("/ajax/setSingleCode")
  public void setSingleCode(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.setSingleCode(paramMap));
  }
  
  @RequestMapping("/ajax/setCodeListSort")
  public void setCodeListSort(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.setCodeListSort(paramMap));
  }
  
  @RequestMapping("/ajax/deleteCodeList")
  public void deleteCodeList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.deleteCodeList(paramMap));
  }
  
}
