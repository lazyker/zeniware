package zeniware.sample.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.sample.dao.MainDao;
import zeniware.sample.service.MainService;
import zeniware.sample.vo.Employee;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;

	@Override
	public String getToday() {
		return mainDao.getToday();
	}

	@Override
	public String getEmpInfo(HashMap<String, Object> map) {
		return mainDao.getEmpInfo(map);
	}

	@Override
	public Employee getEmpInfoMap(Employee paramVo) {
		return mainDao.getEmpInfoMap(paramVo);
	}
	
	

}
