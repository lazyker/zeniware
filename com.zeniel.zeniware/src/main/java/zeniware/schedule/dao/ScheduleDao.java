package zeniware.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;
import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;

@Repository
public class ScheduleDao extends AbstractDao {
	
	/**
	 * 캘린더 리스트
	 * @param paramMap
	 * @return List<CalendarVo>
	 */
	public List<CalendarVo> getCalendarList(Map<String, Object>paramMap) {
		return (List<CalendarVo>) selectList("schedule.getCalendarList", paramMap);
	}
	
	/**
	 * 공유 캘린더 리스트
	 * @param paramMap
	 * @return List<CalendarVo>
	 */
	public List<CalendarVo> getShreCalendarList(Map<String, Object>paramMap) {
		return (List<CalendarVo>) selectList("schedule.getShreCalendarList", paramMap);
	}	
	
	/**
	 * 캘린더 추가
	 * @param paramVo
	 */
	public void addCalendar(CalendarVo paramVo) {
		insert("schedule.addCalendar", paramVo);
	}
	
	/**
	 * 캘린더 수정
	 * @param paramVo
	 */
	public void updateCalendar(CalendarVo paramVo) {
		insert("schedule.updateCalendar", paramVo);
	}
	
	/**
	 * 캘린더 삭제
	 * @param paramVo
	 */
	public void delCalendar(CalendarVo paramVo) {
		delete("schedule.delCalendar", paramVo);
	}
	
	/**
	 * 일정 리스트
	 * @param paramMap
	 * @return List<ScheduleVo>
	 */
	public List<ScheduleVo> getScheduleList(Map<String, Object>paramMap) {
		return (List<ScheduleVo>) selectList("schedule.getScheduleList", paramMap);
	}
	
	/**
	 * 일정 등록
	 * @param paramVo
	 */
	public void setScheduleData(ScheduleVo paramVo) {
		insert("schedule.setScheduleData", paramVo);
	}
	
	/**
	 * 일정 수정화면 데이터
	 * @param paramVo
	 * @return ScheduleVo
	 */
	public ScheduleVo scheduleModifyData(ScheduleVo paramVo) {
		return (ScheduleVo) selectOne("schedule.scheduleModifyData", paramVo);
	}
	
	/**
	 * 일정 수정
	 * @param paramVo
	 */
	public void updateScheduleData(ScheduleVo paramVo) {
		update("schedule.updateScheduleData", paramVo);
	}
	
	/**
	 * 일정 이동
	 * @param paramVo
	 */
	public void updateDropResizeSchedData(ScheduleVo paramVo) {
		update("schedule.updateDropResizeSchedData", paramVo);
	}
	
	/**
	 * 일정 삭제
	 * @param paramVo
	 */
	public void delScheduleData(ScheduleVo paramVo) {
		update("schedule.delScheduleData", paramVo);
	}
	
	/**
	 * 반복일정 등록
	 * @param paramVo
	 */
	public void setRpetSchedule(ScheduleVo paramVo) {
		insert("schedule.setRpetSchedule", paramVo);
	}

	/**
	 * 반복일정 수정
	 * @param paramVo
	 */
	public void updateRpetSchedule(ScheduleVo paramVo) {
		update("schedule.updateRpetSchedule", paramVo);
	}
	
	/**
	 * 반복일정 예외처리 등록
	 * @param paramVo
	 */
	public void addRpetExcptSched(ScheduleVo paramVo) {
		insert("schedule.addRpetExcptSched", paramVo);
	}
	
	/**
	 * 반복일정 예외처리 수정
	 * @param paramVo
	 */
	public void updateRpetExcptSched(ScheduleVo paramVo) {
		update("schedule.updateRpetExcptSched", paramVo);
	}
	
	/**
	 * 반복일정 예외처리 조회
	 * @param paramVo
	 */
	public List<HashMap<String, String>> getRpetExcptSchedList(ScheduleVo paramVo) {
		return (List<HashMap<String, String>>) selectList("schedule.getRpetExcptSchedList", paramVo);		
	}
	
	
	
	//트랜잭션 테스트
	public void insertTest(String value) throws Exception {
		insert("schedule.insertTest", value);
	}
	
}
