package zeniware.task.service;

import java.util.ArrayList;
import java.util.Map;

import zeniware.common.converter.FileVo;
import zeniware.task.vo.CustomerVo;
import zeniware.task.vo.PersonVo;
import zeniware.task.vo.RecordVo;

public interface CustomerService {
	
	public ArrayList<CustomerVo> getCustomerList(Map<String, Object> paramMap);
	
	public void setCustomer(CustomerVo paramVo);
	  
	public void modCustomer(CustomerVo paramVo);
	 
	public void delCustomer(CustomerVo paramVo);
	
	public ArrayList<RecordVo> getRecordList(Map<String, Object> paramMap);
	
	public void setRecord(RecordVo paramVo);
	
	public void modRecord(RecordVo paramVo);
	
	public void delRecord(RecordVo paramVo);
	
	public ArrayList<PersonVo> getPersonList(Map<String, Object> paramMap);
	
	public void setPerson(PersonVo paramVo);
	
	public void modPerson(PersonVo paramVo);
	
	public void delPerson(PersonVo paramVo);
	
	public void setFile(FileVo paramVo);
	  
}
