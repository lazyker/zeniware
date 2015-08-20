package zeniware.schedule.vo;

public class TodoVo {
	
	private String userId;		//사용자 아이디
	private int todoSeq;	//할일 순번
	private String todoNm;		//할일 이름
	private String startYmd;	//시작날짜
	private String endYmd;		//종료일자
	private String cmpltYn;		//완료여부
	
	private String runType;	//등록 or 수정 타입
	
	public String getRunType() {
		return runType;
	}
	public void setRunType(String runType) {
		this.runType = runType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTodoSeq() {
		return todoSeq;
	}
	public void setTodoSeq(int todoSeq) {
		this.todoSeq = todoSeq;
	}
	public String getTodoNm() {
		return todoNm;
	}
	public void setTodoNm(String todoNm) {
		this.todoNm = todoNm;
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
	public String getCmpltYn() {
		return cmpltYn;
	}
	public void setCmpltYn(String cmpltYn) {
		this.cmpltYn = cmpltYn;
	}
	
}
