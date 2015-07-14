package zeniware.admin.community.service;

import java.util.List;
import java.util.Map;

import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.CumtInfoVO;

public interface CommunityAdmService {
	
	public Map<String, Object> getCommunityBasic(Map<String, Object> param);

	public void updateCumtBasic(CommunityVO communityVO);

	public void updateCumtAdmInfoList(Map<String, Object> param);

	public List<CumtInfoVO> getCumtListData(Map<String, Object> param);
}
