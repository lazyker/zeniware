package zeniware.sample.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.sample.dao.MainDao;
import zeniware.sample.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;

	public String getToday() {
		return mainDao.getToday();
	}

}
