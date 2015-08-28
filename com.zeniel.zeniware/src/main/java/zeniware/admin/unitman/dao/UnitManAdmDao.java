package zeniware.admin.unitman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.unitman.vo.CompanyVo;
import zeniware.admin.unitman.vo.DepartmentVo;
import zeniware.admin.unitman.vo.UserVo;
import zeniware.common.sql.AbstractDao;

@Repository
public class UnitManAdmDao extends AbstractDao {
  
  /*********************
   * Select List
   *********************/
  @SuppressWarnings("unchecked")
  public List<CompanyVo> getCompList(Map<String, Object> paramMap) {
    return (List<CompanyVo>)selectList("admin.unitman.getCompList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<DepartmentVo> getDeptList(Map<String, Object> paramMap) {
    return (List<DepartmentVo>)selectList("admin.unitman.getDeptList", paramMap);
  }
  
  @SuppressWarnings("unchecked")
  public List<UserVo> getUserList(Map<String, Object> paramMap) {
    return (List<UserVo>)selectList("admin.unitman.getUserList", paramMap);
  }
  
  /*********************
   * Select One
   *********************/
  public CompanyVo getSingleComp(Map<String, Object> paramMap) {
    return (CompanyVo)selectOne("admin.unitman.getSingleComp", paramMap);
  }
  
  public DepartmentVo getSingleDept(Map<String, Object> paramMap) {
    return (DepartmentVo)selectOne("admin.unitman.getSingleDept", paramMap);
  }
  
  public UserVo getSingleUser(Map<String, Object> paramMap) {
    return (UserVo)selectOne("admin.unitman.getSingleUser", paramMap);
  }
  
  public String getRootDept(String compId) {
    return (String)selectOne("admin.unitman.getRootDept", compId);
  }
  
  /*********************
   * Insert/Update One
   *********************/
  public int setSingleComp(CompanyVo comp) {
    return (int)insert("admin.unitman.setSingleComp", comp);
  }
  
  public int setSingleDept(DepartmentVo dept) {
    return (int)insert("admin.unitman.setSingleDept", dept);
  }
  
  public int setSingleUser(UserVo user) {
    return (int)insert("admin.unitman.setSingleUser", user);
  }
  
  /*********************
   * Update One
   *********************/
  public int restoreSingleComp(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.restoreSingleComp", paramMap);
  }
  
  public int restoreSingleDept(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.restoreSingleDept", paramMap);
  }
  
  public int restoreSingleUser(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.restoreSingleUser", paramMap);
  }
  
  public int moveSingleDept(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.moveSingleDept", paramMap);
  }
  
  public int moveSingleUser(Map<String, Object> paramMap) {
    return (int)update("admin.unitman.moveSingleUser", paramMap);
  }
  
  public int setSingleDeptSort(DepartmentVo dept) {
    return (int)update("admin.unitman.setSingleDeptSort", dept);
  }
  
  public int setSingleUserSort(UserVo user) {
    return (int)update("admin.unitman.setSingleUserSort", user);
  }
  
  /*********************
   * Update/Delete One
   *********************/
  public int deleteSingleComp(Map<String, Object> paramMap) {
    return (int)delete("admin.unitman.deleteSingleComp", paramMap);
  }
  
  public int deleteSingleDept(Map<String, Object> paramMap) {
    return (int)delete("admin.unitman.deleteSingleDept", paramMap);
  }
  
  public int deleteSingleUser(Map<String, Object> paramMap) {
    return (int)delete("admin.unitman.deleteSingleUser", paramMap);
  }
  
}
