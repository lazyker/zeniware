package zeniware.admin.schedule.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.schedule.vo.HoliDayAdmVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class ScheduleAdmDao extends AbstractDao {
	
	public int totalPageCount(Map<String, Object> paramMap) {
		return (int) selectOne("admin.holiday.totalPageCount", paramMap);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<HoliDayAdmVo> getHoliDayList(Map<String, Object> paramMap) {
		return (ArrayList<HoliDayAdmVo>) selectList("admin.holiday.getHoliDayList", paramMap);
	}
	
	public void setHoliDay(HoliDayAdmVo paramVo) {
		insert("admin.holiday.setHoliDay", paramVo);
	}

	public void modHoliDay(HoliDayAdmVo paramVo) {
		update("admin.holiday.modHoliDay", paramVo);
	}

	public void delHoliDay(HoliDayAdmVo paramVo) {
		delete("admin.holiday.delHoliDay", paramVo);	
	}
	
	
  
//  @SuppressWarnings("unchecked")
//  public List<CommonGroup> getGroupList() {
//    
//    return (List<CommonGroup>)selectList("admin.codeman.getGroupList");
//  }
//
//  @SuppressWarnings("unchecked")
//  public List<CommonCode> getCodeList(Map<String, Object> paramMap) {
//    
//    return (List<CommonCode>)selectList("admin.codeman.getCodeList", paramMap);
//  }


  
}