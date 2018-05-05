package tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BillCodeUtil {

	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	
	public static String getBillCode(){
		Date date=new Date();
		String dateString=sdf.format(date);
		dateString+=System.currentTimeMillis();
		return dateString;
	}
}
