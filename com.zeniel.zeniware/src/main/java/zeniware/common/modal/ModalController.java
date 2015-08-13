package zeniware.common.modal;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.unitman.service.UnitManService;
import zeniware.admin.unitman.vo.Department;

@Controller
public class ModalController {
  
  @Autowired
  UnitManService unitmanService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/modal/deptNew")
  public String requestUnitNewDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    try {
      String prmCompId = (String)paramMap.get("compId");
      String prmDeptId = (String)paramMap.get("deptId");
      String prmParDeptId = (String)paramMap.get("parDeptId");
      String prmParDeptName = (String)paramMap.get("parDeptName");
      
      model.put("dept", prmDeptId == null ? 
        this.deptMaker(prmCompId, prmParDeptId, prmParDeptName) : this.deptMaker(paramMap));
      
    } catch (Exception e) { throw e; }
    
    return "/modal/deptNew";
  }
  
  @RequestMapping("/modal/deptMemberSort")
  public String requestDeptMemberSort(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/modal/deptMemberSort";
  }
  
  @RequestMapping("/modal/jstreeDept")
  public String requestJstreeDept(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/modal/jstreeDept";
  }
  
  @RequestMapping("/modal/unitTest")
  public String requestUnitTest(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/modal/unitTest";
  }
  
  /*********************
   * Private Procedures
   *********************/
  private Department deptMaker(String compId, String parentDeptId, String parentDeptName) {
    return new Department().setCompId(compId).setParentDeptId(parentDeptId).setParentDeptName(parentDeptName);
  }
  
  private Department deptMaker(Map<String, Object> paramMap) {
    return unitmanService.getSingleDept(paramMap);
  }

}
