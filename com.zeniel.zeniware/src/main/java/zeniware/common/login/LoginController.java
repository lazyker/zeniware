package zeniware.common.login;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.sample.service.MainService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
		return "/signin/login";
	}
	
	/**
	 *  로그인 인증 단계
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param authentication
	 * @throws IOException
	 */
	@RequestMapping(value = "/loginProcess")
	public void loginSuccess(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response,
			 Authentication authentication) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
//		HttpSession session = request.getSession();
//		Enumeration attributeNames = session.getAttributeNames();
//		MemberInfo memberInfo = (MemberInfo) authentication.getPrincipal();
//		
//		session.setAttribute("compId", memberInfo.getCompId());
//		System.out.println(memberInfo.getCompId());
		
		if("fail".equals(paramMap.get("success")))  
		{ //로그인 실패 시
			
			map.put("accessGranted", false);
			map.put("errors", "ID 또는 PASSWORD가 일치하지 않습니다.");
		}
		else  
		{ //로그인 성공 시
			
			MemberInfo userInfo = (MemberInfo) authentication.getPrincipal();
			
			map.put("accessGranted", true);
		}
		
//		response.setContentType("text/plain; charset=UTF-8"); //데이터 타입 설정
//		response.setContentType("application/json");
//		response.setCharacterEncoding("utf-8");
//
//        String data = StringUtils.join(new String[] {
//             " { \"response\" : {",
//             " \"error\" : false , ",
//             " \"message\" : \"로그인하였습니다.\" ",
//             "} } "
//        });
//        
//        PrintWriter out = response.getWriter();
//        out.print(data);
//        out.flush();
//        out.close();
		
		ObjectMapper om = new ObjectMapper();
		
		String jsonString = om.writeValueAsString(map);
		
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
		
	}
	
	@RequestMapping(value = "/main")
	public String main(@RequestParam Map<String, Object> paramMap, ModelMap model, Principal principal) throws Throwable{
//		logger.debug("login success.", principal);
		
//			System.out.println(principal.getName()); //id 가져온다
		
		return "/mainLayout/main";
	}
	
	@RequestMapping(value = "/logoutSuccess")
	public String logout(HttpSession session,HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) {
		
		session.invalidate();
		
		return "/signin/login";
	}
	
	/**
	 * 로그인 하기 전의 요청했던 URL을 알아낸다.
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) {
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if (savedRequest == null) {
			return request.getSession().getServletContext().getContextPath();
		}
		return savedRequest.getRedirectUrl();
	
	}

}
