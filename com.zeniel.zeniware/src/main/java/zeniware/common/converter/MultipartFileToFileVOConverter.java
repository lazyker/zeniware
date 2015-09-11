package zeniware.common.converter;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.convert.converter.Converter;
import org.springframework.web.multipart.MultipartFile;

public class MultipartFileToFileVOConverter implements Converter<MultipartFile, FileVo> {
	
//	@Value("#{globals['file.upload.path']}")	//서버 
	@Value("#{globals['local.file.upload.path']}")	//로컬
	private String uploadPath;
	
	@Override
	public FileVo convert(MultipartFile source) {
		
		FileVo result = null;
		
		if(source == null) {
				result = null;
		}
		else{
			if(source.isEmpty()) {
				result = null;
			}
			else{
				result = new FileVo();
				String orgFileName = source.getOriginalFilename();
				String id = UUID.randomUUID().toString();
				
				result.setFileId(id);
				result.setOriginalFileName(orgFileName);	// 원본 파일 이름 설정
				result.setStoredFileName("_" + System.currentTimeMillis());
				result.setMultipartFile(source);				// 업로드된 파일의 MultipartFile 객체 설정
				result.setFileSize(source.getSize());		// 업로드된 파일의 크기 설정
				result.setFilePath(uploadPath);			// 파일 기본 경로
				
				//확장자를 구하는 작업을 진행한다.
				int idx = orgFileName.lastIndexOf(".");
				if(idx == -1) {
					result.setExt(null);	//확장자가 없을 경우
				}
				else {
					String ext = orgFileName.substring(idx+1);	//확장자가 있을경우
					result.setExt(ext);
				}
				
			}
		}
		
		return result;
	}
}
