package zeniware.community.vo;

import java.io.Serializable;

public class ComtMemberVo implements Serializable {
	private String fcComtId;
	private String compId;
	private String userId;
	private String deptId;
	private String typeGubun;
	private int boardInfoId;
	private String mastGubun;
	private String bdOpenYn;
	private String bookmarkYn;
	private String inviteYn;
	private String joinYn;
	private String regDate;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
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