package zeniware.admin.community;

import java.util.Map;
import org.springframework.stereotype.Repository;
import zeniware.common.sql.AbstractDao;

@Repository
public class CommunityAdmDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public Map<String, Object> getCommunityBasic(Map<String, Object> param) {
		int res = (int) selectOne("cmutadmin.getCommunityCnt", param);
		if(res == 0) {
			selectOne("cmutadmin.insertCommunityBasic", param);
		}
		return (Map<String, Object>) selectList("cmutadmin.getCommunityBasic", param);
	}
}
