package zeniware.common.login;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.sample.HomeController;
import zeniware.sample.service.MainService;

@Controller
public class login {
	
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		@Autowired
		private MainService mainService;
		
		@RequestMapping("/login")
		public String login(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
			logger.info("Welcome home! The client locale is {}.", paramMap);
			
			return "/login/login";
		}
		
		@RequestMapping("/main")
		public String main(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
			logger.info("Welcome home! The client locale is {}.", paramMap);
			
			return "/main";
		}
	

}
