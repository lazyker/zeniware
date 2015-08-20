package zeniware.admin.community.vo;

import java.io.Serializable;

public class ComtInfoVO implements Serializable {
	private String fcComtId;			//FC_COMT_ID
	private int fcAdmSeq;			//FC_ADM_SEQ
	private String compId;			//COMP_ID
	private String cumtNm;			//CUMT_NM
	private String cumtComment;		//CUMT_COMMENT
	private String admActYn;		//ADM_ACT_YN
	private String openYn;			//OPEN_YN
	private String regDate;			//REG_DATE
	private String modDate;			//MOD_DATE
	private String regUserId;		//REG_USER_ID
	private String modUserId;		//MOD_USER_ID
	private String fcBoardId;
	public String getFcComtId() {
		return fcComtId;
	}
	public void setFcComtId(String fcComtId) {
		this.fcComtId = fcComtId;
	}
	public int getFcAdmSeq() {
		return fcAdmSeq;
	}
	public void setFcAdmSeq(int fcAdmSeq) {
		this.fcAdmSeq = fcAdmSeq;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getCumtNm() {
		return cumtNm;
	}
	public void setCumtNm(String cumtNm) {
		this.cumtNm = cumtNm;
	}
	public String getCumtComment() {
		return cumtComment;
	}
	public void setCumtComment(String cumtComment) {
		this.cumtComment = cumtComment;
	}
	public String getAdmActYn() {
		return admActYn;
	}
	public void setAdmActYn(String admActYn) {
		this.admActYn = admActYn;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
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
	public String getRegUserId() {
		return regUserId;
	}
	public void setRegUserId(String regUserId) {
		this.regUserId = regUserId;
	}
	public String getModUserId() {
		return modUserId;
	}
	public void setModUserId(String modUserId) {
		this.modUserId = modUserId;
	}
	public String getFcBoardId() {
		return fcBoardId;
	}
	public void setFcBoardId(String fcBoardId) {
		this.fcBoardId = fcBoardId;
	}
}