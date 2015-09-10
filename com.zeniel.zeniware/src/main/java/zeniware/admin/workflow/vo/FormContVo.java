package zeniware.admin.workflow.vo;

import java.util.ArrayList;
import java.util.List;

public class FormContVo {
	
	private String compId;
	private String contId;
	private String contName;
	private String contDesc;
	private int sortOrder;
	private List<FormVo> formList = new ArrayList<FormVo>();
	
	public FormContVo() { }
	
	public String getCompId() {
		return this.compId;
	}
	
	public FormContVo setCompId(String compId) {
		this.compId = compId;
		return this;
	}
	
	public String getContId() {
		return this.contId;
	}
	
	public FormContVo setContId(String contId) {
		this.contId = contId;
		return this;
	}
	
	public String getContName() {
		return this.contName;
	}
	
	public FormContVo setContName(String contName) {
		this.contName = contName;
		return this;
	}
	
	public String getContDesc() {
		return this.contDesc;
	}
	
	public FormContVo setContDesc(String contDesc) {
		this.contDesc = contDesc;
		return this;
	}
	
	public int getSortOrder() {
		return this.sortOrder;
	}
	
	public FormContVo setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
		return this;
	}
	
	public List<FormVo> getFormList() {
		return this.formList;
	}
	
	public FormContVo setFormList(List<FormVo> formList) {
		this.formList = formList;
		return this;
	}
	
}
