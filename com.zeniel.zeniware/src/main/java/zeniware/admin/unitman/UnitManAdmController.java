package zeniware.admin.unitman;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.unitman.service.UnitManAdmService;
import zeniware.common.util.StreamMapper;

@Controller
@RequestMapping("/admin/preference")
public class UnitManAdmController {
	
	@Autowired
	UnitManAdmService unitmanAdmService;
	
	/*********************
	 * Public Procedures
	 *********************/
	@RequestMapping("/unitSelect")
	public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) {
		return "/preferenceLayout/unitSelect";
	}
	
	@RequestMapping("/unitMain")
	public String requestUnitMain(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
		
		model.put("compId", paramMap.get("compId"));
		return "/preferenceLayout/unitMain";
	}
	
	@RequestMapping("/unitDeletedComp")
	public String requestUnitDeletedComp(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
		return "/preferenceLayout/unitDeletedComp";
	}
	
  @RequestMapping("/unitDeletedDept")
  public String requestUnitClosedDept(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedDept";
  }
  
  @RequestMapping("/unitDeletedUser")
  public String requestUnitResignedUser(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedUser";
  }
  
  @RequestMapping("/ajax/getComplist")
  public void getCompList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {

    StreamMapper.writeValue(response, unitmanAdmService.getCompList(paramMap));
  }
  
  @RequestMapping("/ajax/getDeptlist")
  public void getDeptList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.getDeptList(paramMap));
  }
  
  @RequestMapping("/ajax/getUserlist")
  public void getUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    StreamMapper.writeValue(response, unitmanAdmService.getUserList(paramMap));
  }
  
  @RequestMapping("/ajax/getSingleUser")
  public void getSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.getSingleUser(paramMap));
  }
  
  @RequestMapping("/ajax/setSingleComp")
  public void setSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.setSingleComp(paramMap));
  }
  
  @RequestMapping("/ajax/setSingleDept")
  public void setSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.setSingleDept(paramMap));
  }
  
  @RequestMapping("/ajax/setSingleUser")
  public void setSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.setSingleUser(paramMap));
  }
  
  @RequestMapping("/ajax/moveSingleDept")
  public void moveSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.moveSingleDept(paramMap));
  }
  
  @RequestMapping("/ajax/moveUserList")
  public void moveUserList(@RequestParam Map<String, Object> paramMap, 
		HttpServletRequest request, HttpServletResponse response) throws Throwable {

    StreamMapper.writeValue(response, unitmanAdmService.moveUserList(paramMap));
  }
  
  @RequestMapping("/ajax/setUserListSort")
  public void setUserListSort(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.setUserListSort(paramMap));
  }
  
  @RequestMapping("/ajax/deleteSingleComp")
  public void deleteSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {

    StreamMapper.writeValue(response, unitmanAdmService.deleteSingleComp(paramMap));
  }
  
  @RequestMapping("/ajax/deleteUserList")
  public void deleteUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.deleteUserList(paramMap));
  }
  
  @RequestMapping("/ajax/deleteSingleDept")
  public void deleteSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.deleteSingleDept(paramMap));
  }
  
  @RequestMapping("/ajax/restoreSingleComp")
  public void restoreSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.restoreSingleComp(paramMap));
  }
  
  @RequestMapping("/ajax/restoreDeptList")
  public void restoreDeptList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.restoreDeptList(paramMap));
  }
  
  @RequestMapping("/ajax/restoreUserList")
  public void restoreUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanAdmService.restoreUserList(paramMap));
  }
      
}
