package zeniware.schedule.vo;

import java.io.Serializable;


public class ScheduleVo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cldrId;
	private String schedId;
	private String schedNm;
	private String startYmd;
	private String endYmd;
	private String regDate;
	private String modDate;
	private String fstFrmigrId;
	private String lstModrId;
	private String startTm;
	private String endTm;
	private String rpetYn;
	private String rpetEndYmd;
	private String rpetType;
	private int rpetCyc;
	private String apntPlc;
	private String memoCont;
	
	private String title;
	private String start;
	private String end;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getCldrId() {
		return cldrId;
	}
	public void setCldrId(String cldrId) {
		this.cldrId = cldrId;
	}
	public String getSchedId() {
		return schedId;
	}
	public void setSchedId(String schedId) {
		this.schedId = schedId;
	}
	public String getSchedNm() {
		return schedNm;
	}
	public void setSchedNm(String schedNm) {
		this.schedNm = schedNm;
	}
	public String getStartYmd() {
		return startYmd;
	}
	public void setStartYmd(String startYmd) {
		this.startYmd = startYmd;
	}
	public String getEndYmd() {
		return endYmd;
	}
	public void setEndYmd(String endYmd) {
		this.endYmd = endYmd;
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
	public String getFstFrmigrId() {
		return fstFrmigrId;
	}
	public void setFstFrmigrId(String fstFrmigrId) {
		this.fstFrmigrId = fstFrmigrId;
	}
	public String getLstModrId() {
		return lstModrId;
	}
	public void setLstModrId(String lstModrId) {
		this.lstModrId = lstModrId;
	}
	public String getStartTm() {
		return startTm;
	}
	public void setStartTm(String startTm) {
		this.startTm = startTm;
	}
	public String getEndTm() {
		return endTm;
	}
	public void setEndTm(String endTm) {
		this.endTm = endTm;
	}
	public String getRpetYn() {
		return rpetYn;
	}
	public void setRpetYn(String rpetYn) {
		this.rpetYn = rpetYn;
	}
	public String getRpetEndYmd() {
		return rpetEndYmd;
	}
	public void setRpetEndYmd(String rpetEndYmd) {
		this.rpetEndYmd = rpetEndYmd;
	}
	public String getRpetType() {
		return rpetType;
	}
	public void setRpetType(String rpetType) {
		this.rpetType = rpetType;
	}
	public int getRpetCyc() {
		return rpetCyc;
	}
	public void setRpetCyc(int rpetCyc) {
		this.rpetCyc = rpetCyc;
	}
	public String getApntPlc() {
		return apntPlc;
	}
	public void setApntPlc(String apntPlc) {
		this.apntPlc = apntPlc;
	}
	public String getMemoCont() {
		return memoCont;
	}
	public void setMemoCont(String memoCont) {
		this.memoCont = memoCont;
	}
	
}
