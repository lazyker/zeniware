package zeniware.task.service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.common.converter.FileVo;
import zeniware.task.dao.CustomerDao;
import zeniware.task.service.CustomerService;
import zeniware.task.vo.CustomerVo;
import zeniware.task.vo.PersonVo;
import zeniware.task.vo.RecordVo;

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
	
	@Override
	public ArrayList<RecordVo> getRecordList(Map<String, Object> paramMap) {
		return customerDao.getRecordList(paramMap);
	}

	@Override
	public void setRecord(RecordVo paramVo) {
		customerDao.setRecord(paramVo);
	}

	@Override
	public void modRecord(RecordVo paramVo) {
		customerDao.modRecord(paramVo);
	}

	@Override
	public void delRecord(RecordVo paramVo) {
		customerDao.delRecord(paramVo);
	}
	
	@Override
	public ArrayList<PersonVo> getPersonList(Map<String, Object> paramMap) {
		return customerDao.getPersonList(paramMap);
	}

	@Override
	public void setPerson(PersonVo paramVo) {
		customerDao.setPerson(paramVo);
	}

	@Override
	public void modPerson(PersonVo paramVo) {
		customerDao.modPerson(paramVo);
	}

	@Override
	public void delPerson(PersonVo paramVo) {
		customerDao.delPerson(paramVo);
	}
	
	@Override
	public void setFile(FileVo paramVo) {
		customerDao.setFile(paramVo);
	}
	
}