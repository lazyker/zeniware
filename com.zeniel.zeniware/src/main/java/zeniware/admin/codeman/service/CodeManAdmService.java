package zeniware.admin.codeman.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.codeman.vo.CodeVo;
import zeniware.admin.codeman.vo.GroupVo;

public interface CodeManAdmService {
  
  public List<GroupVo> getGroupList();

  public List<CodeVo> getCodeList(Map<String, Object> paramMap);
  
  public int getSingleCodeExists(Map<String, Object> paramMap);
  
  public CodeVo getSingleCode(Map<String, Object> paramMap);

  @Transactional(value="transactionManager")
  int setSingleCode(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  int setCodeListSort(Map<String, Object> paramMap) throws Throwable;
  
  @Transactional(value="transactionManager")
  int deleteCodeList(Map<String, Object> paramMap) throws Throwable;
}
