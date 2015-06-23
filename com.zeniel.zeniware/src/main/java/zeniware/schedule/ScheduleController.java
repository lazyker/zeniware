package zeniware.schedule;

import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.time.FastDateFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.util.DateUtil;

@Controller
public class ScheduleController {

	@RequestMapping(value = "/schedule/scheduleMain")
	public String getMonth(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
		return "/scheduleLayout/schedule/scheduleMain";
	}
	
	@RequestMapping(value = "/schedule/write")
	public String scheduleWirte(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
		FastDateFormat sdf = FastDateFormat.getInstance("HHmm", Locale.getDefault());
		String time = sdf.format(new java.util.Date());
		
		Date date = new Date();
		String today = DateUtil.getYear(date) + "-" + DateUtil.getMonth(date) + "-" + DateUtil.getDay(date);
		
		
		model.put("today", today);
		
 		return "/scheduleLayout/schedule/write";
	}
	
}
