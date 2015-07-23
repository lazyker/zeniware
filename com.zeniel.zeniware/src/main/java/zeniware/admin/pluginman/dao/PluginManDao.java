package zeniware.admin.pluginman.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.pluginman.vo.SelectOption;
import zeniware.common.sql.AbstractDao;

@Repository
public class PluginManDao extends AbstractDao {

  @SuppressWarnings("unchecked")
  public List<SelectOption> getSboxCodeList(Map<String, Object> paramMap) {
    return selectList("admin.pluginman.getSboxCodeList", paramMap);
  }
}
