package zeniware.community.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.community.dao.CommunityDao;
import zeniware.community.service.CommunityService;
import zeniware.community.vo.ComtAddInfoVo;
import zeniware.community.vo.ComtVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao communityDao;

	@Override
	public List<ComtVo> getComntUserJoinList(Map<String, Object> paramMap) {
		List<ComtVo> list = communityDao.getComntUserJoinList(paramMap);
		return list;
	}

	@Override
	public Map<String, Object> getBasicComtInfo(Map<String, Object>paramMap) {
		return communityDao.getBasicComtInfo(paramMap);
	}

	@Override
	public int insertNewComtInfo(ComtVo comtVo) {
		return communityDao.insertNewComtInfo(comtVo);
	}

	@Override
	public int getCommunityCnt(Map<String, Object>paramMap) {
		return communityDao.getCommunityCnt(paramMap);
	}

	@Override
	public List<ComtVo> getComtAllListData(Map<String, Object>paramMap) {
		List<ComtVo> list = communityDao.getComtAllListData(paramMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> getComtInofUserMastList(Map<String, Object> listMap) {
		List<Map<String, Object>> list = communityDao.getComtInofUserMastList(listMap);
		return list;
	}

	@Override
	public int setInsertComtAllInfoUserAdd(Map<String, Object> paramVo) {
		return communityDao.setInsertComtAllInfoUserAdd(paramVo);
	}

	@Override
	public ComtVo getComtInfoDetail(Map<String, Object> paramMap) {
		return communityDao.getComtInfoDetail(paramMap);
	}
}