package zeniware.schedule;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.util.DateUtil;
import zeniware.schedule.service.ScheduleService;
import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	/** 캘린더 추가 **/
	@RequestMapping(value="/schedule/addCalendar") 
	public void addCalendar(@ModelAttribute CalendarVo calendarVo, HttpServletResponse response) throws IOException {
		String uid = UUID.randomUUID().toString().replace("-", "");
		
		//값 세팅 해야 함
		calendarVo.setCldrId(uid);
		calendarVo.setCompId("회사아이디");
		calendarVo.setUserId("lazyker");
		calendarVo.setCloseYn("N");
		calendarVo.setShreYn("N");
		
		scheduleService.addCalendar(calendarVo);
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(calendarVo);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
	
	/** 일정 등록 **/
	@RequestMapping(value="/schedule/setScheduleData", method = RequestMethod.POST) 
	public String setScheduleData(@ModelAttribute ScheduleVo scheduleVo) {
		
		if(null != scheduleVo.getStartTm()) {
			scheduleVo.setStartTm(scheduleVo.getStartTm().replace(":", ""));
			scheduleVo.setEndTm(scheduleVo.getEndTm().replace(":", ""));
		}
		
		scheduleService.setScheduleData(scheduleVo);
		
		return "redirect:/schedule/scheduleMain";
		
	}
	
	@RequestMapping(value="/schedule/test") 
	public void test(@ModelAttribute ScheduleVo scheduleVo) {
		
		try {
			scheduleService.test("글등록 테스트");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

	@RequestMapping(value = "/schedule/getScheduleData")
	public void getScheduleData(@RequestParam Map<String, Object>paramMap, HttpServletRequest request, HttpServletResponse response)throws IOException {
		String year = String.valueOf(paramMap.get("year"));
		
		List<ScheduleVo> list = new ArrayList<ScheduleVo>();
		
		list = scheduleService.getScheduleList(paramMap);
		
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("title", "테스트");
//		map.put("start", "2015-07-14");
		
//		title : 'All Day Event',
//		start : '2015-07-14',
//		end : '2015-07-16',
//        textColor : 'red',
//        allDay : false
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(list);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
		
	} 
	
	@RequestMapping(value = "/schedule/scheduleMain")
	public String getMonth(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		
 		return "/scheduleLayout/schedule/scheduleMain";
	}
	
	@RequestMapping(value = "/schedule/write")
	public String scheduleWirte(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		String paramStaYmd = String.valueOf(paramMap.get("startYmd"));
		String paramEndYmd = String.valueOf(paramMap.get("endYmd"));
		
		String startYmd= "";
		String endYmd= "";
		String startTm = "";
		String endTm= "";
		
		//주간, 일간일 경우
		if( paramStaYmd.length() > 10 ) {
			String[] staTime = paramStaYmd.split("T");
			String[] endTime = paramEndYmd.split("T");
			startYmd = staTime[0];
			startTm = staTime[1].substring(0, 5);
			endYmd = endTime[0];
			endTm = endTime[1].substring(0, 5);
			
		}
		else { //월간일 경우
			startYmd = paramStaYmd;
			endYmd = paramEndYmd;
			startTm = DateUtil.addMinuteStep("startTm", 30);
			endTm= DateUtil.addMinuteStep("endTm", 30);
		}
		
		
		//날짜를 -1 한다.
//		endYmd = DateUtil.getCalEndYmd(endYmd);
		
		
//		Date endDate = DateUtil.parseDate(endYmd, "yyyy-MM-dd");
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(endDate);
//		cal.add(Calendar.DATE, -1);
//		
//		FastDateFormat sdf = FastDateFormat.getInstance("yyyy-MM-dd", Locale.getDefault());
//		endYmd= sdf.format(cal.getTime());
		
	
		
		
		
//		logger.info("스케줄 파라미터 : ", paramMap.get("startYmd"));
		Date startDate = new Date();
//		String paramStartYmd = String.valueOf(paramMap.get("startYmd"));
//		startDate = DateUtil.parseDate(paramStartYmd, "yyyy-MM-dd");
//		
//		String time = sdf.format(new java.util.Date());
		
//		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		Calendar cal = Calendar.getInstance();
		
		
//		cal.setTime(startDate);
//		cal.add(Calendar.HOUR, +1);
//		String endTm = sdf.format(cal.getTime());
//		int endTime = Integer.parseInt(endTm);
//		int endTTm = (int)Math.round(endTime/1000.0);
//		String test = sdformat.format(cal.getTime());
		
//		logger.info("스케줄 파라미터 : " + endTTm, paramMap);
		
//		logger.info("다국어 :  " + msg.getMessage("button.subscribe"), paramMap);
		
//		Date date = new Date();
//		String endYmd = DateUtil.parseString(DateUtil.addDay(startDate, 1), "yyyy-MM-dd");
//		String nextDay = date;
		
		
		model.put("startYmd", startYmd);
		model.put("endYmd", endYmd);
		model.put("startTm", startTm);
		model.put("endTm", endTm);
		
 		return "/scheduleLayout/schedule/write";
	}
	
}