package zeniware.admin.codeman.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;

public interface CodeManService {
  
  public List<CommonGroup> getGroupList();

  public List<CommonCode> getCodeList(Map<String, Object> paramMap);
  
  public int getSingleCodeExists(Map<String, Object> paramMap);
  
  public CommonCode getSingleCode(Map<String, Object> paramMap);

  int setSingleCode(CommonCode commonCode);
  
  @Transactional(value="transactionManager")
  int delCodeList(List<CommonCode> codelist) throws Throwable;
}
