package zeniware.admin.preference;

import java.util.List;

import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;

@Repository
public class PreferenceDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<CommonCode> getCommonCodes() {
    return (List<CommonCode>)selectList("admin.getCommonCodes");
  }
  
}