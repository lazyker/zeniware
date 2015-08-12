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

	@Override
	public int setInsertUserComtBasicInfo(Map<String, Object> paramMap) {
		String txtMastGubun		= (String) paramMap.get("txtMastGubun");
		String[] mg_arr = ((String) paramMap.get("txtMastGubun")).split(",");
		for(int i = 0; i < mg_arr.length; i++) {
			int upCnt = communityDao.getComtAddInfoCnt(paramMap);
			if(upCnt > 0) {
				//communityDao.setUpdateComtAddInfo(paramMap);
			} else {
				//communityDao.setInsertComtAddInfo(paramMap);
			}
		}
		//int delCnt = communityDao.setDelteComtInfoUserAll(paramMap);
		//if(delCnt > 0) {
			/*
			 * comtVo.setAdmActYn(admActYn);
		comtVo.setTypeGubun("C");
		comtVo.setMastGubun("M");
		comtVo.setJoinYn("Y");
		comtVo.setInviteYn("40");
			 */
			//communityDao.
		//}
		return communityDao.setInsertUserComtBasicInfo(paramMap);
	}

	@Override
	public List<Map<String, Object>> getComtInfoMemberAllList(Map<String, Object> listMap) {
		return communityDao.getComtInfoMemberAllList(listMap);
	}

	@Override
	public int setDeleteComtInfoMemUser(Map<String, Object> paramMap) {
		return communityDao.setDeleteComtInfoMemUser(paramMap);
	}

	@Override
	public int setUpdateComtInfoMemUser(Map<String, Object> paramMap) {
		return communityDao.setUpdateComtInfoMemUser(paramMap);
	}

	@Override
	public int setInsertComtInfoBasicClose(Map<String, Object> paramMap) {
		return communityDao.setInsertComtInfoBasicClose(paramMap);
	}

	@Override
	public int setInsertComtInfoMailSend(Map<String, Object> paramMap) {
		return communityDao.setInsertComtInfoMailSend(paramMap);
	}
}