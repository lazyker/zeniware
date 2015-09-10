package zeniware.admin.workflow.vo;

public class FormVo {
	
	private String formId;
	private int formVersion;
	private String formContId;
	private String formName;
	private String formDesc;
	private int storagePeriod;
	private int sortOrder;
	private boolean useYn;
	private boolean activateYn;
	private String regDate;
	private String modDate;
	private String delDate;
	
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
	
	public String getFormDesc() {
		return formDesc;
	}
	
	public FormVo setFormDesc(String formDesc) {
		this.formDesc = formDesc;
		return this;
	}
	
	public int getStoragePeriod() {
		return this.storagePeriod;
	}

	public FormVo setStoragePeriod(int storagePeriod) {
		this.storagePeriod = storagePeriod;
		return this;
	}
	
	public int getSortOrder() {
		return this.sortOrder;
	}
	
	public FormVo setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
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

	public String getRegDate() {
		return regDate;
	}

	public FormVo setRegDate(String regDate) {
		this.regDate = regDate;
		return this;
	}

	public String getModDate() {
		return modDate;
	}

	public FormVo setModDate(String modDate) {
		this.modDate = modDate;
		return this;
	}

	public String getDelDate() {
		return delDate;
	}

	public FormVo setDelDate(String delDate) {
		this.delDate = delDate;
		return this;
	}

}
