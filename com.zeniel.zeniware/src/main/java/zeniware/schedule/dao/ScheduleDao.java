package zeniware.schedule.dao;

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
	
	
	
	//트랜잭션 테스트
	public void insertTest(String value) throws Exception {
		insert("schedule.insertTest", value);
	}
	
}
