package zeniware.admin.community;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityAdmController.class);

	@RequestMapping("/admin/community/default")
	public String getCommunityAdmDefailt(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
		return "/adminLayout/community/default";
	}
}