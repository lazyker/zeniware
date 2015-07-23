package zeniware.admin.codeman.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.codeman.dao.CodeManDao;
import zeniware.admin.codeman.service.CodeManService;
import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;

@Service
public class CodeManServiceImpl implements CodeManService {
  
  @Autowired
  private CodeManDao codemanDao;
  
  @Override
  public List<CommonGroup> getGroupList() {
    return codemanDao.getGroupList();
  }
  
  @Override
  public List<CommonCode> getCodeList(Map<String, Object> paramMap) {
    return codemanDao.getCodeList(paramMap);
  }
  
  @Override
  public int getSingleCodeExists(Map<String, Object> paramMap) {
    return codemanDao.getSingleCodeExists(paramMap);
  }
  
  @Override
  public CommonCode getSingleCode(Map<String, Object> paramMap) {
    return codemanDao.getSingleCode(paramMap);
  }
  
  @Override
  public int setSingleCode(CommonCode commonCode) {
    return codemanDao.setSingleCode(commonCode);
  }
  
  @Override
  public int delCodeList(List<CommonCode> codelist) throws Throwable {
    
    int affectedRows = -1;
    
    try {
      for (CommonCode commonCode : codelist) {
        affectedRows += codemanDao.delSingleCode(commonCode);
      }
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
}