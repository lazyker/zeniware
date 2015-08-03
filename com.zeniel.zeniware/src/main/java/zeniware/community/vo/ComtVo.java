package zeniware.community.vo;

import java.io.Serializable;

public class ComtVo implements Serializable {
	private String fcComtId;		//FC_COMT_ID
	private int fcAdmSeq;			//FC_ADM_SEQ
	private String compId;			//COMP_ID
	private String deptId;			//DEPT_ID
	private String cumtNm;			//CUMT_NM
	private String cumtComment;		//CUMT_COMMENT
	private String admActYn;		//ADM_ACT_YN
	private String openYn;			//OPEN_YN
	private String regDate;			//REG_DATE
	private String modDate;			//MOD_DATE
	private String regUserId;		//REG_USER_ID
	private String modUserId;		//MOD_USER_ID
	private String mastGubun;		//MAST_GUBUN
	private int boardInfoId;		// BOARD_INFO_ID
	private String typeGubun;		// TYPE_GUBUN
	private String joinYn;			// JOIN_YN
	private int talNumCnt;			//TOTAL_NUMBER_CNT(가입총인원)
	private String userNm;			//USER_NAME
	public String getFcComtId() {
		return fcComtId;
	}
	public void setFcComtId(String fcComtId) {
		this.fcComtId = fcComtId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
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
	public String getMastGubun() {
		return mastGubun;
	}
	public void setMastGubun(String mastGubun) {
		this.mastGubun = mastGubun;
	}
	public int getBoardInfoId() {
		return boardInfoId;
	}
	public void setBoardInfoId(int boardInfoId) {
		this.boardInfoId = boardInfoId;
	}
	public String getTypeGubun() {
		return typeGubun;
	}
	public void setTypeGubun(String typeGubun) {
		this.typeGubun = typeGubun;
	}
	public String getJoinYn() {
		return joinYn;
	}
	public void setJoinYn(String joinYn) {
		this.joinYn = joinYn;
	}
	public int getTalNumCnt() {
		return talNumCnt;
	}
	public void setTalNumCnt(int talNumCnt) {
		this.talNumCnt = talNumCnt;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
}