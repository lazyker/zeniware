package zeniware.community.service;

import java.util.List;
import java.util.Map;

import zeniware.community.vo.ComtVo;

public interface CommunityService {

	/**
	 * 커뮤니티 리스트 조회(사용자 기준)
	 * @param List<ComtVo>
	*/
	public List<ComtVo> getCumntUserJoinList(Map<String, Object>paramMap);
}