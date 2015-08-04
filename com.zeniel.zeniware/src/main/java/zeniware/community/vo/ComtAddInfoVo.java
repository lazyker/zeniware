package zeniware.community.vo;

import java.io.Serializable;

public class ComtAddInfoVo implements Serializable {
	private String fcComtId;		//FC_COMT_ID
	private String compId;			//COMP_ID
	private String deptId;			//DEPT_ID
	private String userId;			//USER_ID
	private String typeGubun;		//TYPE_GUBUN(커뮤니ㄷ티,게시판 구분-C : 커뮤니티,B : 게시판)
	private int boardInfoId;		//BOARD_INFO_ID(커뮤니티 게시판 기본 생성 ID)
	private String mastGubun;		//MAST_GUBUN(M : 마스터,B : 부마스터,	U : 일반)
	private String bdOpenYn;		//BD_OPEN_YN(비공개글 보기)
	private String bookmarkYn;		//BOOKMARK_YN(즐겨찾기)
	private String inviteYn;		//INVITE_YN(초대여부 - 10: 초대,20: 미 초대,30 : 일반가입,40 : 가입요청)
	private String joinYn;			//JOIN_YN(가입승인 여부)
	private String regDate;			//REG_DATE
	public String getFcComtId() {
		return fcComtId;
	}
	public void setFcComtId(String fcComtId) {
		this.fcComtId = fcComtId;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTypeGubun() {
		return typeGubun;
	}
	public void setTypeGubun(String typeGubun) {
		this.typeGubun = typeGubun;
	}
	public int getBoardInfoId() {
		return boardInfoId;
	}
	public void setBoardInfoId(int boardInfoId) {
		this.boardInfoId = boardInfoId;
	}
	public String getMastGubun() {
		return mastGubun;
	}
	public void setMastGubun(String mastGubun) {
		this.mastGubun = mastGubun;
	}
	public String getBdOpenYn() {
		return bdOpenYn;
	}
	public void setBdOpenYn(String bdOpenYn) {
		this.bdOpenYn = bdOpenYn;
	}
	public String getBookmarkYn() {
		return bookmarkYn;
	}
	public void setBookmarkYn(String bookmarkYn) {
		this.bookmarkYn = bookmarkYn;
	}
	public String getInviteYn() {
		return inviteYn;
	}
	public void setInviteYn(String inviteYn) {
		this.inviteYn = inviteYn;
	}
	public String getJoinYn() {
		return joinYn;
	}
	public void setJoinYn(String joinYn) {
		this.joinYn = joinYn;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}