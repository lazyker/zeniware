package zeniware.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.time.FastDateFormat;

public class DateUtil {

	private static final int MS 	= 1000;
	
	public static final int SUN	= 1;
	public static final int MON	= 2;
	public static final int TUE = 3;
	public static final int WED	= 4;
	public static final int THU	= 5;
	public static final int FRI	= 6;
	public static final int SAT	= 7;
	
	public static final int YEAR = 1;
	public static final int MONTH = 2;
	public static final int WEEK = 3;
	public static final int DAY = 4;
		  
    public static String getFirstOfMonth(String date){
		return date.substring(0, 7) + "-01";
	}
    
    public static String getYear(Date date) throws Exception {
    	FastDateFormat fdf = FastDateFormat.getInstance("yyyy");
    	return fdf.format(date);
    }
    
    public static String getMonth(Date date) throws Exception {
    	FastDateFormat fdf = FastDateFormat.getInstance("MM");
    	return fdf.format(date);
    }
    
    public static String getDay(Date date) throws Exception {
    	FastDateFormat fdf = FastDateFormat.getInstance("dd");
    	return fdf.format(date);
    }
    
    public static String getLastOfMonth(String dateStr) throws ParseException{
		Calendar base = Calendar.getInstance();
		base.setTime(parseDate(dateStr, "yyyy-MM-dd"));
		int maxday = base.getActualMaximum(Calendar.DATE);

		dateStr = dateStr.substring(0, 7) + "-" + maxday;
		return dateStr;
	}
    
    public static String parseString(Date date, String format){
    	if(date == null)
    		return "";
    	FastDateFormat fdf 
			= FastDateFormat.getInstance(format);
    	return fdf.format(date);
    }
    
    public static Date parseDate(String date, String format) throws ParseException{
    	if(date == null || "".equals(date))
    		return null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(date);
    }
    
    public static int diffDays(Date date1, Date date2) {
        return (int) (Math.abs(date1.getTime() - date2.getTime()) / MS);
    }
    
    public static Date addTimes(Date date, int times, int base) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(base,times);

		return cal.getTime();
	}
    
    public static Date addHours(Date date, int hours) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR_OF_DAY,hours);

		return cal.getTime();
	}
    
    public static Date addMinutes(Date date, int minutes) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, minutes);

		return cal.getTime();
	}
    
    public static Date addSecond(Date date, int second) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.SECOND, second);

		return cal.getTime();
	}    
    
    public static Date addDay(Date date, int day) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, day);

		return cal.getTime();
	}
    
    public static Date addMonth(Date date, int month) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, month);

		return cal.getTime();
	}
    
    public static Date addYear(Date date, int year) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, year);

		return cal.getTime();
	}
    
    public static boolean equals(Date date1, Date date2, String format){
		String currentTime1 = parseString(date1, format);
		String currentTime2 = parseString(date2, format);
		return currentTime1.equals(currentTime2);
    }
    
    public static int getDayOfWeek(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        return dayOfWeek;
    }
    
}
