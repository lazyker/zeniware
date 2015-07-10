package zeniware.admin.codeman.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;

public interface CodeManService {
  
  public List<CommonGroup> getGroupList(Map<String, Object> paramMap);

  public List<CommonCode> getCodeList(Map<String, Object> paramMap);
  
  public CommonCode getSingleCode(Map<String, Object> paramMap);

  int setSingleCode(CommonCode commonCode);
  
  int delSingleCode(Map<String, Object> paramMap);
}
