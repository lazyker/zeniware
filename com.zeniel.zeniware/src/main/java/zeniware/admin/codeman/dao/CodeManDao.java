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
  public List<CommonGroup> getGroupList(Map<String, Object> paramMap) {
    
    return (List<CommonGroup>)selectList("admin.getGroupList", paramMap);
  }

  @SuppressWarnings("unchecked")
  public List<CommonCode> getCodeList(Map<String, Object> paramMap) {
    
    return (List<CommonCode>)selectList("admin.getCodeList", paramMap);
  }
  
  public int getSingleCodeExists(Map<String, Object> paramMap) {
    
    return (int)selectOne("admin.getSingleCodeExists", paramMap);
  }
  
  public CommonCode getSingleCode(Map<String, Object> paramMap) {
    
    return (CommonCode)selectOne("admin.getSingleCode", paramMap); 
  }
  
  public int setSingleCode(CommonCode commonCode) {
    
    if (commonCode.getOrgCodeId().isEmpty()) {
      return (int)insert("admin.insertSingleCode", commonCode);
      
    } else {
      return (int)update("admin.updateSingleCode", commonCode);
    }    
  }
  
  public int delSingleCode(CommonCode commonCode) {
    
    return (int)delete("admin.deleteSingleCode", commonCode);
  }
  
}