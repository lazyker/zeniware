package zeniware.sample;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.sample.service.MainService;
import zeniware.sample.vo.Employee;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("today")
	public String today(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
		logger.info("Welcome home! The client locale is {}.", paramMap);
		
		 //sql 호출
		String today = mainService.getToday();
		
		 //프로시저 호출
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("acctID", 1);
		
		String name = mainService.getEmpInfo(map);
		
		Employee vo = new Employee();
		vo.setId(2);
		vo = mainService.getEmpInfoMap(vo);
		
		model.put("today", today);
		model.put("name", name);
		
		return "home";
	}
}
