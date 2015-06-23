package zeniware.common;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TilesTestController {

	private static final Logger logger = LoggerFactory.getLogger(TilesTestController.class);
	
	@RequestMapping(value = "/test")
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getTest(@RequestParam Map<String, Object>paramMap, ModelMap model) {
		logger.info("Welcome Tiles! The client locale is {}.", paramMap);
		return "/mainLayout/main_test";
	}

	@RequestMapping(value = "/test2")
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getTest2(@RequestParam Map<String, Object>paramMap, ModelMap model) {
		logger.info("Welcome Tiles! The client locale is {}.", paramMap);
		return "/subtype/main_test2";
	}

	@RequestMapping(value = "/test3")
	public String getTest3(@RequestParam Map<String, Object>paramMap, ModelMap model) {
		logger.info("Welcome Tiles! The client locale is {}.", paramMap);
		return "/mainNoType/main_test2";
	}

	@RequestMapping(value = "/test4")
	public String getTest4(@RequestParam Map<String, Object>paramMap, ModelMap model) {
		logger.info("Welcome Tiles! The client locale is {}.", paramMap);
		return "/subInTitle/sub_test";
	}

	@RequestMapping(value = "/test5")
	public String getTest5(@RequestParam Map<String, Object>paramMap, ModelMap model) {
		logger.info("Welcome Tiles! The client locale is {}.", paramMap);
		return "/subInMenu/sub_order/sub_test";
	}
}