package zeniware.admin.workflow;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.workflow.service.WorkFlowAdmService;
import zeniware.admin.workflow.vo.ConfigVo;
import zeniware.common.login.MemberInfo;
import zeniware.common.util.StreamMapper;

@Controller
@RequestMapping("/admin/workflow")
public class WorkFlowAdmController {
	
	@Autowired
	WorkFlowAdmService workflowAdmService;

	/*********************
   * Public Procedures
   *********************/
  @RequestMapping("/basicInit")
  public String requestBasicInit(@RequestParam Map<String, Object> paramMap, ModelMap model, Authentication auth) {
  	
  	MemberInfo curUser = (MemberInfo)auth.getPrincipal();
  	
  	model.put("conf", this.confMaker(curUser.getCompId()));
    
    return "/workflowAdminLayout/basicInit";
  }
  
  @RequestMapping("/formMaker")
  public String requestFormMain(@RequestParam Map<String, Object> paramMap, ModelMap model) {
  	
  	return "/workflowAdminLayout/formMaker";
  }
  
  @RequestMapping("/ajax/setSingleConf")
  public void setSingleConf(@RequestParam Map<String, Object> paramMap, 
		HttpServletRequest request, HttpServletResponse response) throws Throwable {
  	
  	StreamMapper.writeValue(response, workflowAdmService.setSingleConf(paramMap));
  }
  
  /*********************
   * Private Procedures
   *********************/
  private ConfigVo confMaker(String compId) {
  	
  	ConfigVo conf = workflowAdmService.getSingleConf(compId);
  	
  	if (conf == null) {
  		conf = new ConfigVo().setCompId(compId).setSignYn(true).setPassYn(true)
				.setTitleYn(true).setAgreementYn(true).setNamingPrefix("d").setNamingYear(4).setNamingDigit(5);
  	}
  	
  	return conf;
  }
  
}
