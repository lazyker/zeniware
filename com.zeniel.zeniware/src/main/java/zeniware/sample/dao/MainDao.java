package zeniware.sample.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;
import zeniware.sample.vo.Employee;

@Repository
public class MainDao extends AbstractDao {
	
	public String getToday() {
		return (String) selectOne("main.getToday");
	}
	
	public String getEmpInfo(HashMap<String, Object> map) {
		return (String) selectOne("main.getEmpInfo", map);
	}
	
	public Employee getEmpInfoMap(Employee paramVo) {
		return (Employee) selectOne("main.getEmpInfoMap", paramVo);
	}
}
