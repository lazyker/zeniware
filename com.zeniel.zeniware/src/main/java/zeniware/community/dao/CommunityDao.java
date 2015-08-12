package zeniware.community.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import zeniware.common.sql.AbstractDao;
import zeniware.community.vo.ComtAddInfoVo;
import zeniware.community.vo.ComtVo;

@Repository
public class CommunityDao extends AbstractDao {

	private static final Logger logger = LoggerFactory.getLogger(CommunityDao.class);
	/**
	 * 커뮤니티 리스트 조회(사용자 기준)
	 * @param List<CumtVo>
	*/
	public List<ComtVo> getComntUserJoinList(Map<String, Object> paramMap) {
		return (List<ComtVo>) selectList("comtUser.getComntUserJoinList", paramMap);
	}

	/**
	 * 커뮤니티 생성 관리자 설정 정보 조회(사용자기준)
	 * @param Map
	*/
	public Map<String, Object> getBasicComtInfo(Map<String, Object>paramMap) {
		return (Map<String, Object>) selectOne("comtUser.getBasicComtInfo" , paramMap);
	}

	/**
	 * 커뮤니티 개설 신청 처리
	 * @param int
	*/
	public int insertNewComtInfo(ComtVo comtVo) {
		int res = (int) selectOne("comtUser.getComtInfoCnt", comtVo);
		logger.debug("커뮤니티 개설 신청 처리 중복====================================>" + res);
		int rsult = 0;
		if(res == 0) {
			insert("comtUser.insertNewComtInfoAdd", comtVo);
			rsult = (int) insert("comtUser.insertNewComtAddUserInfo" , comtVo);
		}
		return rsult;
	}

	/**
	 * 커뮤니티 이름 중복 체크
	 * @param int
	*/
	public int getCommunityCnt(Map<String, Object>paramMap) {
		return (int) selectOne("comtUser.getComtInfoCnt", paramMap);
	}

	/**
	 * 커뮤니티 개설한 목록 전체 조회(반려제외-R)
	 * @param List<ComtVo>
	*/
	public List<ComtVo> getComtAllListData(Map<String, Object>paramMap) {
		return (List<ComtVo>) selectList("comtUser.getComtAllListData", paramMap);
	}

	/**
	 * 커뮤니티 운영자 전체 이름 조회
	 * @param listMap
	 * @return List<Map<String, Object>>
	*/
	public List<Map<String, Object>> getComtInofUserMastList(Map<String, Object> listMap) {
		return (List<Map<String, Object>>) selectList("comtUser.getComtInofUserMastList", listMap);
	}

	/**
	 * 커뮤니티 가입 신청
	 * @param paramVo
	*/
	public int setInsertComtAllInfoUserAdd(Map<String, Object> paramVo) {
		return (int) insert("comtUser.setInsertComtAllInfoUserAdd", paramVo);
	}

	/**
	 * 커뮤니티 정보 상세 view 조회
	*/
	public ComtVo getComtInfoDetail(Map<String, Object> paramMap) {
		return (ComtVo) selectOne("comtUser.comtview.getComtInfoDetail", paramMap);
	}

	/**
	 * 커뮤니티 운영자 정보 전체 변경
	*/
	public int setUpdateComtInfoAddUserAll(Map<String, Object> paramMap) {
		return (int) update("comtUser.setUpdateComtInfoAddUserAll", paramMap);
	}

	//커뮤니티 가입자 운영자 변경 처리
	public int setUpdateComtInfoAddUser(Map<String, Object> paramMap) {
		return (int) update("comtUser.setUpdateComtInfoAddUser", paramMap);
	}

	/**
	 * 커뮤니티 가입여부 조회(fcComtId로 해당 커뮤니티 전체 조회)
	*/
	public int getComtAddInfoCnt(Map<String, Object> paramMap) {
		return (int) selectOne("comtUser.getComtAddInfoCnt", paramMap);
	}
	/**
	 * 커뮤니티 상세보기의 정보 수정
	*/
	public int setInsertUserComtBasicInfo(Map<String, Object> paramMap) {
		return (int) update("comtUser.setInsertUserComtBasicInfo", paramMap);
	}

	//커뮤니티 멤버 전체 조회
	public List<Map<String, Object>> getComtInfoMemberAllList(Map<String, Object> listMap) {
		return (List<Map<String, Object>>) selectList("comtUser.getComtInfoMemberAllList", listMap);
	}

	//커뮤니티 멤버 탈퇴 처리
	public int setDeleteComtInfoMemUser(Map<String, Object> paramMap) {
		return (int) delete("comtUser.setDeleteComtInfoMemUser", paramMap);
	}

	//커뮤니티 가입승인 처리
	public int setUpdateComtInfoMemUser(Map<String, Object> paramMap) {
		return (int) update("comtUser.setUpdateComtInfoMemUser", paramMap);
	}

	//커뮤니티 페쇄 신청 처리
	public int setInsertComtInfoBasicClose(Map<String, Object> paramMap) {
		int rw =  (int) update("comtUser.setUpdateComtInfoBasicClose", paramMap);
		if(rw > 0) {
			insert("comtUser.setInsertComtInfoBasicClose", paramMap);
		}
		return rw;
	}

	//커뮤니티 메일 발송 내용 DB 저장 처리
	public int setInsertComtInfoMailSend(Map<String, Object> paramMap) {
		return (int) update("comtUser.setInsertComtInfoMailSend", paramMap);
	}
}