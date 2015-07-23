package zeniware.community;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.community.service.CommunityService;
import zeniware.community.vo.ComtVo;

@Controller
@RequestMapping(value = "/cumnity")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService communityService;

	@RequestMapping(value = "/cumtMain")
	public String getCumtMain(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Throwable {
		//cumt left 메뉴 조회
		List<ComtVo> list = new ArrayList<ComtVo>();
		list = communityService.getCumntUserJoinList(paramMap);

		return "/cumtLayout/community/cumtMain";
	}
}