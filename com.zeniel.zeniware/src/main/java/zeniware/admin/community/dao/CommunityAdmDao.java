package zeniware.admin.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.CumtInfoVO;
import zeniware.common.sql.AbstractDao;

@Repository
public class CommunityAdmDao extends AbstractDao {

	/**
	 * 커뮤니티 기본 Basic 설정
	 * @param param
	 * @return Map
	*/
	public Map<String, Object> getCommunityBasic(Map<String, Object> param) {
		int res = (int) selectOne("cmutadmin.getCommunityCnt", param);
		if(res == 0) {
			selectOne("cmutadmin.insertCommunityBasic", param);
		}
		return (Map<String, Object>) selectOne("cmutadmin.getCommunityBasic", param);
	}

	/**
	 * 커뮤니티 기본 Basic 설정 update
	 * @param
	*/
	public void updateCumtBasic(CommunityVO communityVO) {
		update("cmutadmin.updateCumtBasic", communityVO);
	}

	/**
	 * 커뮤니티 관리자 승인없이 개설일 경우 개설신청목록의 관리자 승인으로 처리
	 * @param
	*/
	public void updateCumtAdmInfoList(Map<String, Object> param) {
		int res = (int) selectOne("cmutadmin.getCCumtAdmInfoListCnt", param);
		if(res > 0) {
			update("cmutadmin.updateCumtAdmInfoList", param);
		}
	}

	/**
	 * 커뮤니티 개설신청 목록 조회
	*/
	public List<CumtInfoVO> getCumtListData(Map<String, Object> param) {
		return (List<CumtInfoVO>) selectList("cmutadmin.getCumtListData", param);
	}
}
