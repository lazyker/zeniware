package zeniware.admin.workflow.service;

import java.util.Map;

import zeniware.admin.workflow.vo.ConfigVo;

public interface WorkFlowAdmService {
	
	public ConfigVo getSingleConf(String compId);
	
	public int setSingleConf(Map<String, Object> paramMap) throws Throwable;

}
