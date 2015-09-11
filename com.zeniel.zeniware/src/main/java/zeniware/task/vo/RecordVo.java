package zeniware.task.vo;

import java.util.ArrayList;

import zeniware.common.converter.FileVo;


public class RecordVo {
	
	private int recSeq;						//업무기록 번호
	private int custSeq;					//고객사 번호
	private String recYmd;					//작성일
	private String recCont;					//업무내용
	private String userId;					//작성자 아이디
	private String userNm;					//작성자 이름
	private String fileId;						//첨부파일
	private String regDate;					//등록일시		
	private String modDate;				//수정일시
	private ArrayList<FileVo> file;		// 업로드한 파일 정보
	private String originalFileName;
	private int fileSize; 
	
	
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public ArrayList<FileVo> getFile() {
		return file;
	}
	public void setFile(ArrayList<FileVo> file) {
		this.file = file;
	}
	public int getRecSeq() {
		return recSeq;
	}
	public void setRecSeq(int recSeq) {
		this.recSeq = recSeq;
	}
	public int getCustSeq() {
		return custSeq;
	}
	public void setCustSeq(int custSeq) {
		this.custSeq = custSeq;
	}
	public String getRecYmd() {
		return recYmd;
	}
	public void setRecYmd(String recYmd) {
		this.recYmd = recYmd;
	}
	public String getRecCont() {
		return recCont;
	}
	public void setRecCont(String recCont) {
		this.recCont = recCont;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	
}
