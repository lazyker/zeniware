package zeniware.task.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.common.converter.FileVo;
import zeniware.common.sql.AbstractDao;
import zeniware.task.vo.CustomerVo;
import zeniware.task.vo.PersonVo;
import zeniware.task.vo.RecordVo;

@Repository
public class CustomerDao extends AbstractDao {
	
	@SuppressWarnings("unchecked")
	public ArrayList<CustomerVo> getCustomerList(Map<String, Object> paramMap) {
		return (ArrayList<CustomerVo>) selectList("customer.getCustomerList", paramMap);
	}
	
	public void setCustomer(CustomerVo paramVo) {
		insert("customer.setCustomer", paramVo);
	}

	public void modCustomer(CustomerVo paramVo) {
		update("customer.modCustomer", paramVo);
	}

	public void delCustomer(CustomerVo paramVo) {
		delete("customer.delCustomer", paramVo);	
	}
  
	@SuppressWarnings("unchecked")
	public ArrayList<RecordVo> getRecordList(Map<String, Object> paramMap) {
		return (ArrayList<RecordVo>) selectList("customer.getRecordList", paramMap);
	}
	
	public void setRecord(RecordVo paramVo) {
		insert("customer.setRecord", paramVo);
	}

	public void modRecord(RecordVo paramVo) {
		update("customer.modRecord", paramVo);
	}

	public void delRecord(RecordVo paramVo) {
		delete("customer.delRecord", paramVo);	
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<PersonVo> getPersonList(Map<String, Object> paramMap) {
		return (ArrayList<PersonVo>) selectList("customer.getPersonList", paramMap);
	}
	
	public void setPerson(PersonVo paramVo) {
		insert("customer.setPerson", paramVo);
	}

	public void modPerson(PersonVo paramVo) {
		update("customer.modPerson", paramVo);
	}

	public void delPerson(PersonVo paramVo) {
		delete("customer.delPerson", paramVo);	
	}
	
	public void setFile(FileVo paramVo) {
		insert("file.setFile", paramVo);
	}
}