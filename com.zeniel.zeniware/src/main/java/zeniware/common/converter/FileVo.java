package zeniware.common.converter;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	
	private String fileId;
	private String originalFileName;			// 원래 파일명(업로드 될 당시의 파일명)
	private String storedFileName;			// 실제 파일명(실제로 저장된 파일명)
	private String unitCd;						// 단위업무코드
	private String ext; 							// 업로드 된 파일의 확장자
	private File file;								// MultipartFile이 실제 Java File로 저장된 파일
	private MultipartFile multipartFile;		// 사용자가 업로드한 MultipartFile
	private long fileSize;						// 업로드된 파일 크기
	private String filePath;						// 경로
	private String regUserId;					// 파일생성자 ID
	private String regUserDeptId;			// 파일생성자 부서ID
	private String regUserCompId;			// 파일생성자 회사ID
	private String delGb;						// 삭제여부
	
	
	public String getUnitCd() {
		return unitCd;
	}
	public void setUnitCd(String unitCd) {
		this.unitCd = unitCd;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
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
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRegUserId() {
		return regUserId;
	}
	public void setRegUserId(String regUserId) {
		this.regUserId = regUserId;
	}
	public String getRegUserDeptId() {
		return regUserDeptId;
	}
	public void setRegUserDeptId(String regUserDeptId) {
		this.regUserDeptId = regUserDeptId;
	}
	public String getRegUserCompId() {
		return regUserCompId;
	}
	public void setRegUserCompId(String regUserCompId) {
		this.regUserCompId = regUserCompId;
	}
	public String getDelGb() {
		return delGb;
	}
	public void setDelGb(String delGb) {
		this.delGb = delGb;
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
