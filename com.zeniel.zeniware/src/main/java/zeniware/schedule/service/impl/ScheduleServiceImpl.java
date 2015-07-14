package zeniware.schedule.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.schedule.dao.ScheduleDao;
import zeniware.schedule.service.ScheduleService;
import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Override
	public void addCalendar(CalendarVo paramVo) {
		scheduleDao.addCalendar(paramVo);
	}

	@Override
	public List<ScheduleVo> getScheduleList(Map<String, Object>paramMap) {
		
		List<ScheduleVo> list = scheduleDao.getScheduleList(paramMap);
		return list;
	}

	@Override
	public void setScheduleData(ScheduleVo paramVo) {
		
		scheduleDao.setScheduleData(paramVo);
	}
	
	
	
	
	
	@Override
	public void test(String param) throws Exception {
		
		scheduleDao.insertTest(param);
	 	scheduleDao.insertTest(null);
		
//		throw  new Exception();
//		scheduleDao.insertTest(null);
		
//		 try {
//			 	scheduleDao.insertTest(param);
//			 	scheduleDao.insertTest(null);
		 
//		    } catch(Exception e) {
//		        e.printStackTrace();
//		            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//		    }
	}
}
