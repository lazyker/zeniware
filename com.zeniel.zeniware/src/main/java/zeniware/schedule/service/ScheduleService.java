package zeniware.schedule.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;

public interface ScheduleService {
	
	/**
	 * 캘린더 리스트
	 * @param paramMap
	 * @return
	 */
	public List<CalendarVo> getCalendarList(Map<String, Object>paramMap);
	
	/**
	 * 캘린더 추가
	 * @param calendarVo
	 */
	public void addCalendar(CalendarVo paramVo);
	
	/**
	 * 캘린더 수정
	 * @param calendarVo
	 */
	public void updateCalendar(CalendarVo paramVo);
	
	/**
	 * 캘린더 삭제
	 * @param calendarVo
	 */
	public void delCalendar(CalendarVo paramVo);
	
	
	/**
	 * 월별 단위의 일정 리스트
	 * @return List<ScheduleVo>
	 */
	public List<ScheduleVo> getScheduleList(Map<String, Object>paramMap);

	/**
	 * 일정을 등록한다
	 * @param  ScheduleVo
	 */
	public void setScheduleData(ScheduleVo paramVo);
	
	
	
	
	@Transactional(value="transactionManager")
	public void test(String param) throws Exception;
}
