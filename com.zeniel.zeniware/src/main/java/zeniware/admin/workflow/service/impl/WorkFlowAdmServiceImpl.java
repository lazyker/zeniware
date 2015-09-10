package zeniware.admin.workflow.service.impl;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.workflow.dao.WorkFlowAdmDao;
import zeniware.admin.workflow.service.WorkFlowAdmService;
import zeniware.admin.workflow.vo.ConfigVo;
import zeniware.admin.workflow.vo.FormContVo;
import zeniware.admin.workflow.vo.FormVo;

@Service
public class WorkFlowAdmServiceImpl implements WorkFlowAdmService {
	
	@Autowired
	WorkFlowAdmDao workflowAdmDao;
	
	@Override
	public ConfigVo getSingleConf(String compId) {
		return workflowAdmDao.getSingleConf(compId);
	}
	
	@Override
	public List<FormContVo> getFormContList(String compId) {
		return workflowAdmDao.getFormContList(compId);
	}

	@Override
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
	
	@Override
	public int insertSingleFormCont(Map<String, Object> paramMap) throws Throwable {
		
		int affectedRows = 0;
		
		try {
			String jsonString = (String)paramMap.get("cont");
			ObjectMapper objectMapper = new ObjectMapper();
			FormContVo cont = objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructType(FormContVo.class));
			
			affectedRows = workflowAdmDao.insertSingleFormCont(cont);
			
		} catch (Exception e) { throw e; }
		
		return affectedRows;
	}
	
	@Override
	public int setFormContList(Map<String, Object> paramMap) throws Throwable {
		int affectedRows = 0;
		
		try {
			String jsonString = (String)paramMap.get("contlist");
			ObjectMapper objectMapper = new ObjectMapper();
			List<FormContVo> contlist = objectMapper.readValue(jsonString, 
				objectMapper.getTypeFactory().constructCollectionType(List.class, FormContVo.class));
			
			for (FormContVo cont : contlist) {
				affectedRows += workflowAdmDao.updateSingleFormCont(cont);
			}
			
		} catch (Exception e) { throw e; }
		
		return affectedRows;
	}
	
	@Override
	public int updateFormContList(Map<String, Object> paramMap) throws Throwable {
		
		int affectedRows = 0;
		
		try {
			String jsonString = (String)paramMap.get("contlist");
			ObjectMapper objectMapper = new ObjectMapper();
			List<FormContVo> contlist = objectMapper.readValue(jsonString, 
				objectMapper.getTypeFactory().constructCollectionType(List.class, FormContVo.class));
			
			for (FormContVo cont : contlist) {
				affectedRows += workflowAdmDao.updateSingleFormCont(cont);
				
				for (FormVo frm : cont.getFormList()) {
					affectedRows += workflowAdmDao.updateSingleForm(frm);
				}
			}
			
		} catch (Exception e) { throw e; }
		
		return affectedRows;
	}
	
}
