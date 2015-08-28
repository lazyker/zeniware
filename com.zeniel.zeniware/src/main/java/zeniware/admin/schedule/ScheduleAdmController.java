package zeniware.admin.schedule;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.schedule.service.ScheduleAdmService;
import zeniware.admin.schedule.vo.HoliDayAdmVo;
import zeniware.common.login.MemberInfo;

@Controller
public class ScheduleAdmController {
  
  @Autowired
  ScheduleAdmService scheduleAdmService;

  @RequestMapping("/admin/schedule/holiDayMain")
  public String holiDayMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

    return "/adminLayout/schedule/holiDayMain";
  }
  
  @RequestMapping("/admin/schedule/getHoliDayList")
  public void getHoliDayList(@RequestParam Map<String, Object> paramMap, HttpServletResponse response, Authentication authentication)  throws IOException {
	  
	  MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
	  
	  if (null == paramMap.get("compId")) {
		  paramMap.put("compId", memberInfo.getCompId());
	  }
	  
//	  int totalPageCount = scheduleAdmService.totalPageCount(paramMap);
	  ArrayList<HoliDayAdmVo> list = scheduleAdmService.getHoliDayList(paramMap);
	  Map<String,Object> map = new HashMap<String,Object>();
	  
	  
//	  map.put("draw", paramMap.get("draw"));
//	  map.put("recordsTotal", totalPageCount); //전체 레코드 수
//	  map.put("recordsFiltered", "1"); //필터링 된 총 레코드 수
	  map.put("data", list);
	  
	  ObjectMapper om = new ObjectMapper();
	  String jsonString = om.writeValueAsString(map);
	  OutputStream out =  response.getOutputStream();
	  
	  out.write(jsonString.getBytes());
	  
  }
  
  @RequestMapping("/admin/schedule/holiDayEdit")
  public String holiDayEdit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
	  
    return "/adminLayout/schedule/holiDayEdit";
  }
  
  @RequestMapping("/admin/schedule/setHoliDay")
  public String setHoliDay(@ModelAttribute HoliDayAdmVo paramVo, ModelMap model) throws Throwable {

	  scheduleAdmService.setHoliDay(paramVo);
	  
	  return "redirect:/admin/schedule/holiDayMain";
  }
  
  @RequestMapping("/admin/schedule/modHoliDay")
  public String modHoliDay(@ModelAttribute HoliDayAdmVo paramVo, ModelMap model) throws Throwable {
	  
	  scheduleAdmService.modHoliDay(paramVo);
	  
	  return "redirect:/admin/schedule/holiDayMain";
  }
  
  @RequestMapping("/admin/schedule/delHoliDay")
  public String delHoliDay(@ModelAttribute HoliDayAdmVo paramVo, ModelMap model) throws Throwable {
	  
	  scheduleAdmService.delHoliDay(paramVo);
	  
	  return "redirect:/admin/schedule/holiDayMain";
  }
  
}
