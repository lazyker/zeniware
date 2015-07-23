package zeniware.admin.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.admin.community.dao.CommunityAdmDao;
import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.ComtInfoVO;

@Service
public class CommunityAdmServiceImpl implements CommunityAdmService {

	@Autowired
	private CommunityAdmDao communityAdmDao;

	@Override
	public Map<String, Object> getCommunityBasic(Map<String, Object> param) {
		return communityAdmDao.getCommunityBasic(param);
	}

	@Override
	public void updateCumtBasic(CommunityVO communityVO) {
		communityAdmDao.updateCumtBasic(communityVO);
	}

	@Override
	public void updateCumtAdmInfoList(Map<String, Object> param) {
		communityAdmDao.updateCumtAdmInfoList(param);
	}

	@Override
	public List<ComtInfoVO> getCumtListData(Map<String, Object> param) {
		return communityAdmDao.getCumtListData(param);
	}

	@Override
	public int updateCumtAdmlist(List<ComtInfoVO> cumtlist) throws Throwable {
		int addRows = -1;
		try {
			for(ComtInfoVO comtInfoVO: cumtlist) {
				addRows += communityAdmDao.updateCumtAdmlist(comtInfoVO);
			}
		}
		catch (Exception e) { throw e; }
		return addRows;
	}

	@Override
	public int deleteCumtAdmlist(List<ComtInfoVO> cumtlist) throws Throwable {
		int addRows = -1;
		try {
			for(ComtInfoVO comtInfoVO: cumtlist) {
				addRows += communityAdmDao.deleteCumtAdmlist(comtInfoVO);
			}
		}
		catch (Exception e) { throw e; }
		return addRows;
	}
}
