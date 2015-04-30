package zeniware.sample;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.sample.service.MainService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("today")
	public String today(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
		logger.info("Welcome home! The client locale is {}.", paramMap);
		
		String today = mainService.getToday();
		
		model.put("today", today);
		
		return "home";
	}
}
