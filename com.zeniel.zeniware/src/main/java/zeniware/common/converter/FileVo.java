package zeniware.common.converter;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	
	private String fileId;
	private String orgFileName;				// 원래 파일명(업로드 될 당시의 파일명)
	private String realFileName;			// 실제 파일명(실제로 저장된 파일명)
	private String ext; 					// 업로드 된 파일의 확장자
	private File file;						// MultipartFile이 실제 Java File로 저장된 파일
	private MultipartFile multipartFile;	// 사용자가 업로드한 MultipartFile
	private long fileSize;					// 업로드된 파일 크기
	private String userId;
	
	
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrgFileName() {
		return orgFileName;
	}
	
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	
	public String getRealFileName() {
		return realFileName;
	}
	
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	
	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public File getFile() {
		return file;
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	/**
	 * 저장될 파일 경로를 입력받아 사용자가 업로드한 파일을 해당 경로에 저장한다
	 * @param filePath					저장될 파일 경로
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void transferFile(String filePath, String fileName) throws IllegalStateException, IOException{
		file = new File(filePath, fileName);
		System.out.println("file.isDirectory() : " + file.isDirectory());
		if(!file.isDirectory()) {
			file.mkdirs();
		}
		
		multipartFile.transferTo(file);
	}
	
}
