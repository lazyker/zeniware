package zeniware.task.service;

import java.util.ArrayList;
import java.util.Map;

import zeniware.task.vo.CustomerVo;

public interface CustomerService {
	
	public ArrayList<CustomerVo> getCustomerList(Map<String, Object> paramMap);
	
	public void setCustomer(CustomerVo paramVo);
	  
	public void modCustomer(CustomerVo paramVo);
	 
	public void delCustomer(CustomerVo paramVo);
	  
}
