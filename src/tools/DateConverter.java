/**
 * 
 */
package tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


/**
 * @author CHANGEX
 *
 */
public class DateConverter implements Converter<String, Date> {
	private String datePattern;
	public DateConverter(String datePattern){
		this.datePattern=datePattern;
	}
	@Override
	public Date convert(String s) {
		Date date=null;
		try {
			date=new SimpleDateFormat(datePattern).parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}


}
