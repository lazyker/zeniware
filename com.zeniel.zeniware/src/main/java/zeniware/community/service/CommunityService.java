package zeniware.community.service;

import java.util.List;
import java.util.Map;

import zeniware.community.vo.ComtVo;

public interface CommunityService {

	/**
	 * 커뮤니티 리스트 조회(사용자 기준)
	 * @param List<ComtVo>
	*/
	public List<ComtVo> getComntUserJoinList(Map<String, Object>paramMap);

	/**
	 * 커뮤니티 생성 관리자 설정 정보 조회(사용자기준)
	 * @param Map
	*/
	public Map<String, Object> getBasicComtInfo(Map<String, Object>paramMap);

	/**
	 * 커뮤니티 개설 신청 처리
	 * @param int
	*/
	public int insertNewComtInfo(ComtVo comtVo);

	/**
	 * 커뮤니티 이름 중복 체크
	 * @param int
	*/
	public int getCommunityCnt(Map<String, Object>paramMap);

	/**
	 * 커뮤니티 개설한 목록 전체 조회(반려제외-R)
	 * @param List<ComtVo>
	*/
	public List<ComtVo> getComtAllListData(Map<String, Object>paramMap);

	/**
	 * 커뮤니티 운영자 전체 이름 조회
	 * @param List<Map<String, Object>>
	*/
	public List<Map<String, Object>> getComtInofUserMastList(Map<String, Object> listMap);
}