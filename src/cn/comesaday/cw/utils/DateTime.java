package cn.comesaday.cw.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
	public static Date getCurrentTime() throws ParseException {
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(day);
		Date date = df.parse(time);
		return date;
	}
}
