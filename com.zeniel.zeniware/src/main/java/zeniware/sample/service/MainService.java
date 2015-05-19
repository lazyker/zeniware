package zeniware.sample.service;

import java.util.HashMap;

import zeniware.sample.vo.Employee;


public interface MainService {

	/**
	 * 오늘 날짜 구하기
	 * @return
	 */
	public String getToday();
	
	/**
	 * 가져오기
	 * @param map
	 * @return
	 */
	public String getEmpInfo(HashMap<String, Object> map);
	
	/** 
	 * VO로 가져오기
	 * @param paramVo
	 * @return
	 */
	public Employee getEmpInfoMap(Employee paramVo);
	

}
