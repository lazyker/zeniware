package zeniware.schedule;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.FastDateFormat;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.login.MemberInfo;
import zeniware.common.util.DateUtil;
import zeniware.schedule.service.ScheduleService;
import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	/** 캘린더 리스트 조회 **/
	@RequestMapping(value="/schedule/getCalendarList") 
	public void getCalendarList(@RequestParam Map<String, Object>paramMap, HttpServletResponse response) throws IOException {
		
		List<CalendarVo> mergeCalList  = scheduleService.getCalendarList(paramMap);
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(mergeCalList);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
	
//	/** 캘린더 리스트 조회 **/
//	public List<CalendarVo> getCalendarList(MemberInfo memberInfo) {
//		
//		Map<String, Object>paramMap = new HashMap<String, Object>();
//		
//		paramMap.put("compId", memberInfo.getCompId());
//		paramMap.put("userId", memberInfo.getUserId());
//		
//		List<CalendarVo> calList  = scheduleService.getCalendarList(paramMap);
//		List<CalendarVo> shareCalList  = scheduleService.getCalendarList(paramMap);
//		
//		
//		return calList;
//	}
	
	/** 캘린더 추가 **/
	@RequestMapping(value="/schedule/addCalendar") 
	public void addCalendar(@ModelAttribute CalendarVo calendarVo, HttpServletResponse response, Authentication authentication) throws IOException {
		String type = (null == calendarVo.getCldrId() ? "New" : "Modify");
		
		//Spring Security의 Authentication 객를 주입
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		calendarVo.setCompId(memberInfo.getCompId());
		calendarVo.setUserId(memberInfo.getUserId());
		
		if( "New".equals(type) ) {
			String uid = UUID.randomUUID().toString().replace("-", "");
			calendarVo.setCldrId(uid);
			calendarVo.setCloseYn("N");
			calendarVo.setShreYn("N");
			calendarVo.setRunType("New");
			
			scheduleService.addCalendar(calendarVo);
		}
		else {
			calendarVo.setRunType("Modify");
			
			scheduleService.updateCalendar(calendarVo);
		}
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(calendarVo);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
	
	/** 캘린더 삭제 **/
	@RequestMapping(value="/schedule/delCalendar") 
	public void delCalendar(@ModelAttribute CalendarVo calendarVo, HttpServletResponse response, Authentication authentication) throws IOException {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		calendarVo.setCompId(memberInfo.getCompId());
		calendarVo.setUserId(memberInfo.getUserId());
		
		scheduleService.delCalendar(calendarVo);
		
//		ObjectMapper om = new ObjectMapper();
//		
//		String jsonString = om.writeValueAsString(calendarVo);
//		
//		OutputStream out = response.getOutputStream();
//		out.write(jsonString.getBytes());
	}
	
	/** 일정 등록 **/
	@RequestMapping(value="/schedule/setScheduleData", method = RequestMethod.POST) 
	public String setScheduleData(@ModelAttribute ScheduleVo scheduleVo) {
		
		if (null != scheduleVo.getStartTm()) {
			scheduleVo.setStartTm(scheduleVo.getStartTm().replace(":", ""));
			scheduleVo.setEndTm(scheduleVo.getEndTm().replace(":", ""));
		}
		
		if ("".equals(scheduleVo.getSchedId())) {
			//신규 일정 저장
			scheduleService.setScheduleData(scheduleVo);
			
			if ("Y".equals(scheduleVo.getRpetYn())) {
				scheduleService.setRpetSchedule(scheduleVo);
			}
		}
		else {
			//수정 일정 저장
			scheduleService.updateScheduleData(scheduleVo);
			
			if ("Y".equals(scheduleVo.getRpetYn())) {
				scheduleService.updateRpetSchedule(scheduleVo);
			}
			
		}
		
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
	public void getScheduleData(@RequestParam Map<String, Object>paramMap, HttpServletResponse response, Authentication authentication) throws IOException {
//		String year = String.valueOf(paramMap.get("year"));
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		paramMap.put("compId", memberInfo.getCompId());
		paramMap.put("userId", memberInfo.getUserId());
		
		List<ScheduleVo> resultList = new ArrayList<ScheduleVo>();
		
		List<ScheduleVo> list = scheduleService.getScheduleList(paramMap);
		
		for( int i=0;  i < list.size(); i++ ) {
			ScheduleVo scheduleVo = list.get(i);
			resultList.add(scheduleVo);
			
			//반복일정이면..
			if ("Y".equals(scheduleVo.getRpetYn())) {
				
				//반복 시작 일정 리스트에 추가
//				resultList.add(scheduleVo);
				
				try {
					String[] start = scheduleVo.getStart().split("T");
					String[] end = scheduleVo.getEnd().split("T");
					
					String startYmd = start[0];
					String startTm = start[1];
					String endYmd = end[0];
					String endTm = end[1];
					String rpetEndYmd = scheduleVo.getRpetEndYmd();
					
					Date startDate = DateUtil.parseDate(startYmd, "yyyy-MM-dd");
					Date endDate = DateUtil.parseDate(endYmd, "yyyy-MM-dd");
					Date rpetEndtDate = DateUtil.parseDate(rpetEndYmd, "yyyy-MM-dd");
					
					String rpetType = scheduleVo.getRpetType();
					int rpetcyc = scheduleVo.getRpetCyc();
					int days = DateUtil.DateDiff(startDate, rpetEndtDate, rpetcyc, rpetType);
					int endDays = DateUtil.DateDiff(startDate, endDate, 0, "");	//일정의 종료일을 계산
					
					Calendar cal = Calendar.getInstance();
					Calendar cal2 = Calendar.getInstance();
					FastDateFormat sdf = FastDateFormat.getInstance("yyyy-MM-dd", Locale.getDefault());
					cal.setTime(startDate);
					cal2.setTime(endDate);
					
					for ( int j = 0 ; j < days; j ++ ) {
						ScheduleVo scheduleVoNew = new ScheduleVo();
						
						if ("D".equals(rpetType))	//매일
						{ 
							cal.add(Calendar.DATE, + rpetcyc);
							
							if (endDays == 0) {
								cal2.add(Calendar.DATE, + rpetcyc);
							} else {
								cal2.add(Calendar.DATE, + endDays);
							}
							
						}
						else if ("W".equals(rpetType))	//매주
						{
							cal.add(Calendar.WEDNESDAY, + rpetcyc);
							
							if (endDays == 0) {
								cal2.add(Calendar.WEDNESDAY, + rpetcyc);
							} else {
								cal2.add(Calendar.DATE, + endDays);
							}
						}
						else if ("M".equals(rpetType))	//매월
						{
							cal.add(Calendar.MONDAY, + rpetcyc);
							
							if (endDays == 0) {
								cal2.add(Calendar.MONDAY, + rpetcyc);
							} else {
								cal2.add(Calendar.DATE, + endDays);
							}
						}
						else if ("Y".equals(rpetType))		//매년
						{
							cal.add(Calendar.YEAR, + rpetcyc);
							
							if (endDays == 0) {
								cal2.add(Calendar.YEAR, + rpetcyc);
							} else {
								cal2.add(Calendar.DATE, + endDays);
							}
						}
						
						
						startYmd= sdf.format(cal.getTime());
						System.out.println("startYmd ::: " + startYmd);
						endYmd = sdf.format(cal2.getTime());
						System.out.println("endYmd ::: " + endYmd);
						
						scheduleVoNew.setSchedId(scheduleVo.getSchedId());
						scheduleVoNew.setCldrId(scheduleVo.getCldrId());
						scheduleVoNew.setId(scheduleVo.getSchedId());
						scheduleVoNew.setTitle(scheduleVo.getTitle());
						scheduleVoNew.setFstFrmigrId(scheduleVo.getFstFrmigrId());
						scheduleVoNew.setStartTm(scheduleVo.getStartTm());
						scheduleVoNew.setEndTm(scheduleVo.getEndTm());
						scheduleVoNew.setRpetYn(scheduleVo.getRpetYn());
						scheduleVoNew.setRpetEndYmd(scheduleVo.getRpetEndYmd());
						scheduleVoNew.setUnlmtRpetYn(scheduleVo.getUnlmtRpetYn());
						scheduleVoNew.setRpetType(scheduleVo.getRpetType());
						scheduleVoNew.setRpetCyc(scheduleVo.getRpetCyc());
						scheduleVoNew.setStart(startYmd + "T" + startTm);
						scheduleVoNew.setEnd(endYmd + "T" + endTm);
						scheduleVoNew.setApntPlc(scheduleVo.getApntPlc());
						scheduleVoNew.setMemoCont(scheduleVo.getMemoCont());
						scheduleVoNew.setRpetDateType(scheduleVo.getRpetDateType());
						scheduleVoNew.setRpetDd(scheduleVo.getRpetDd());
						
						resultList.add(scheduleVoNew);
						
					}
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
			}
			
			
		}
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("title", "테스트");
//		map.put("start", "2015-07-14");
		
//		title : 'All Day Event',
//		start : '2015-07-14',
//		end : '2015-07-16',
//        textColor : 'red',
//        allDay : false
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(resultList);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
		
	} 
	
	@RequestMapping(value = "/schedule/scheduleMain")
	public String getMonth(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
 		return "/scheduleLayout/schedule/scheduleMain";
	}
	
	@RequestMapping(value = "/schedule/write")
	public String scheduleWirte(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
		String paramStaYmd = String.valueOf(paramMap.get("startYmd"));
		String paramEndYmd = String.valueOf(paramMap.get("endYmd"));
		
		String startYmd= "";
		String endYmd= "";
		String startTm = "";
		String endTm= "";
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
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
		
//		//캘린더 리스트 조회(ajax로 바꿔야 하는데..)
//		List<CalendarVo> calList = getCalendarList(memberInfo);
//		model.addAttribute("calList", calList);
		
 		return "/scheduleLayout/schedule/write";
	}
	
	@RequestMapping(value="/schedule/modify")
	public String scheduleModifyData(@ModelAttribute ScheduleVo scheduleVo, ModelMap model, Authentication authentication) {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		ScheduleVo schedVo = scheduleService.scheduleModifyData(scheduleVo);
		
//		//캘린더 리스트 조회(ajax로 바꿔야 하는데..)
//		List<CalendarVo> calList = getCalendarList(memberInfo);
//		model.addAttribute("calList", calList);
		
		//fullCalendar name에 맞추기위해
		model.addAttribute("schedVo", schedVo);
		
		model.addAttribute("startYmd", schedVo.getStart());
		model.addAttribute("endYmd", schedVo.getEnd());
		model.addAttribute("startTm", schedVo.getStartTm());
		model.addAttribute("endTm", schedVo.getEndTm());
		
		
		return "/scheduleLayout/schedule/write";
	}
	
	/** drop & resize 수정 이번트 **/
	@RequestMapping(value="/schedule/updateDropResizeSchedData")
	public void updateDropResizeSchedData(@ModelAttribute ScheduleVo scheduleVo, HttpServletResponse response, 
			Authentication authentication) throws Exception  {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		scheduleVo.setLstModrId(memberInfo.getUserId());
		
		//2015-00-00T1730 값을 VO에 Setting
		String[] startYmdHHss = scheduleVo.getStartYmd().split("T");
		String[] endYmdHHss = scheduleVo.getEndYmd().split("T");
		
		scheduleVo.setStartYmd(startYmdHHss[0]);
		scheduleVo.setEndYmd(endYmdHHss[0]);
		
		if (null != scheduleVo.getStartTm()) {
			scheduleVo.setStartTm(startYmdHHss[1].replace(":", "").substring(0,4));
			scheduleVo.setEndTm(endYmdHHss[1].replace(":", "").substring(0,4));
		}
		
		scheduleService.updateDropResizeSchedData(scheduleVo);
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(new HashMap<String, String>());
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
		
	}
	
	/** 일정 삭제 **/
	@RequestMapping(value="/schedule/delScheduleData")
	public void delScheduleData(@ModelAttribute ScheduleVo scheduleVo, HttpServletResponse response, 
	Authentication authentication) throws Exception  {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		scheduleVo.setFstFrmigrId(memberInfo.getUserId());
		
		if ("rpetAll".equals(scheduleVo.getDelType())) {
			scheduleService.delScheduleData(scheduleVo);
		} else if ("rpetOne".equals(scheduleVo.getDelType())){
			scheduleService.addRpetExcptSched(scheduleVo);
		}
		
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(new HashMap<String, String>());
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
	
}