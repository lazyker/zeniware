package zeniware.admin.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.ComtInfoVO;
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
	 * @param list
	*/
	public List<ComtInfoVO> getCumtListData(Map<String, Object> param) {
		return (List<ComtInfoVO>) selectList("cmutadmin.getCumtListData", param);
	}

	//관리자에서 전체 커뮤니티 목록 조회
	public List<ComtInfoVO> getCumtALLListData(Map<String, Object> param) {
		return (List<ComtInfoVO>) selectList("cmutadmin.getCumtALLListData", param);
	}

	/**
	 * 커뮤니티 개설신청 승인 처리
	 * @param int
	*/
	public int updateCumtAdmlist(ComtInfoVO comtInfoVO) {
		return (int) update("cmutadmin.updateCumtAdmlist", comtInfoVO);
	}

	/**
	 * 커뮤니티 개설신청 반려 처리
	 * @param
	*/
	public int deleteCumtAdmlist(ComtInfoVO comtInfoVO) {
		return (int) delete("cmutadmin.deleteCumtAdmlist", comtInfoVO);
	}
}
