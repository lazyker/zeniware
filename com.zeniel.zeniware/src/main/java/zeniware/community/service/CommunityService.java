package zeniware.community.service;

import java.util.List;
import java.util.Map;

import zeniware.community.vo.ComtAddInfoVo;
import zeniware.community.vo.ComtBoardInfoVo;
import zeniware.community.vo.ComtBoardVo;
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

	/**
	 * 커뮤니티 가입 신청
	 * @param ComtAddInfoVo
	*/
	public int setInsertComtAllInfoUserAdd(Map<String, Object> paramVo);

	public ComtVo getComtInfoDetail(Map<String, Object> paramMap);

	//커뮤니티 상세보기의 정보 수정
	public int setInsertUserComtBasicInfo(Map<String, Object> paramMap);

	//커뮤니티 상세보기 수정의 커뮤니티명 중복 확인
	public int getInserComtBasicInfoNm(Map<String, Object> paramMap);

	//커뮤니티 멤버 전체 조회
	public List<Map<String, Object>> getComtInfoMemberAllList(Map<String, Object> listMap);

	//커뮤니티 멤버 탈퇴 처리
	public int setDeleteComtInfoMemUser(Map<String, Object> paramMap);

	//커뮤니티 가입승인 처리
	public int setUpdateComtInfoMemUser(Map<String, Object> paramMap);

	//커뮤니티 페쇄 신청 처리
	public int setInsertComtInfoBasicClose(Map<String, Object> paramMap);

	//커뮤니티 메일 발송 내용 DB 저장 처리
	public int setInsertComtInfoMailSend(Map<String, Object> paramMap);

	//커뮤니티 가입여부 조회
	public int getComtJoinCnt(Map<String, Object> paramMap);

	//커뮤니티 현재 명 조회
	public Map<String, Object> getUsersComtInfoNm(Map<String, Object> paramMap);

	//left 커뮤니티 조회(해당제외)
	public List<ComtVo> getUsersComtInfoNmList(Map<String, Object> paramMap);

	//생성된 게시판 리스트 조회
	public List<ComtBoardInfoVo> getComtBoardInfoList(Map<String, Object> paramMap);

	//해당 커뮤니티의 최신글 조회
	public List<ComtBoardVo> getComtBoardNewList(Map<String, Object> paramMap);
}