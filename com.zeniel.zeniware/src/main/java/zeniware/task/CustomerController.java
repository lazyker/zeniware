package zeniware.task;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.common.converter.FileVo;
import zeniware.common.converter.MultipartFileToFileVOConverter;
import zeniware.common.login.MemberInfo;
import zeniware.common.util.DateUtil;
import zeniware.common.util.StreamMapper;
import zeniware.sample.vo.SampleVo;
import zeniware.task.service.CustomerService;
import zeniware.task.vo.CustomerVo;
import zeniware.task.vo.PersonVo;
import zeniware.task.vo.RecordVo;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@Value("#{globals['file.upload.path']}")
	private String uploadPath;
	
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
	
	@RequestMapping("/task/getRecordList")
	public void getRecordList(@RequestParam Map<String, Object> paramMap, HttpServletResponse response, Authentication authentication)  throws IOException {
		
		ArrayList<RecordVo> list = customerService.getRecordList(paramMap);
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		map.put("data", list);
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(map);
		OutputStream out =  response.getOutputStream();
		
		out.write(jsonString.getBytes());
	}
	
	@RequestMapping("/task/modal/recordModal")
	public String recordModal(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
		
		if (paramMap.get("recSeq") != null) {
			ArrayList<RecordVo> list = customerService.getRecordList(paramMap);
			RecordVo vo = list.get(0);
			
			model.put("recordVo", vo);
		}
		
		model.put("param", paramMap);
		
		return "/task/modal/recordModal";
	}
	
	@RequestMapping("/task/modal/setRecord")
	public void setRecord(@ModelAttribute RecordVo paramVo, HttpServletResponse response, ModelMap model, Authentication authentication) throws Throwable {
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		String userId = memberInfo.getUserId();
		String compId = memberInfo.getCompId();
		String deptId = memberInfo.getDeptId();
		
		if ("".equals(paramVo.getUserId())) {
			paramVo.setUserId(userId);
		}
		
		for (FileVo vo : paramVo.getFile()) {
			String filePath = vo.getFilePath() + compId;
			
			//파일 생성
			vo.transferFile(filePath, vo.getStoredFileName() + "." + vo.getExt());
			
//			vo.setStoredFileName(storedFileName);
			vo.setUnitCd("FT");
			vo.setRegUserId(userId);
			vo.setRegUserCompId(compId);
			vo.setRegUserDeptId(deptId);
			paramVo.setFileId(vo.getFileId());
			
			customerService.setFile(vo);
		}
		
		customerService.setRecord(paramVo);
		
		StreamMapper.writeValue(response, "");
	}
	
	@RequestMapping("/task/modal/modRecord")
	public String modRecord(@ModelAttribute RecordVo paramVo, ModelMap model) throws Throwable {
		
		customerService.modRecord(paramVo);
		
		return "redirect:/task/customerMain";
	}
	
	@RequestMapping("/task/modal/delRecord")
	public String delRecord(@ModelAttribute RecordVo paramVo, ModelMap model) throws Throwable {
		
		customerService.delRecord(paramVo);
		
		return "redirect:/task/customerMain";
	}



	@RequestMapping("/task/getPersonList")
	public void getPersonList(@RequestParam Map<String, Object> paramMap, HttpServletResponse response, Authentication authentication)  throws IOException {
		
		ArrayList<PersonVo> list = customerService.getPersonList(paramMap);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("data", list);
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(map);
		OutputStream out =  response.getOutputStream();
		
		out.write(jsonString.getBytes());
	}
	
	@RequestMapping("/task/modal/personModal")
	public String personModal(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
		
		if (paramMap.get("personSeq") != null) {
			ArrayList<PersonVo> list = customerService.getPersonList(paramMap);
			PersonVo vo = list.get(0);
			
			model.put("personVo", vo);
		}
		
		model.put("param", paramMap);
		
		return "/task/modal/personModal";
	}
	
	@RequestMapping("/task/modal/setPerson")
	public void setPerson(@ModelAttribute PersonVo paramVo, HttpServletResponse response, ModelMap model, Authentication authentication) throws Throwable {
		
		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
		
		if ("".equals(paramVo.getUserId())) {
			paramVo.setUserId(memberInfo.getUserId());
		}
		
		customerService.setPerson(paramVo);
		
		StreamMapper.writeValue(response, "");
	}
	
	@RequestMapping("/task/modal/modPerson")
	public String modPerson(@ModelAttribute PersonVo paramVo, ModelMap model) throws Throwable {
		
		customerService.modPerson(paramVo);
		
		return "redirect:/task/customerMain";
	}
	
	@RequestMapping("/task/modal/delPerson")
	public String delPerson(@ModelAttribute PersonVo paramVo, ModelMap model) throws Throwable {
		
		customerService.delPerson(paramVo);
		
		return "redirect:/task/customerMain";
	}
}
