package zeniware.admin.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.CumtInfoVO;

public interface CommunityAdmService {
	
	public Map<String, Object> getCommunityBasic(Map<String, Object> param);

	public void updateCumtBasic(CommunityVO communityVO);

	public void updateCumtAdmInfoList(Map<String, Object> param);

	public List<CumtInfoVO> getCumtListData(Map<String, Object> param);

	@Transactional(value="transactionManager")
	public int updateCumtAdmlist(List<CumtInfoVO> cumtlist) throws Throwable;

	@Transactional(value="transactionManager")
	public int deleteCumtAdmlist(List<CumtInfoVO> cumtlist) throws Throwable;
}