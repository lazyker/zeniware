package zeniware.admin.workflow.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.workflow.vo.ConfigVo;
import zeniware.admin.workflow.vo.FormContVo;

public interface WorkFlowAdmService {
	
	public List<FormContVo> getFormContList(String compId);
	
	public ConfigVo getSingleConf(String compId);
	
	public int setSingleConf(Map<String, Object> paramMap) throws Throwable;
	
	public int insertSingleFormCont(Map<String, Object> paramMap) throws Throwable;
	
	@Transactional(value="transactionManager")
	public int setFormContList(Map<String, Object> paramMap) throws Throwable;
	
	@Transactional(value="transactionManager")
	public int updateFormContList(Map<String, Object> paramMap) throws Throwable;

}
