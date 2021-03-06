package zeniware.sample;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zeniware.common.converter.FileVo;
import zeniware.sample.service.MainService;
import zeniware.sample.vo.SampleVo;

@Controller
public class FileController {
	
//	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	private MainService mainService;
	
	@Value("#{globals['file.upload.path']}")
	private String uploadPath;
	
	@RequestMapping(value = "/file.do", method = RequestMethod.GET)
    public ModelAndView fileForm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common/fileForm");
        return mv;
    }
     
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String fileSubmit(SampleVo dto) {
    	
//    	String filePath = uploadPath + "0001" + System.currentTimeMillis();
    	String filePath =  "C:/images/upload/" + "0001/";
    	System.out.println("controll : " + uploadPath);
    	
    	for( FileVo vo :  dto.getFile() ) {
    		
    		try {
				vo.transferFile(filePath, "0001_" + System.currentTimeMillis() + "." + vo.getExt());
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		System.out.println(vo.getFile());
    	}
    	
    	
//        MultipartFile uploadfile = dto.getUploadfile();
//
//        
//        if (uploadfile != null) {
//            String fileName = uploadfile.getOriginalFilename();
//            dto.setFileName(fileName);
//            try {
//                // 1. FileOutputStream 사용
//                // byte[] fileData = file.getBytes();
//                // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
//                // output.write(fileData);
//                 
//                // 2. File 사용
//                File file = new File("C:/images/" + fileName);
//                uploadfile.transferTo(file);
//            } catch (IOException e) {
//                e.printStackTrace();
//            } // try - catch
//        } // if
//        // 데이터 베이스 처리를 현재 위치에서 처리
        return "redirect:getBoardList"; // 리스트 요청으로 보내야하는데 일단 제외하고 구현
    }
	
}
