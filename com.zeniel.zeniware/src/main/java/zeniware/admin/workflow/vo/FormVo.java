package zeniware.admin.workflow.vo;

public class FormVo {
	
	private String formId;
	private int formVersion;
	private String formContId;
	private String formName;
	private String formDescription;
	private boolean useYn;
	private boolean activateYn;
	
	public FormVo() { }
	
	public String getFormId() {
		return formId;
	}
	
	public FormVo setFormId(String formId) {
		this.formId = formId;
		return this;
	}
	
	public int getFormVersion() {
		return formVersion;
	}
	
	public FormVo setFormVersion(int formVersion) {
		this.formVersion = formVersion;
		return this;
	}
	
	public String getFormContId() {
		return formContId;
	}
	
	public FormVo setFormContId(String formContId) {
		this.formContId = formContId;
		return this;
	}
	
	public String getFormName() {
		return formName;
	}
	
	public FormVo setFormName(String formName) {
		this.formName = formName;
		return this;
	}
	
	public String getFormDescription() {
		return formDescription;
	}
	
	public FormVo setFormDescription(String formDescription) {
		this.formDescription = formDescription;
		return this;
	}
	
	public boolean isUseYn() {
		return useYn;
	}
	
	public FormVo setUseYn(boolean useYn) {
		this.useYn = useYn;
		return this;
	}
	
	public boolean isActivateYn() {
		return activateYn;
	}
	
	public FormVo setActivateYn(boolean activateYn) {
		this.activateYn = activateYn;
		return this;
	}

}
