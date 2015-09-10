package zeniware.admin.workflow.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zeniware.admin.workflow.vo.ConfigVo;
import zeniware.admin.workflow.vo.FormContVo;
import zeniware.admin.workflow.vo.FormVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class WorkFlowAdmDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<FormContVo> getFormContList(String compId) {
		return (List<FormContVo>)selectList("admin.workflowAdm.getFormContList", compId);
	}
	
	public ConfigVo getSingleConf(String compId) {
		return (ConfigVo)selectOne("admin.workflowAdm.getSingleConf", compId);
	}
	
	public int setSingleConf(ConfigVo conf) {
		return (int)insert("admin.workflowAdm.setSingleConf", conf);
	}
	
	public int insertSingleFormCont(FormContVo formCont) {
		return (int)insert("admin.workflowAdm.insertSingleFormCont", formCont);
	}
	
	public int setSingleForm(FormVo form) {
		return (int)insert("admin.workflowAdm.setSingleForm", form);
	}
	
	public int updateSingleFormCont(FormContVo formCont) {
		return (int)update("admin.workflowAdm.updateSingleFormCont", formCont);
	}
	
	public int updateSingleForm(FormVo form) {
		return (int)update("admin.workflowAdm.updateSingleForm", form);
	}

}
