package zeniware.admin.workflow.vo;

public class ConfigVo {
	
	private String compId;
	private boolean signYn;
	private boolean passYn;
	private boolean titleYn;
	private boolean agreementYn;
	private String namingPrefix;
	private int namingYear;
	private int namingDigit;
	private String regDate;
	private String modDate;
	
	public ConfigVo() { }
	
	public String getCompId() {
		return this.compId;
	}
	
	public ConfigVo setCompId(String compId) {
		this.compId = compId;
		return this;
	}
	
	public boolean getSignYn() {
		return this.signYn;
	}
	
	public ConfigVo setSignYn(boolean signYn) {
		this.signYn = signYn;
		return this;
	}
	
	public boolean getPassYn() {
		return this.passYn;
	}
	
	public ConfigVo setPassYn(boolean passYn) {
		this.passYn = passYn;
		return this;
	}
	
	public boolean getTitleYn() {
		return this.titleYn;
	}
	
	public ConfigVo setTitleYn(boolean titleYn) {
		this.titleYn = titleYn;
		return this;
	}
	
	public boolean getAgreementYn() {
		return this.agreementYn;
	}
	
	public ConfigVo setAgreementYn(boolean agreementYn) {
		this.agreementYn = agreementYn;
		return this;
	}
	
	public String getNamingPrefix() {
		return this.namingPrefix;
	}
	
	public ConfigVo setNamingPrefix(String namingPrefix) {
		this.namingPrefix = namingPrefix;
		return this;
	}
	
	public int getNamingYear() {
		return this.namingYear;
	}
	
	public ConfigVo setNamingYear(int namingYear) {
		this.namingYear = namingYear;
		return this;
	}
	
	public int getNamingDigit() {
		return this.namingDigit;
	}
	
	public ConfigVo setNamingDigit(int namingDigit) {
		this.namingDigit = namingDigit;
		return this;
	}
	
	public String getRegDate() {
		return this.regDate;
	}
	
	public ConfigVo setRegDate(String regDate) {
		this.regDate = regDate;
		return this;
	}
	
	public String getModDate() {
		return this.modDate;
	}
	
	public ConfigVo setModDate(String modDate) {
		this.modDate = modDate;
		return this;
	}

}
