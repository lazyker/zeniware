package zeniware.task.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;
import zeniware.task.vo.CustomerVo;

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
  
}