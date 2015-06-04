package zeniware.sample.vo;

import zeniware.common.converter.FileVo;

public class SampleVo {
	
	private String date;
	private FileVo[] file;					// 업로드한 파일 정보

	public FileVo[] getFile() {
		return file;
	}

	public void setFile(FileVo[] file) {
		this.file = file;
	}


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
