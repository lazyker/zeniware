package zeniware.task.vo;


public class PersonVo {
	
	private int personSeq;				//고객사 담당자 번호
	private int custSeq;				//고객사 번호
	private String personNm;			//담당자 성명
	private String deptNm;				//부서명
	private String jobTitleNm;			//직위
	private String birthday;			//생년원일
	private String mailId;				//메일주소
	private String officePhone;		//사무실 번호
	private String mobilePhone;		//휴대폰 번호
	private String businessNm;		//담당 업무
	private String memo;				//메모
	private String userId;				//작성자 아이디
	private String regDate;				//등록일시
	private String modDate;			//수정일시
	
	public int getPersonSeq() {
		return personSeq;
	}
	public void setPersonSeq(int personSeq) {
		this.personSeq = personSeq;
	}
	public int getCustSeq() {
		return custSeq;
	}
	public void setCustSeq(int custSeq) {
		this.custSeq = custSeq;
	}
	public String getPersonNm() {
		return personNm;
	}
	public void setPersonNm(String personNm) {
		this.personNm = personNm;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getJobTitleNm() {
		return jobTitleNm;
	}
	public void setJobTitleNm(String jobTitleNm) {
		this.jobTitleNm = jobTitleNm;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getOfficePhone() {
		return officePhone;
	}
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getBusinessNm() {
		return businessNm;
	}
	public void setBusinessNm(String businessNm) {
		this.businessNm = businessNm;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
