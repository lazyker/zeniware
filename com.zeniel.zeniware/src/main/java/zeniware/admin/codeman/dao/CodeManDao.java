package zeniware.admin.codeman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;
import zeniware.common.sql.AbstractDao;

@Repository
public class CodeManDao extends AbstractDao {
  
  @SuppressWarnings("unchecked")
  public List<CommonGroup> getGroupList() {
    
    return (List<CommonGroup>)selectList("admin.codeman.getGroupList");
  }

  @SuppressWarnings("unchecked")
  public List<CommonCode> getCodeList(Map<String, Object> paramMap) {
    
    return (List<CommonCode>)selectList("admin.codeman.getCodeList", paramMap);
  }
  
  public int getSingleCodeExists(Map<String, Object> paramMap) {
    
    return (int)selectOne("admin.codeman.getSingleCodeExists", paramMap);
  }
  
  public CommonCode getSingleCode(Map<String, Object> paramMap) {
    
    return (CommonCode)selectOne("admin.codeman.getSingleCode", paramMap); 
  }
  
  public int setSingleCode(CommonCode commonCode) {
    
    if (commonCode.getOrgCodeId().isEmpty()) {
      return (int)insert("admin.codeman.insertSingleCode", commonCode);
      
    } else {
      return (int)update("admin.codeman.updateSingleCode", commonCode);
    }    
  }
  
  public int delSingleCode(CommonCode commonCode) {
    
    return (int)delete("admin.codeman.deleteSingleCode", commonCode);
  }
  
}