package zeniware.admin.workflow.vo;

public class FormContVo {
	
	private String formContId;
	private String compId;
	private String formContName;
	private String formContDescription;
	
	public FormContVo() { }
	
	public String getFormContId() {
		return formContId;
	}
	
	public FormContVo setFormContId(String formContId) {
		this.formContId = formContId;
		return this;
	}
	
	public String getCompId() {
		return compId;
	}
	
	public FormContVo setCompId(String compId) {
		this.compId = compId;
		return this;
	}
	
	public String getFormContName() {
		return formContName;
	}
	
	public FormContVo setFormContName(String formContName) {
		this.formContName = formContName;
		return this;
	}
	
	public String getFormContDescription() {
		return formContDescription;
	}
	
	public FormContVo setFormContDescription(String formContDescription) {
		this.formContDescription = formContDescription;
		return this;
	}
	
}
