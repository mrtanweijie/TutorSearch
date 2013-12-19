package tan.code.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetDate {

	/*
	 * 将当前日期加减n天数。 如传入整型-5 意为将当前日期减去5天的日期 如传入整型5 意为将当前日期加上5天后的日期 返回字串 例(19990203)
	 */
	public static String getdate(int days) {
		// 日期处理模块 (将日期加上某些天或减去天数)返回字符串
		Calendar canlendar = Calendar.getInstance(); // java.util包
		canlendar.add(Calendar.DATE, days); // 日期减 如果不够减会将月变动
		String result = (new SimpleDateFormat("yyyyMMdd")).format(canlendar.getTime());
		return result;
	}

}
