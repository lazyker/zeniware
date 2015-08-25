package zeniware.admin.unitman;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.unitman.service.UnitManService;
import zeniware.common.util.StreamMapper;

@Controller
public class UnitManController {
  
  @Autowired
  UnitManService unitmanService;
  
  /*********************
   * Public Procedures
   *********************/
  @RequestMapping("/admin/preference/unitSelect")
  public String requestUnitSelect(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    return "/preferenceLayout/unitSelect";
  }
  
  @RequestMapping("/admin/preference/unitMain")
  public String requestUnitMain(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitMain";
  }
  
  @RequestMapping("/admin/preference/unitDeletedComp")
  public String requestUnitDeletedComp(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    return "/preferenceLayout/unitDeletedComp";
  }
  
  @RequestMapping("/admin/preference/unitDeletedDept")
  public String requestUnitClosedDept(@RequestParam Map<String, Object> paramMap, ModelMap model)  {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedDept";
  }
  
  @RequestMapping("/admin/preference/unitDeletedUser")
  public String requestUnitResignedUser(@RequestParam Map<String, Object> paramMap, ModelMap model) {
    
    model.put("compId", paramMap.get("compId"));
    return "/preferenceLayout/unitDeletedUser";
  }
  
  @RequestMapping("/admin/ajax/getComplist")
  public void getCompList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {

    StreamMapper.writeValue(response, unitmanService.getCompList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/getDeptlist")
  public void getDeptList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.getDeptList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/getUserlist")
  public void getUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    if (paramMap.isEmpty()) return;
    
    StreamMapper.writeValue(response, unitmanService.getUserList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/getSingleUser")
  public void getSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.getSingleUser(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setSingleComp")
  public void setSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.setSingleComp(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setSingleDept")
  public void setSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.setSingleDept(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setSingleUser")
  public void setSingleUser(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.setSingleUser(paramMap));
  }
  
  @RequestMapping("/admin/ajax/moveSingleDept")
  public void moveSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.moveSingleDept(paramMap));
  }
  
  @RequestMapping("/admin/ajax/moveUserList")
  public void moveUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
  
    StreamMapper.writeValue(response, unitmanService.moveUserList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/setUserListSort")
  public void setUserListSort(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.setUserListSort(paramMap));
  }
  
  @RequestMapping("/admin/ajax/deleteSingleComp")
  public void deleteSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {

    StreamMapper.writeValue(response, unitmanService.deleteSingleComp(paramMap));
  }
  
  @RequestMapping("/admin/ajax/deleteUserList")
  public void deleteUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.deleteUserList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/deleteSingleDept")
  public void deleteSingleDept(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.deleteSingleDept(paramMap));
  }
  
  @RequestMapping("/admin/ajax/restoreSingleComp")
  public void restoreSingleComp(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.restoreSingleComp(paramMap));
  }
  
  @RequestMapping("/admin/ajax/restoreDeptList")
  public void restoreDeptList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.restoreDeptList(paramMap));
  }
  
  @RequestMapping("/admin/ajax/restoreUserList")
  public void restoreUserList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws Throwable {
    
    StreamMapper.writeValue(response, unitmanService.restoreUserList(paramMap));
  }
      
}
