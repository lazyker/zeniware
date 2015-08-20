package zeniware.admin.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.ComtInfoVO;

public interface CommunityAdmService {
	
	public Map<String, Object> getCommunityBasic(Map<String, Object> param);

	public void updateCumtBasic(CommunityVO communityVO);

	public void updateCumtAdmInfoList(Map<String, Object> param);

	public List<ComtInfoVO> getCumtListData(Map<String, Object> param);

	//관리자에서 전체 커뮤니티 목록 조회
	public List<ComtInfoVO> getCumtALLListData(Map<String, Object> param);

	@Transactional(value="transactionManager")
	public int updateCumtAdmlist(List<ComtInfoVO> cumtlist) throws Throwable;

	@Transactional(value="transactionManager")
	public int deleteCumtAdmlist(List<ComtInfoVO> cumtlist) throws Throwable;
}