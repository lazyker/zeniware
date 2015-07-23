package zeniware.community.vo;

import java.io.Serializable;

public class ComtVo implements Serializable {
	private int fcBoardId;			//FC_BOARD_ID
	private int fcAdmSeq;			//FC_ADM_SEQ
	private String compId;			//COMP_ID
	private String cumtNm;			//CUMT_NM
	private String cumtComent;		//CUMT_COMMENT
	private String admOpenYn;		//ADM_OPEN_YN
	private String openYn;			//OPEN_YN
	private String regDate;			//REG_DATE
	private String modDate;			//MOD_DATE
	private String regUserId;		//REG_USER_ID
	private String modUserId;		//MOD_USER_ID
	public int getFcBoardId() {
		return fcBoardId;
	}
	public void setFcBoardId(int fcBoardId) {
		this.fcBoardId = fcBoardId;
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
	public String getCumtComent() {
		return cumtComent;
	}
	public void setCumtComent(String cumtComent) {
		this.cumtComent = cumtComent;
	}
	public String getAdmOpenYn() {
		return admOpenYn;
	}
	public void setAdmOpenYn(String admOpenYn) {
		this.admOpenYn = admOpenYn;
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
}