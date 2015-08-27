package zeniware.admin.codeman.service.impl;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.codeman.dao.CodeManAdmDao;
import zeniware.admin.codeman.service.CodeManAdmService;
import zeniware.admin.codeman.vo.CodeVo;
import zeniware.admin.codeman.vo.GroupVo;

@Service
public class CodeManAdmServiceImpl implements CodeManAdmService {
  
  @Autowired
  private CodeManAdmDao codemanAdmDao;
  
  @Override
  public List<GroupVo> getGroupList() {
    return codemanAdmDao.getGroupList();
  }
  
  @Override
  public List<CodeVo> getCodeList(Map<String, Object> paramMap) {
    return codemanAdmDao.getCodeList(paramMap);
  }
  
  @Override
  public int getSingleCodeExists(Map<String, Object> paramMap) {
    return codemanAdmDao.getSingleCodeExists(paramMap);
  }
  
  @Override
  public CodeVo getSingleCode(Map<String, Object> paramMap) {
    return codemanAdmDao.getSingleCode(paramMap);
  }
  
  @Override
  public int setSingleCode(Map<String, Object> paramMap) throws Throwable {
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("code");
      ObjectMapper objectMapper = new ObjectMapper();
      
      CodeVo code = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructType(CodeVo.class));
      
      affectedRows = codemanAdmDao.setSingleCode(code);
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int setCodeListSort(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("userlist");
      
      ObjectMapper objectMapper = new ObjectMapper();
      List<CodeVo> codelist = objectMapper.readValue(jsonString, 
          objectMapper.getTypeFactory().constructCollectionType(List.class, CodeVo.class));
      
      for (CodeVo code : codelist) {
        affectedRows += codemanAdmDao.setSingleCodeSort(code);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
  @Override
  public int deleteCodeList(Map<String, Object> paramMap) throws Throwable {
    
    int affectedRows = 0;
    
    try {
      String jsonString = (String)paramMap.get("codelist");
      ObjectMapper objectMapper = new ObjectMapper();
      
      List<CodeVo> codelist = objectMapper.readValue(jsonString, 
        objectMapper.getTypeFactory().constructCollectionType(List.class, CodeVo.class));
      
      for (CodeVo code : codelist) {
        affectedRows += codemanAdmDao.delSingleCode(code);
      }
      
    } catch (Exception e) { throw e; }
    
    return affectedRows;
  }
  
}