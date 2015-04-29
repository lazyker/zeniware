package zeniware.sample.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import zeniware.sample.dao.MainDao;

@Repository
public class MainDaoImpl implements MainDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String getToday() {
		return sqlSession.selectOne("main.getToday");
	}
}
