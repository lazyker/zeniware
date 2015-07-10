package zeniware.admin.codeman;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zeniware.admin.codeman.service.CodeManService;
import zeniware.admin.codeman.vo.CommonCode;
import zeniware.admin.codeman.vo.CommonGroup;

@Controller
public class CodeManController {
  
  @Autowired
  CodeManService codemanService;

  @RequestMapping("/admin/preference/codeMain")
  public String redirectCodeMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/adminLayout/preference/codeMain";
  }
  
  @RequestMapping("/admin/preference/codeMainFlat")
  public String redirectCodeMainFlat(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    return "/adminLayout/preference/codeMainFlat";
  }
  
  @RequestMapping(value="/admin/preference/newCode", method=RequestMethod.GET)
  public String setSingleCodeForm(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

    CommonCode commonCode = null;
    
    try {
      commonCode = (paramMap.isEmpty()) ? this.codeMaker() : this.codeMaker(paramMap);

      model.put("commonCode", commonCode);
      System.out.println(paramMap.size());
      
    } catch (Exception e) {
      throw e;
    }

    return "/adminLayout/preference/newCode";
  }
  
  @RequestMapping(value="/admin/preference/newCode", method=RequestMethod.POST)
  public String setSingleCodeSubmit(@ModelAttribute CommonCode commonCode) throws Throwable {

    codemanService.setSingleCode(commonCode);
    
    return "redirect:/admin/preference/codeMain";
  }
  
  @RequestMapping(value="/admin/preference/deleteCodelist")
  public String deleteCodelist(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {
    
    String[] strParam = ((String)paramMap.get("codelist")).split(",");
    
    for (String str : strParam) {
      String[] strSplit = str.split(":");
      Map<String, Object> curParam = new HashMap<String, Object>();
      curParam.put("groupId", strSplit[0]);
      curParam.put("codeId", strSplit[1]);
      
      codemanService.delSingleCode(curParam);
    }
    
    return "redirect:/admin/preference/codeMain";
  }
  
  @RequestMapping("/admin/ajax/getGrouplist")
  public void getGroupList(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws IOException {
    
    try {
      List<CommonGroup> list = codemanService.getGroupList(paramMap);
      
      ObjectMapper mapper = new ObjectMapper();
      response.setContentType("application/json");
      mapper.writeValue(response.getOutputStream(), list);
      
    } catch (Exception e) {
      throw e;
    }
  }
  
  @RequestMapping("/admin/ajax/getCodelist")
  public void getCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws IOException {
    
    List<CommonCode> list = codemanService.getCodeList(paramMap);
    
    ObjectMapper mapper = new ObjectMapper();
    response.setContentType("application/json");
    mapper.writeValue(response.getOutputStream(), list);
    
//    try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"))) {
//      List<CommonCode> list = codemanService.getCodeList(paramMap);
//      ObjectMapper mapper = new ObjectMapper();
//      bw.write(mapper.writeValueAsString(list));
//    }
  }
  
  @RequestMapping("/admin/ajax/deleteCodelist")
  public void deleteCodelist(@RequestParam Map<String, Object> paramMap, 
    HttpServletRequest request, HttpServletResponse response) throws IOException {
    
    ObjectMapper mapper = new ObjectMapper();
    String str = mapper.writeValueAsString(paramMap);
    
    try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"))) {
      bw.write("Response Text...");
    }
    
//    int cnt = 0;
//    String[] strParam = ((String)paramMap.get("codelist")).split(",");
//    
//    for (String str : strParam) {
//      String[] strSplit = str.split(":");
//      Map<String, Object> curParam = new HashMap<String, Object>();
//      curParam.put("groupId", strSplit[0]);
//      curParam.put("codeId", strSplit[1]);
//      
//      cnt += codemanService.delSingleCode(curParam);
//    }
//   
//    OutputStream os = response.getOutputStream();
//    os.write(cnt);
  }
  
  private CommonCode codeMaker() {
    
    return new CommonCode(0, true);
  }
  
  private CommonCode codeMaker(Map<String, Object> paramMap) {
    
    CommonCode obj = codemanService.getSingleCode(paramMap);
    
    CommonCode commonCode = new CommonCode();
    
    commonCode.setGroupId(obj.getGroupId());
    commonCode.setCodeId(obj.getCodeId());
    commonCode.setCodeNameKo(obj.getCodeNameKo());
    commonCode.setCodeNameEn(obj.getCodeNameEn());
    commonCode.setCodeNameCn(obj.getCodeNameCn());
    commonCode.setCodeNameJp(obj.getCodeNameJp());
    commonCode.setSortOrder(obj.getSortOrder());
    commonCode.setUseYn(obj.getUseYn());
    commonCode.setDescription(obj.getDescription());
    
    return commonCode;
  }
  
}