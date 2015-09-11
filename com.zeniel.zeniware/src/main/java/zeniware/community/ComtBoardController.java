package zeniware.community;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.login.MemberInfo;
import zeniware.community.service.CommunityService;
import zeniware.community.service.ComtBoardService;
import zeniware.community.vo.ComtBoardInfoVo;
import zeniware.community.vo.ComtVo;

@Controller
@RequestMapping(value = "/comtBoard")
public class ComtBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ComtBoardController.class);

	@Autowired
	private ComtBoardService comtBoardService;

	@Autowired
	private CommunityService communityService;

	@RequestMapping(value = "/comtNewBoardWrite")
	public String setComtNewBoardWriteView(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		paramMap.put("compId", memberInfo.getCompId());
		paramMap.put("userId", memberInfo.getUserId());
		paramMap.put("admActYn", "Y");

		//현재 커뮤니티의 가입 여부 확인
		int joinCnt = communityService.getComtJoinCnt(paramMap);
		if(joinCnt == 0) {
			model.put("errorType",		"1");
		}

		//left 커뮤니티 조회(해당)
		Map<String, Object> comtInfo = communityService.getUsersComtInfoNm(paramMap);

		//left 커뮤니티 조회(해당제외)
		List<ComtVo> list = communityService.getComntUserJoinList(paramMap);

		//생성된 게시판 리스트 조회
		List<ComtBoardInfoVo> boardInfoList = communityService.getComtBoardInfoList(paramMap);

		model.put("fcComtId"		, paramMap.get("fcComtId"));
		model.put("joinCnt"			, joinCnt);
		model.put("comtInfo"		, comtInfo);
		model.put("comtList"			, list);
		model.put("boardInfoList"	, boardInfoList);
		model.addAttribute("useList"	, communityService.getComtInofUserMastList(paramMap));

		return "/cumtMainLayout/left_comtBoardMain/comtBoardInfoNew";
	}
}