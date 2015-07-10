package zeniware.schedule.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.schedule.vo.ScheduleVo;

public interface ScheduleService {
	
	/**
	 * 월별 단위의 일정 리스트
	 * @return List<ScheduleVo>
	 */
	public List<ScheduleVo> getScheduleList(Map<String, Object>paramMap);

	/**
	 * 일정을 등록한다
	 * @return String
	 */
	public void setScheduleData(ScheduleVo paramVo);
	
	
	
	
	@Transactional(value="transactionManager")
	public void test(String param) throws Exception;
}