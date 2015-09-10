package zeniware.admin.workflow;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.workflow.service.WorkFlowAdmService;

@Controller
@RequestMapping("/admin/workflow/modal")
public class WorkFlowAdmModalController {
	
	@Autowired
	WorkFlowAdmService workflowAdmService;

	/*********************
   * Public Procedures
   *********************/
  @RequestMapping("/formContNew")
  public String requestFormContNew(@RequestParam Map<String, Object> paramMap, ModelMap model) {  	
  	
  	return "/admin/workflow/modal/formContNew";
  }
  
  /*********************
   * Private Procedures
   *********************/
  
}
