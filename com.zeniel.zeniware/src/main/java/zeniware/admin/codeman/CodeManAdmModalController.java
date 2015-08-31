package zeniware.admin.codeman;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.codeman.service.CodeManAdmService;
import zeniware.admin.codeman.vo.CodeVo;

@Controller
public class CodeManAdmModalController {
  
  @Autowired
  CodeManAdmService codemanAdmService;

  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/modal/codeNew")
  public String requestCodeNew(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmGroupId = (String)paramMap.get("groupId");
      String prmCodeId = (String)paramMap.get("codeId");
      
      model.put("code", (prmCodeId == null) ? this.codeMaker(prmGroupId) : this.codeMaker(paramMap));
      model.put("opener", paramMap.get("opener"));
      
    } catch (Exception e) { throw e; }
    
    return "/admin/preference/modal/codeNew";
  }
  
  @RequestMapping("/admin/preference/modal/codeTable")
  public String requestCodeSort(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    model.put("groupId", paramMap.get("groupId"));
    
    return "/admin/preference/modal/codeTable";
  }
  
  /*********************
   * Private Procedures
   *********************/
  private CodeVo codeMaker(String paramGroupId) {
    return new CodeVo().setGroupId(paramGroupId).setSortOrder(0).setUseYn(true);
  }
  
  private CodeVo codeMaker(Map<String, Object> paramMap) {
    return codemanAdmService.getSingleCode(paramMap);
  }
  
}
