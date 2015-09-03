package zeniware.admin.workflow.service.impl;

import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.workflow.dao.WorkFlowAdmDao;
import zeniware.admin.workflow.service.WorkFlowAdmService;
import zeniware.admin.workflow.vo.ConfigVo;

@Service
public class WorkFlowAdmServiceImpl implements WorkFlowAdmService {
	
	@Autowired
	WorkFlowAdmDao workflowAdmDao;
	
	public ConfigVo getSingleConf(String compId) {
		return workflowAdmDao.getSingleConf(compId);
	}

	public int setSingleConf(Map<String, Object> paramMap) throws Throwable {
		
		int affectedRows = 0;
		
		try {
			String jsonString = (String)paramMap.get("conf");
			ObjectMapper objectMapper = new ObjectMapper();
			ConfigVo conf = objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructType(ConfigVo.class));
			
			affectedRows = workflowAdmDao.setSingleConf(conf);
			
		} catch (Exception e) { throw e; }
		
		return affectedRows;
	}
}
