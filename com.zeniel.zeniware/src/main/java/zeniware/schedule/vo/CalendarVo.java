package zeniware.schedule.vo;

import java.util.List;


public class CalendarVo {
	
	private String cldrId;					//캘린더 아이디
	private String cldrNm;					//캘린더 이름
	private String cldrColorVal;			//갤린더 색상(RGB);
	private String compId;					//회사 아이디
	private String userId;					//사용자 아이디
	private String closeYn;					//비공개 여부
	private String shreYn;					//공유여부(Y면 공유캘린더)
	private String regDate;					//등록일시
	private String modDate;				//수정일시
	private List<CalendarVo> calList;	//캘린더 리스트
	private List<CalendarVo> shreList;	//공유 캘린더 리스트
	
	public List<CalendarVo> getShreList() {
		return shreList;
	}
	public void setShreList(List<CalendarVo> shreList) {
		this.shreList = shreList;
	}
	public List<CalendarVo> getCalList() {
		return calList;
	}
	public void setCalList(List<CalendarVo> calList) {
		this.calList = calList;
	}
	private String runType;			//실행타입
	
	public String getRunType() {
		return runType;
	}
	public void setRunType(String runType) {
		this.runType = runType;
	}
	public String getCldrId() {
		return cldrId;
	}
	public void setCldrId(String cldrId) {
		this.cldrId = cldrId;
	}
	public String getCldrNm() {
		return cldrNm;
	}
	public void setCldrNm(String cldrNm) {
		this.cldrNm = cldrNm;
	}
	public String getCldrColorVal() {
		return cldrColorVal;
	}
	public void setCldrColorVal(String cldrColorVal) {
		this.cldrColorVal = cldrColorVal;
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
	public String getCloseYn() {
		return closeYn;
	}
	public void setCloseYn(String closeYn) {
		this.closeYn = closeYn;
	}
	public String getShreYn() {
		return shreYn;
	}
	public void setShreYn(String shreYn) {
		this.shreYn = shreYn;
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
	
}
