package zeniware.community.vo;

import java.io.Serializable;

public class ComtAllListVo implements Serializable {
	private String fcComtId;
	private int fcAdmSeq;				//FC_ADM_SEQ
	private String compId;				//COMP_ID
	private String userId;
	private String userNm;
	private String deptId;				//DEPT_ID
	private String deptNm;
	private int talNum;
	private String typeGubun;
	private String boardInfoId;
	private String mastGubun;		//MAST_GUBUN
	private String taltelGubun;
	private String inviteYn;
	private String joinYn;				// JOIN_YN(가입여부)
	private String regDate;				//REG_DATE
	private String cumtNm;			//CUMT_NM
	private String cumtComment;		//CUMT_COMMENT
	private String admActYn;		//ADM_ACT_YN
	private String openYn;			//OPEN_YN
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
	public int getTalNum() {
		return talNum;
	}
	public void setTalNum(int talNum) {
		this.talNum = talNum;
	}
	public String getTypeGubun() {
		return typeGubun;
	}
	public void setTypeGubun(String typeGubun) {
		this.typeGubun = typeGubun;
	}
	public String getBoardInfoId() {
		return boardInfoId;
	}
	public void setBoardInfoId(String boardInfoId) {
		this.boardInfoId = boardInfoId;
	}
	public String getMastGubun() {
		return mastGubun;
	}
	public void setMastGubun(String mastGubun) {
		this.mastGubun = mastGubun;
	}
	public String getTaltelGubun() {
		return taltelGubun;
	}
	public void setTaltelGubun(String taltelGubun) {
		this.taltelGubun = taltelGubun;
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
}