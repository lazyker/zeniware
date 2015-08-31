package zeniware.admin.schedule.service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.schedule.dao.ScheduleAdmDao;
import zeniware.admin.schedule.service.ScheduleAdmService;
import zeniware.admin.schedule.vo.HoliDayAdmVo;

@Service
public class ScheduleAdmServiceImpl implements ScheduleAdmService {
  
	@Autowired
	private ScheduleAdmDao scheduleAdmDao;
	
	@Override
	public int totalPageCount(Map<String, Object> paramMap) {
		return scheduleAdmDao.totalPageCount(paramMap);
	}
	
	@Override
	public ArrayList<HoliDayAdmVo> getHoliDayList(Map<String, Object> paramMap) {
		return scheduleAdmDao.getHoliDayList(paramMap);
	}

	@Override
	public void setHoliDay(HoliDayAdmVo paramVo) {
		scheduleAdmDao.setHoliDay(paramVo);
	}

	@Override
	public void modHoliDay(HoliDayAdmVo paramVo) {
		scheduleAdmDao.modHoliDay(paramVo);
	}

	@Override
	public void delHoliDay(HoliDayAdmVo paramVo) {
		scheduleAdmDao.delHoliDay(paramVo);
	}
	
}