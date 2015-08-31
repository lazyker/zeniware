package zeniware.admin.workflow;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WorkFlowAdmController {

  @RequestMapping("/admin/workflow/basicInit")
  public String requestBasicInit(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    return "/workflowadminLayout/basicInit";
  }
  
}
