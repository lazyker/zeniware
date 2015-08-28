package zeniware.admin.schedule.vo;


public class HoliDayAdmVo {
	
	private String hldyYmd;	//휴일날짜
	private String compId;		//회사 아이디
	private int hldyId;			//휴일 아이디
	private String hldyNm;		//휴일 이름
	private String regDate;		//등록일시
	private String modDate;	//수정일시
	
	public String getHldyYmd() {
		return hldyYmd;
	}
	public void setHldyYmd(String hldyYmd) {
		this.hldyYmd = hldyYmd;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public int getHldyId() {
		return hldyId;
	}
	public void setHldyId(int hldyId) {
		this.hldyId = hldyId;
	}
	public String getHldyNm() {
		return hldyNm;
	}
	public void setHldyNm(String hldyNm) {
		this.hldyNm = hldyNm;
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
