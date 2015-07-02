package zeniware.admin.preference;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PreferenceController {
  
  @Autowired
  PreferenceService preferenceService;

  @RequestMapping("/admin/preference/default")
  public String getPreferenceAdmDefault(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable{
    
    return "/adminLayout/preference/default";
  }
  
  @RequestMapping("/admin/preference/ajax")
  public void getAjaxResponse(@RequestParam Map<String, Object> paramMap, 
      HttpServletRequest request, HttpServletResponse response) throws IOException {
    
    OutputStream os = null;
    OutputStreamWriter osw = null;
    BufferedWriter bw = null;
    
    List<CommonCode> list = preferenceService.getCommonCodes();
    ObjectMapper mapper = new ObjectMapper();
    String sJson = "{\"data\":" + mapper.writeValueAsString(list) + "}";
    
    try {
      os = response.getOutputStream();
      osw = new OutputStreamWriter(os, "UTF-8");
      bw = new BufferedWriter(osw);
      bw.write(sJson);
      
    } finally {
      if (bw != null) bw.close();
      if (osw != null) osw.close();
      if (os != null) os.close();
    }
  }
  
}