package zeniware.task;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.login.MemberInfo;
import zeniware.task.service.CustomerService;
import zeniware.task.vo.CustomerVo;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/task/customerMain")
	public String customerMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
		return "/taskLayout/task/customer/customerMain";	
	}
	
	@RequestMapping("/task/getCustomerList")
	public void getCustomerList(@RequestParam Map<String, Object> paramMap, HttpServletResponse response, Authentication authentication)  throws IOException {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		if (null == paramMap.get("userId") || null == paramMap.get("compId")) {
			paramMap.put("userId", memberInfo.getUserId());
			paramMap.put("compId", memberInfo.getCompId());
		}
		
		ArrayList<CustomerVo> list = customerService.getCustomerList(paramMap);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("data", list);
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(map);
		OutputStream out =  response.getOutputStream();
		
		out.write(jsonString.getBytes());
		
	}
	
	@RequestMapping("/task/customerEdit")
	public String customerEdit(@RequestParam Map<String, Object> paramMap, ModelMap model, Authentication authentication) throws Throwable {
		
		if (null != paramMap.get("custSeq")) {
			MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
			
			paramMap.put("userId", memberInfo.getUserId());
			paramMap.put("compId", memberInfo.getCompId());
			
			ArrayList<CustomerVo> list = customerService.getCustomerList(paramMap);
			CustomerVo vo = list.get(0);
			
			model.put("modState", paramMap.get("modState"));
			model.put("custVo", vo);
		}
		
		return "/taskLayout/task/customer/customerEdit";
	}
	
	@RequestMapping("/task/setCustomer")
	public String setCustomer(@ModelAttribute CustomerVo paramVo, ModelMap model, Authentication authentication) throws Throwable {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		if ("".equals(paramVo.getUserId()) || "".equals(paramVo.getCompId())) {
			paramVo.setUserId(memberInfo.getUserId());
			paramVo.setCompId(memberInfo.getCompId());
		}
		
		customerService.setCustomer(paramVo);
		
		return "redirect:/task/customerMain";
	}
	
	@RequestMapping("/task/modCustomer")
	public String modCustomer(@ModelAttribute CustomerVo paramVo, ModelMap model) throws Throwable {
		
		customerService.modCustomer(paramVo);
		
		return "redirect:/task/customerMain";
	}
	
	@RequestMapping("/task/delCustomer")
	public String delCustomer(@ModelAttribute CustomerVo paramVo, ModelMap model) throws Throwable {
		
		customerService.delCustomer(paramVo);
		
		return "redirect:/task/customerMain";
	}
	
	@RequestMapping("/task/modal/recordModal")
	public String recordModal(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
		
		paramMap.put("status", "new");
		
		return "/task/modal/recordModal";
	}
	
}
