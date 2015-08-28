package zeniware.admin.codeman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.codeman.vo.CodeVo;
import zeniware.admin.codeman.vo.GroupVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class CodeManAdmDao extends AbstractDao {
  
  @SuppressWarnings("unchecked")
  public List<GroupVo> getGroupList() {
    
    return (List<GroupVo>)selectList("admin.codeman.getGroupList");
  }

  @SuppressWarnings("unchecked")
  public List<CodeVo> getCodeList(Map<String, Object> paramMap) {
    
    return (List<CodeVo>)selectList("admin.codeman.getCodeList", paramMap);
  }
  
  public int getSingleCodeExists(Map<String, Object> paramMap) {
    
    return (int)selectOne("admin.codeman.getSingleCodeExists", paramMap);
  }
  
  public CodeVo getSingleCode(Map<String, Object> paramMap) {
    
    return (CodeVo)selectOne("admin.codeman.getSingleCode", paramMap); 
  }
  
  public int setSingleCode(CodeVo code) {
    
    if (code.getOrgCodeId().isEmpty()) {
      return (int)insert("admin.codeman.insertSingleCode", code);
      
    } else {
      return (int)update("admin.codeman.updateSingleCode", code);
    }    
  }
  
  public int setSingleCodeSort(CodeVo code) {
    return (int)update("admin.codeman.setSingleCodeSort", code);
  }
  
  public int delSingleCode(CodeVo code) {
    
    return (int)delete("admin.codeman.deleteSingleCode", code);
  }
  
}