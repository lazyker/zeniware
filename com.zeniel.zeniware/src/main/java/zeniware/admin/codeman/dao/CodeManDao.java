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
  
  public CommonCode getSingleCode(Map<String, Object> paramMap) {
    return (CommonCode)selectOne("admin.getSingleCode", paramMap); 
  }
  
  public int setSingleCode(CommonCode commonCode) {
    return (int)insert("admin.insertSingleCode", commonCode);
  }
  
  public int delSingleCode(Map<String, Object> paramMap) {
    return (int)delete("admin.deleteSingleCode", paramMap);
  }
  
}