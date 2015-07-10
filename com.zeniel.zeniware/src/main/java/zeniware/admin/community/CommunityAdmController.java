package zeniware.admin.community;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
