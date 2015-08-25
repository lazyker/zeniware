package zeniware.common.util;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

public class StreamMapper {

  public static void writeValue(HttpServletResponse response, Object value) throws Throwable {
    
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      response.setContentType("application/json");
      objectMapper.writeValue(response.getOutputStream(), value);

    } catch (Exception e) { throw e; }
  }

}
