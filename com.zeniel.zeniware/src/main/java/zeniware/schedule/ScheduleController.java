package zeniware.schedule;

import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.time.FastDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.util.DateUtil;
import zeniware.sample.BoardController;

@Controller
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value = "/schedule/scheduleMain")
	public String getMonth(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
		return "/scheduleLayout/schedule/scheduleMain";
	}
	
	@RequestMapping(value = "/schedule/write")
	public String scheduleWirte(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
//		logger.info("스케줄 파라미터 : ", paramMap.get("startYmd"));
		
		FastDateFormat sdf = FastDateFormat.getInstance("HHmm", Locale.getDefault());
		String time = sdf.format(new java.util.Date());
		
		Date date = new Date();
		String today = DateUtil.getYear(date) + "-" + DateUtil.getMonth(date) + "-" + DateUtil.getDay(date);
		
		
		model.put("today", today);
		
 		return "/scheduleLayout/schedule/write";
	}
	
}
