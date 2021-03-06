package zeniware.schedule.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.schedule.dao.ScheduleDao;
import zeniware.schedule.service.ScheduleService;
import zeniware.schedule.vo.CalendarVo;
import zeniware.schedule.vo.ScheduleVo;
import zeniware.schedule.vo.TodoVo;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Override
	public List<CalendarVo> getCalendarList(Map<String, Object> paramMap) {
		
		List<CalendarVo> calList = scheduleDao.getCalendarList(paramMap);
		List<CalendarVo> shareCalList  = scheduleDao.getShreCalendarList(paramMap);
		List<CalendarVo> mergeResult = new ArrayList<>();
		
		mergeResult.addAll(calList);
		
		//공유 캘린더(회사 캘린더)를 두번째에 넣는다.
		for(CalendarVo vo : shareCalList) {
			mergeResult.add(1, vo);
		}
		
		return mergeResult;
	}
	
	@Override
	public void addCalendar(CalendarVo paramVo) {
		scheduleDao.addCalendar(paramVo);
	}
	
	@Override
	public void updateCalendar(CalendarVo paramVo) {
		scheduleDao.updateCalendar(paramVo);
	}
	
	@Override
	public void delCalendar(CalendarVo paramVo) {
		scheduleDao.delCalendar(paramVo);
		
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
	public ScheduleVo scheduleModifyData(ScheduleVo paramVo) {
		return scheduleDao.scheduleModifyData(paramVo);
	}
	
	@Override
	public void updateScheduleData(ScheduleVo paramVo) {
		scheduleDao.updateScheduleData(paramVo);
	}

	@Override
	public void updateDropResizeSchedData(ScheduleVo paramVo) {
		scheduleDao.updateDropResizeSchedData(paramVo);
	}
	
	@Override
	public void delScheduleData(ScheduleVo paramVo) {
		scheduleDao.delScheduleData(paramVo);
		
	}
	
	@Override
	public void setRpetSchedule(ScheduleVo paramVo) {
		scheduleDao.setRpetSchedule(paramVo);
	}
	
	@Override
	public void updateRpetSchedule(ScheduleVo paramVo) {
		scheduleDao.updateRpetSchedule(paramVo);
	}
	
	@Override
	public void addRpetExcptSched(ScheduleVo paramVo) {
		scheduleDao.addRpetExcptSched(paramVo);
	}
	
	@Override
	public void updateRpetExcptSched(ScheduleVo paramVo) {
		scheduleDao.updateRpetExcptSched(paramVo);
	}
	
	@Override
	public List<HashMap<String, String>> getRpetExcptSchedList(ScheduleVo paramVo) {
		List<HashMap<String, String>> result = scheduleDao.getRpetExcptSchedList(paramVo);
		return result;
	}
	
	@Override
	public List<TodoVo> getTodoList(Map<String, Object> paramMap) {
		List<TodoVo> todoList = scheduleDao.getTodoList(paramMap);
		return todoList;
	}
	
	@Override
	public void addTodo(TodoVo paramVo) {
		scheduleDao.addTodo(paramVo);
	}
	
	@Override
	public void updateTodo(TodoVo paramVo) {
		scheduleDao.updateTodo(paramVo);
	}
	
	@Override
	public void delTodo(TodoVo paramVo) {
		scheduleDao.delTodo(paramVo);
	}
	
	@Override
	public int getTodoSeq(TodoVo paramVo) {
		return (int) scheduleDao.getTodoSeq(paramVo);
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
