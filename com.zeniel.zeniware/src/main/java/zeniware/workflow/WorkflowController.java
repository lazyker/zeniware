package zeniware.workflow;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WorkflowController {
  
  @RequestMapping("/workflow/workflowMain")
  public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/workflowLayout/workflowMain";
  }

}
