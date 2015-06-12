package zeniware.schedule;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ScheduleController {

	@RequestMapping(value = "/schedule/getMonth")
	public String getMonth(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
		return "/subInMenu/schedule/month";
	}
	
	@RequestMapping("schedule/getMonth2")
	public String getMonth2(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
		return "schedule/month2";
	}
	
}
