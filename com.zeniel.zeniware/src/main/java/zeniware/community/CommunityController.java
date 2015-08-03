package zeniware.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.converter.DateTimeUniqueConverter;
import zeniware.common.login.MemberInfo;
import zeniware.community.service.CommunityService;
import zeniware.community.vo.ComtVo;

@Controller
@RequestMapping(value = "/cumnity")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService communityService;

	@RequestMapping(value = "/comtMain")
	public String getCumtMain(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
		//Spring Security의 Authentication 객를 주입
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		//cumt left 메뉴 조회
		List<ComtVo> list = getCumntUserJoinList(memberInfo);
		model.addAttribute("comtlist", list);
		model.addAttribute("memberInfo", memberInfo);

		return "/cumtLayout/community/comtMain";
	}

	//내가 가입한 커뮤니티 리스트(가입대기 포함)
	public List<ComtVo> getCumntUserJoinList(MemberInfo memberInfo) {
		Map<String, Object>paramMap = new HashMap<String, Object>();

		paramMap.put("compId", memberInfo.getCompId());
		paramMap.put("userId", memberInfo.getUserId());
		paramMap.put("admActYn", "Y");

		List<ComtVo> list = communityService.getComntUserJoinList(paramMap);

		return list;
	}

	//커뮤니티 관리자 설정 기본 정보조회
	public Map<String, Object> getComtBasic(MemberInfo memberInfo) {
		Map<String, Object>paramMap = new HashMap<String, Object>();
		paramMap.put("compId", memberInfo.getCompId());

		Map<String, Object> comtInfo = null;
		comtInfo = communityService.getBasicComtInfo(paramMap);

		return comtInfo;
	}

	@RequestMapping(value = "/comtMainWrite")
	public String getComtWrite(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
		//Spring Security의 Authentication 객를 주입
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		//cumt left 메뉴 조회
		List<ComtVo> list = getCumntUserJoinList(memberInfo);
		model.addAttribute("comtlist", list);
		model.addAttribute("memberInfo", memberInfo);

		return "/cumtLayout/community/comtMainWrite";
	}

	@RequestMapping(value = "/writeComtMainBasic")
	public void setWriteComtMainBasic(@ModelAttribute ComtVo comtVo, HttpServletResponse response, Authentication authentication) throws Throwable {
		//Spring Security의 Authentication 객를 주입
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		Map<String, Object> paramMap = getComtBasic(memberInfo);
		String admActYn = (String) paramMap.get("CUMT_TYPE");
		comtVo.setRegUserId(memberInfo.getUserId());
		comtVo.setCompId(memberInfo.getCompId());
		comtVo.setDeptId(memberInfo.getDeptId());
		comtVo.setAdmActYn(admActYn);
		comtVo.setTypeGubun("C");
		comtVo.setMastGubun("M");
		comtVo.setJoinYn("Y");
		comtVo.setFcComtId(DateTimeUniqueConverter.UNIQUEKEY15());
		
		int addRow = communityService.insertNewComtInfo(comtVo);

		try {
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), addRow);
		}
		catch (Exception e) { throw e; }
//		return "redirect:/cumnity/comtMain";
	}

	@RequestMapping(value = "/getComtInfoCnt")
	public void getComtInfoCnt(@RequestParam Map<String, Object>paramMap, HttpServletResponse response) throws Throwable {
		int addRow = communityService.getCommunityCnt(paramMap);
		try {
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), addRow);
		}
		catch (Exception e) { throw e; }
	}

	//커뮤니티 메인의 커뮤니티 전체리스트 조회(R-반려 제외)
	@RequestMapping(value = "/getComtAllList")
	public void getComtAllListData(@RequestParam Map<String, Object> paramMap, HttpServletResponse response, Authentication authentication) throws IOException{
		//Spring Security의 Authentication 객를 주입
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();

		//cumt left 메뉴 조회
		List<ComtVo> list = getCumntAllJoinList(memberInfo);
		logger.debug("여기 호출 자체가 안되는것 같은데===================>");
		try {
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), list);
		} catch (Exception e) {
			throw e;
		}
	}

	//신청 완료된 커뮤니티 리스트(가입대기 포함)
	public List<ComtVo> getCumntAllJoinList(MemberInfo memberInfo) {
		Map<String, Object>paramMap = new HashMap<String, Object>();

		paramMap.put("compId", memberInfo.getCompId());
		paramMap.put("userId", memberInfo.getUserId());
		paramMap.put("admActYn", "Y");

		List<ComtVo> list = communityService.getComtAllListData(paramMap);
		/*Map<String, Object> listMap = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++) {
			listMap.put("fcComtId", list.get(i).getCompId());
			List<Map<String, Object>> userList = communityService.getComtInofUserMastList(listMap);
			listMap.put("userNm", userList);
			list.get(i).put("userNm", listMap);
		}*/

		return list;
	}
}