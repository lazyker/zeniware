package zeniware.community.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.community.dao.CommunityDao;
import zeniware.community.service.CommunityService;
import zeniware.community.vo.ComtVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao communityDao;

	@Override
	public List<ComtVo> getCumntUserJoinList(Map<String, Object> paramMap) {
		List<ComtVo> list = communityDao.getCumntUserJoinList(paramMap);
		return list;
	}
}