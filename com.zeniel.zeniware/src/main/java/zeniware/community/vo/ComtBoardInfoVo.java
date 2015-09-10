package zeniware.community.vo;

import java.io.Serializable;

public class ComtBoardInfoVo implements Serializable {
	private String fcComtId;
	private int boardInfoId;
	private String compId;
	private String fcBoardTitle;
	private String fcBoardType;
	private String fcBoardHeadYn;
	private String fcBoardAdmYn;
	private String fcBoardOpenYn;
	private String fcBoardComtYn;
	private String bookmark;
	private String lineGubun;
	private int sortInt;
	private int useYn;
	private String regDate;
	private String regUserId;
	private String modDate;
	private String modUserId;
	public String getFcComtId() {
		return fcComtId;
	}
	public void setFcComtId(String fcComtId) {
		this.fcComtId = fcComtId;
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
	public String getFcBoardTitle() {
		return fcBoardTitle;
	}
	public void setFcBoardTitle(String fcBoardTitle) {
		this.fcBoardTitle = fcBoardTitle;
	}
	public String getFcBoardType() {
		return fcBoardType;
	}
	public void setFcBoardType(String fcBoardType) {
		this.fcBoardType = fcBoardType;
	}
	public String getFcBoardHeadYn() {
		return fcBoardHeadYn;
	}
	public void setFcBoardHeadYn(String fcBoardHeadYn) {
		this.fcBoardHeadYn = fcBoardHeadYn;
	}
	public String getFcBoardAdmYn() {
		return fcBoardAdmYn;
	}
	public void setFcBoardAdmYn(String fcBoardAdmYn) {
		this.fcBoardAdmYn = fcBoardAdmYn;
	}
	public String getFcBoardOpenYn() {
		return fcBoardOpenYn;
	}
	public void setFcBoardOpenYn(String fcBoardOpenYn) {
		this.fcBoardOpenYn = fcBoardOpenYn;
	}
	public String getFcBoardComtYn() {
		return fcBoardComtYn;
	}
	public void setFcBoardComtYn(String fcBoardComtYn) {
		this.fcBoardComtYn = fcBoardComtYn;
	}
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	public String getLineGubun() {
		return lineGubun;
	}
	public void setLineGubun(String lineGubun) {
		this.lineGubun = lineGubun;
	}
	public int getSortInt() {
		return sortInt;
	}
	public void setSortInt(int sortInt) {
		this.sortInt = sortInt;
	}
	public int getUseYn() {
		return useYn;
	}
	public void setUseYn(int useYn) {
		this.useYn = useYn;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegUserId() {
		return regUserId;
	}
	public void setRegUserId(String regUserId) {
		this.regUserId = regUserId;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getModUserId() {
		return modUserId;
	}
	public void setModUserId(String modUserId) {
		this.modUserId = modUserId;
	}
}