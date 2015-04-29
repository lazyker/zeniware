package zeniware.common;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

/**
 * 메시지 리소스 사용을 위한 MessageSource 인터페이스 및 ReloadableResourceBundleMessageSource 클래스의 구현체
 */

public class CommonMessageSource extends ReloadableResourceBundleMessageSource implements MessageSource {

	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;
	private Locale locale = Locale.getDefault();

	/**
	 * getReloadableResourceBundleMessageSource() 
	 * @param reloadableResourceBundleMessageSource - resource MessageSource
	 * @return ReloadableResourceBundleMessageSource
	 */	
	public void setReloadableResourceBundleMessageSource(ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource) {
		this.reloadableResourceBundleMessageSource = reloadableResourceBundleMessageSource;
	}
	
	public void setLocale(Locale locale) {
		this.locale = locale;
	}
	
	/**
	 * getReloadableResourceBundleMessageSource() 
	 * @return ReloadableResourceBundleMessageSource
	 */	
	public ReloadableResourceBundleMessageSource getReloadableResourceBundleMessageSource() {
		return reloadableResourceBundleMessageSource;
	}
	
	/**
	 * 정의된 메세지 조회
	 * @param code - 메세지 코드
	 * @return String
	 */	
	public String getMessage(String code) {
		return getReloadableResourceBundleMessageSource().getMessage(code, null, Locale.getDefault());
	}
	
	/**
	 * 정의된 메시지 조회
	 * @param code
	 * @param args
	 * @return String
	 */
	public String getMessage(String code, Object[] args) {
		return getReloadableResourceBundleMessageSource().getMessage(code, args, this.locale);
	}

	/** 
	 * 정의된 메시지 조회
	 * @param code
	 * @param args
	 * @param defaultMessage
	 * @return String
	 */
	public String getMessage(String code, Object[] args, String defaultMessage) {
		return getReloadableResourceBundleMessageSource().getMessage(code, args, defaultMessage, this.locale);
	}
	
}
