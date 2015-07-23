package zeniware.admin.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.community.service.CommunityAdmService;
import zeniware.admin.community.vo.CommunityVO;
import zeniware.admin.community.vo.ComtInfoVO;

@Controller
@RequestMapping(value = {"/admin/community"})
public class CommunityAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityAdmController.class);

	@Autowired
	CommunityAdmService communityAdmService;

	@RequestMapping("/default")
	public String getCommunityAdmDefailt(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
		paramMap.put("compId", "001");

		Map<String, Object> cmutBasic = null;
		cmutBasic = communityAdmService.getCommunityBasic(paramMap);

		model.put("file_add_cnt", "3");
		model.put("file_size", "4");
		model.put("cmutBasic", cmutBasic);

		return "/adminLayout/community/default";
	}

	@RequestMapping(value = "/editBasic", method=RequestMethod.POST)
	public String setEditCumtBasic(@ModelAttribute CommunityVO communityVO) throws Throwable {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("compId", "001");

		//관리자 승인없이 커뮤니티 개설일 경우 신청한 커뮤니티 전부 승인으로 바꾸어 주기
		if(communityVO.getCumtType().equals("Y")) {
			//커뮤니티 승인으로 변경
			communityAdmService.updateCumtAdmInfoList(paramMap);
		}
		communityAdmService.updateCumtBasic(communityVO);

		return "redirect:/admin/community/default";
	}

	@RequestMapping(value = "/cumtInfoList", method=RequestMethod.GET)
	public String getCommunityInfoList(@RequestParam Map<String, Object> paramMap, ModelMap model) throws IOException{
		paramMap.put("compId", "001");
		model.put("compId", "001");

		return "/adminLayout/community/cumtInfoList";
	}

	@RequestMapping(value = "/getCumtListData")
	public void getCumtListData(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.debug("여기 호출이 제대로 되는것만 확인");
		List<ComtInfoVO> list = new ArrayList<ComtInfoVO>();
		try {
			list = communityAdmService.getCumtListData(paramMap);

			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), list);
	    } catch (Exception e) {
	      throw e;
	    }
	}

	//개설신청 수락 처리 Ajax
	@RequestMapping(value = "updateCumtAdmlist")
	public void updateCumtAdmlist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		try {
			String jsonString = (String)paramMap.get("cumtlist");
			ObjectMapper objectMapper = new ObjectMapper();
			List<ComtInfoVO> cumtlist = objectMapper.readValue(jsonString,
					objectMapper.getTypeFactory().constructCollectionType(List.class, ComtInfoVO.class));
			int addRow = communityAdmService.updateCumtAdmlist(cumtlist);

			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), addRow);
		}
		catch (Exception e) { throw e; }
	}

	//개설신청 반려 처리 Ajax
	@RequestMapping(value = "deleteCumtAdmlist")
	public void deleteCumtAdmlist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		try {
			String jsonString = (String)paramMap.get("cumtlist");
			ObjectMapper objectMapper = new ObjectMapper();
			List<ComtInfoVO> cumtlist = objectMapper.readValue(jsonString,
					objectMapper.getTypeFactory().constructCollectionType(List.class, ComtInfoVO.class));
			int addRow = communityAdmService.deleteCumtAdmlist(cumtlist);

			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			mapper.writeValue(response.getOutputStream(), addRow);
		}
		catch (Exception e) { throw e; }
	}
}
