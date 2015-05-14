package zeniware.sample.dao;

import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;

@Repository
public class MainDao extends AbstractDao {
	public String getToday() {
		return (String) selectOne("main.getToday");
		
	}
}
