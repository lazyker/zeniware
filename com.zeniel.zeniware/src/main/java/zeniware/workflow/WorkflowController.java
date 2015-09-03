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
  
  @RequestMapping("/workflow/flow/flow1")
  public String requestFlow1(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
  	
  	return "/workflowLayout/flow/flow1";
  }
  
  @RequestMapping("/workflow/flow/flow2")
  public String requestFlow2(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
  	
  	return "/workflowLayout/flow/flow2";
  }
  
  @RequestMapping("/workflow/flow/flow3")
  public String requestFlow3(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
  	
  	return "/workflowLayout/flow/flow3";
  }
  
  @RequestMapping("/workflow/folder/folder1")
  public String requestFolder1(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
  	
  	return "/workflowLayout/folder/folder1";
  }
  
  @RequestMapping("/workflow/folder/folder2")
  public String requestFolder2(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
  	
  	return "/workflowLayout/folder/folder2";
  }
  
}
