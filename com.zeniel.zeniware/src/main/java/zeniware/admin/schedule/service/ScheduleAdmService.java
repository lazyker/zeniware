package zeniware.admin.schedule.service;

import java.util.ArrayList;
import java.util.Map;

import zeniware.admin.schedule.vo.HoliDayAdmVo;

public interface ScheduleAdmService {
	
	public int totalPageCount(Map<String, Object> paramMap);
	
	public ArrayList<HoliDayAdmVo> getHoliDayList(Map<String, Object> paramMap);
	
	public void setHoliDay(HoliDayAdmVo paramVo);
	  
	public void modHoliDay(HoliDayAdmVo paramVo);
	 
	public void delHoliDay(HoliDayAdmVo paramVo);
	  
}
