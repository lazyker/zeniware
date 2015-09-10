package zeniware.task.service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.task.dao.CustomerDao;
import zeniware.task.service.CustomerService;
import zeniware.task.vo.CustomerVo;

@Service
public class CustomerServiceImpl implements CustomerService {
  
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public ArrayList<CustomerVo> getCustomerList(Map<String, Object> paramMap) {
		return customerDao.getCustomerList(paramMap);
	}

	@Override
	public void setCustomer(CustomerVo paramVo) {
		customerDao.setCustomer(paramVo);
	}

	@Override
	public void modCustomer(CustomerVo paramVo) {
		customerDao.modCustomer(paramVo);
	}

	@Override
	public void delCustomer(CustomerVo paramVo) {
		customerDao.delCustomer(paramVo);
	}
	
}