package zeniware.community.vo;

import java.io.Serializable;

public class ComtBoardVo implements Serializable {
	private String fcComtId;				//FC_COMT_ID
	private String fcComtNm;				//커뮤니티명
	private String fcFullComtBdTitle;	//커뮤니티 풀(커뮤니티명 + 게시판명)
	private String fcBoardTitle;			//커뮤니티 게시판 명
	private int boardSeq;
	private int boardInfoId;
	private String compId;
	private String userId;
	private String userNm;
	private String deptId;
	private String deptNm;
	private String fcBoardType;
	private String title;
	private String contents;
	private String fileYn;
	private String openYn;
	private String mainTop;
	private String memberView;
	private String regDate;
	private String modDate;
	private int totalCnt;

	public String getFcComtId() {
		return fcComtId;
	}
	public void setFcComtId(String fcComtId) {
		this.fcComtId = fcComtId;
	}
	public String getFcComtNm() {
		return fcComtNm;
	}
	public void setFcComtNm(String fcComtNm) {
		this.fcComtNm = fcComtNm;
	}
	public String getFcFullComtBdTitle() {
		return fcFullComtBdTitle;
	}
	public void setFcFullComtBdTitle(String fcFullComtBdTitle) {
		this.fcFullComtBdTitle = fcFullComtBdTitle;
	}
	public String getFcBoardTitle() {
		return fcBoardTitle;
	}
	public void setFcBoardTitle(String fcBoardTitle) {
		this.fcBoardTitle = fcBoardTitle;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getBoardInfoId() {
		return boardInfoId;
	}
	public void setBoardInfoId(int boardInfoId) {
		this.boardInfoId = boardInfoId;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
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
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getFcBoardType() {
		return fcBoardType;
	}
	public void setFcBoardType(String fcBoardType) {
		this.fcBoardType = fcBoardType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public String getMainTop() {
		return mainTop;
	}
	public void setMainTop(String mainTop) {
		this.mainTop = mainTop;
	}
	public String getMemberView() {
		return memberView;
	}
	public void setMemberView(String memberView) {
		this.memberView = memberView;
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
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
}