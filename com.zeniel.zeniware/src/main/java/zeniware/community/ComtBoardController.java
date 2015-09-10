package zeniware.community;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.community.service.ComtBoardService;

@Controller
@RequestMapping(value = "/comtBoard")
public class ComtBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ComtBoardController.class);

	@Autowired
	private ComtBoardService comtBoardService;

	@RequestMapping(value = "/comtNewBoardWrite")
	public String setComtNewBoardWriteView(@RequestParam Map<String, Object>paramMap, ModelMap model, Authentication authentication) throws Throwable {
		model.put("fcComtId",		paramMap.get("fcComtId"));

		return "/cumtMainLayout/left_comtBoardMain/comtBoardInfoNew";
	}
}