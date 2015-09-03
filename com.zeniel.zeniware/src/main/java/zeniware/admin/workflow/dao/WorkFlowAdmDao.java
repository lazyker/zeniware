package zeniware.admin.workflow.dao;

import org.springframework.stereotype.Repository;

import zeniware.admin.workflow.vo.ConfigVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class WorkFlowAdmDao extends AbstractDao {
	
	public ConfigVo getSingleConf(String compId) {
		return (ConfigVo)selectOne("admin.workflowAdm.getSingleConf", compId);
	}
	
	public int setSingleConf(ConfigVo conf) {
		return (int)insert("admin.workflowAdm.setSingleConf", conf);
	}

}
