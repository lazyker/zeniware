package zeniware.community.dao;

import java.util.List;
import java.util.Map;

import zeniware.common.sql.AbstractDao;
import zeniware.community.vo.CumtVo;

public class CommunityDao extends AbstractDao {

	/**
	 * 커뮤니티 리스트 조회(사용자 기준)
	 * @param List<CumtVo>
	*/
	public List<CumtVo> getCumntUserJoinList(Map<String, Object> paramMap) {
		return (List<CumtVo>) selectList("cumtUser.getCumntUserJoinList", paramMap);
	}
}