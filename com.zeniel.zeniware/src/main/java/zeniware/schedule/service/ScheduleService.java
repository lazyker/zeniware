package zeniware.schedule.service;

import java.util.HashMap;
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
	 * 일정 등록
	 * @param  ScheduleVo
	 */
	public void setScheduleData(ScheduleVo paramVo);
	
	/**
	 * 일정수정 화면 데이터
	 * @param  ScheduleVo
	 */
	public ScheduleVo scheduleModifyData(ScheduleVo paramVo);
	
	/**
	 * 일정 수정
	 * @param  ScheduleVo
	 */
	public void updateScheduleData(ScheduleVo paramVo);
	
	/**
	 * 일정 이동
	 * @param  ScheduleVo
	 */
	public void updateDropResizeSchedData(ScheduleVo paramVo);
	
	/**
	 * 일정 삭제
	 * @param  ScheduleVo
	 */
	public void delScheduleData(ScheduleVo paramVo);
	
	/**
	 * 반복일정 등록
	 * @param  ScheduleVo
	 */
	public void setRpetSchedule(ScheduleVo paramVo);
	
	/**
	 * 반복일정 수정
	 * @param  ScheduleVo
	 */
	public void updateRpetSchedule(ScheduleVo paramVo);
	
	/**
	 * 반복일정 예외처리 등록
	 * @param  ScheduleVo
	 */
	public void addRpetExcptSched(ScheduleVo paramVo);
	
	/**
	 * 반복일정 예외처리 수정
	 * @param  ScheduleVo
	 */
	public void updateRpetExcptSched(ScheduleVo paramVo);
	
	/**
	 * 반복일정 예외처리 조회
	 * @return List<HashMap<String, String>>
	 */
	public List<HashMap<String, String>> getRpetExcptSchedList(ScheduleVo paramVo);
	
	
	
	
	@Transactional(value="transactionManager")
	public void test(String param) throws Exception;
}
