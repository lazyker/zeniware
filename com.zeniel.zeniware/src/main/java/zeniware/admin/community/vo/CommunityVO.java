package zeniware.admin.community.vo;

public class CommunityVO {
	private String adminCode;
	private String compId;
	private int fcAdmSeq;
	private String cumtType;
	private String fileSizeYn;
	private String fileSize;
	private String fileOldSize;
	private String fileAddYn;
	private String fileAddCnt;
	private String fileOldAddCnt;
	private String fileNotName;
	private String regDate;
	private String admUserId;

	public String getCompId() {
		return compId;
	}

	public String getFileOldSize() {
		return fileOldSize;
	}

	public void setFileOldSize(String fileOldSize) {
		this.fileOldSize = fileOldSize;
	}

	public String getFileOldAddCnt() {
		return fileOldAddCnt;
	}

	public void setFileOldAddCnt(String fileOldAddCnt) {
		this.fileOldAddCnt = fileOldAddCnt;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public int getFcAdmSeq() {
		return fcAdmSeq;
	}

	public void setFcAdmSeq(int fcAdmSeq) {
		this.fcAdmSeq = fcAdmSeq;
	}

	public String getCumtType() {
		return cumtType;
	}

	public void setCumtType(String cumtType) {
		this.cumtType = cumtType;
	}

	public String getFileSizeYn() {
		return fileSizeYn;
	}

	public void setFileSizeYn(String fileSizeYn) {
		this.fileSizeYn = fileSizeYn;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileAddYn() {
		return fileAddYn;
	}

	public void setFileAddYn(String fileAddYn) {
		this.fileAddYn = fileAddYn;
	}

	public String getFileAddCnt() {
		return fileAddCnt;
	}

	public void setFileAddCnt(String fileAddCnt) {
		this.fileAddCnt = fileAddCnt;
	}

	public String getFileNotName() {
		return fileNotName;
	}

	public void setFileNotName(String fileNotName) {
		this.fileNotName = fileNotName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getAdmUserId() {
		return admUserId;
	}

	public void setAdmUserId(String admUserId) {
		this.admUserId = admUserId;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
}
