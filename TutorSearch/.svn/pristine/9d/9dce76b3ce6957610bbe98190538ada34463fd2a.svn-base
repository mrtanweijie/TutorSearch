package tan.code.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.lucene.document.DateTools;
import org.junit.Test;

import com.google.gson.JsonObject;

import tan.code.model.Tutor;
import tan.code.utils.GetDate;
import tan.code.utils.JSONHelper;
import tan.code.utils.SQLStringHelper;
import tan.code.utils.SendEmail;

public class MyTest {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Test
	public void test() throws ParseException {
		// fail("Not yet implemented");
		// Tutor tutor=new Tutor();

		// SQLStringHelper<Tutor> sqlStringHelper = new SQLStringHelper<Tutor>();
		// System.out.println(sqlStringHelper.createSelectByEntityId(Tutor.class, 2));
		//
		// // BaseDao<Tutor> baseDao =new BaseDao<Tutor>();
		// // baseDao.getEntity(1);
		//
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//
		// System.out.println("��ʽ����" + sdf.format(DateTools.stringToDate("20131011")));
		//
		// System.out.println("δ��ʽ����" + DateTools.stringToDate("2013-10-11"));
		//
		// System.out.println("Date to String��" + DateTools.dateToString(new Date(), DateTools.Resolution.DAY));
		//
		// // SendEmail sendemail=new SendEmail();
		// // sendemail.send();
		// JSONHelper jsonHelper = new JSONHelper();
		// List<JsonObject> list = new ArrayList<JsonObject>();
		// for (int i = 0; i < 5; i++) {
		// Tutor tutor = new Tutor();
		// tutor.setId(i);
		// tutor.setTitle("title" + i);
		// tutor.setContent("content" + i);
		// list.add(jsonHelper.createJSON(tutor));
		// }
		//
		// System.out.println("json��" + list.toString());

		System.out.println("前3天："+GetDate.getdate(-3));
		System.out.println("前7天："+GetDate.getdate(-7));
		System.out.println("前30天："+GetDate.getdate(-30));
		System.out.println("前90天："+GetDate.getdate(-90));
	}

}
