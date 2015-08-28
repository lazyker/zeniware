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
public class CodeManAdmController {
  
  @Autowired
  CodeManAdmService codemanAdmService;

  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/codeMain")
  public String requestCodeMain(@RequestParam Map<String, Object> paramMap, ModelMap model) {

    model.put("groupId", paramMap.get("groupId"));
    return "/preferenceLayout/codeMain";
  }
  
//  @RequestMapping(value="/admin/preference/codeNew", method=RequestMethod.GET)
//  public String requestSingleCodeForm(@RequestParam Map<String, Object> paramMap, ModelMap model) {
//
//    String prmGroupId = (String)paramMap.get("groupId");
//    String prmCodeId = (String)paramMap.get("codeId");
//    
//    model.put("code", 
//      (prmCodeId == null) ? 
//        new CodeVo().setGroupId(prmGroupId).setSortOrder(0).setUseYn(true) : codemanAdmService.getSingleCode(paramMap)
//    );
//   
//    return "/preferenceLayout/codeNew";
//  }
//  
//  @RequestMapping(value="/admin/preference/codeNew", method=RequestMethod.POST)
//  public String requestSingleCodeSubmit(@ModelAttribute CodeVo commonCode, ModelMap model) {
//    
//    codemanAdmService.setSingleCode(commonCode);
//    return "redirect:/admin/preference/codeMain";
//  }
    
  @RequestMapping("/admin/ajax/getGrouplist")
  public void getGroupList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.getGroupList());
  }
  
  @RequestMapping("/admin/ajax/getCodelist")
  public void getCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    StreamMapper.writeValue(response, codemanAdmService.getCodeList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/getSingleCodeExists")
  public void getSingleCodeExists(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.getSingleCodeExists(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setSingleCode")
  public void setSingleCode(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.setSingleCode(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setCodeListSort")
  public void setCodeListSort(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.setCodeListSort(paramMap));
  }
  
  @RequestMapping("/admin/ajax/deleteCodeList")
  public void deleteCodeList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, codemanAdmService.deleteCodeList(paramMap));
  }
  
}
