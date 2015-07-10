package zeniware.admin.community;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityAdmServiceImpl implements CommunityAdmService {

	@Autowired
	private CommunityAdmDao communityAdmDao;

	public Map<String, Object> getCommunityBasic(Map<String, Object> param) {
		return communityAdmDao.getCommunityBasic(param);
	}
}
