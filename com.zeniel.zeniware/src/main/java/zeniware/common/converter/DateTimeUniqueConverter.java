package zeniware.common.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateTimeUniqueConverter {

	private static final Logger logger = LoggerFactory.getLogger(DateTimeUniqueConverter.class);

	private static int DateTimeSeq= 0;
	private static int MAXSEQ= 500;

	//10자리
	public static synchronized String UNIQUEKEY10() {
		return UNIQUEKEY(2);
	}
	
	//15자리
	public static synchronized String UNIQUEKEY15() {
		return UNIQUEKEY(7);
	}

	//20자리
	public static synchronized String UNIQUEKEY20() {
		return UNIQUEKEY(13);
	}

	public static synchronized String UNIQUEKEY(int iLen) {
		//String s =System.currentTimeMillis() +"" + String.format("%06d", DateTimeSeq++);
		String s = getConvert36(System.currentTimeMillis()) + setPrefixLen(getConvert36(DateTimeSeq++),iLen,"0");
		// 1343783860986+123456는 long됨
		//DateTimeSeq는 123456 (6자리)정도까지 됨.
		if(DateTimeSeq>MAXSEQ)
			DateTimeSeq=0;
		return s;
	}

	private static String getConvert36(int nDec){
		return getConvert36((long)nDec);
	}
	private static String getConvert36(long nDec){
		long t;
		char c;
		int nLog =36;
		String strRet = "";
		while(nDec > 0) {
			t = nDec % nLog;
			if (t<10) c = (char)(t + '0'); // int를 char로 변환
			else c = (char)(t - 10 + 'A');  // 10 이상의 수는 알파벳으로 표기
	
			strRet = c + strRet;
			nDec /= nLog;
		}
		return strRet;
	}

	/*---------------------------------------------------------------------------
	   String에 preFix 추가 (자리수 고정용)
	 ---------------------------------------------------------------------------*/
	public static String setPrefixLen(String asVal, int ailen,String k) {
		try{
			String lsTemp = "";      
			byte [] tmpString = asVal.getBytes();
			
			if(ailen <= tmpString.length) 
				return asVal;

			for(int i = ailen - tmpString.length; i > 0 ; i--) {
				lsTemp += k;
			}
			return lsTemp + asVal;
		}
		catch(Exception e) {
			return asVal;
		}
	}

	/*---------------------------------------------------------------------------
	   String에 postFix 추가 (자리수 고정용)
	 ---------------------------------------------------------------------------*/
	public static String setPostfixLen(String asVal, int ailen) {
		try{
			String lsTemp = "";
			byte [] tmpString = asVal.getBytes();
			if(ailen <= tmpString.length) 
				return asVal;
			for(int i = ailen - tmpString.length; i > 0 ; i--) {
				lsTemp += " ";
			}

			return asVal + lsTemp;
		} catch(Exception e) {
			return asVal;
		}
	}
	
	public static synchronized String UNIQUEKEY2() {
		int fsize=16; //타임스탬프 + 뒤에 자리수채우기
		
		String s =System.currentTimeMillis() +""; //자리수 13
		logger.debug("s={}", s);
		logger.debug("s={}", s.length());
		
		s =System.currentTimeMillis() +"" + String.format("%0"+ (fsize -s.length()) +"d", DateTimeSeq++);
		
		logger.debug("s={}", s);
		logger.debug("s={}", s.length());
		return s;
	}
}