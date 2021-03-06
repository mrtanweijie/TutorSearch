package tan.code.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.lucene.document.DateTools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;

import tan.code.model.Tutor;
import tan.code.model.TutorSearchInfo;
import tan.code.service.TutorService;
import tan.code.utils.GetDate;
import tan.code.utils.JSONHelper;

@Controller
@RequestMapping("/tutor")
public class TutorController {
	private static Logger logger = Logger.getLogger(TutorController.class);
	private TutorService tutorService;
	private List<Tutor> tutors;
	// 全局变量
	// private static int tutorid=0;

	private static ThreadLocal<Integer> tutorid = new ThreadLocal<Integer>();

	public static int getTutorId() {
		if (tutorid.get() == null) {
			tutorid.set(0);
			return tutorid.get();
		} else {
			// tutorid.get();
			tutorid.set(tutorid.get() + 1);
			return tutorid.get();
		}
	}

	public TutorService getTutorService() {
		return tutorService;
	}

	@Resource
	public void setTutorService(TutorService tutorService) {
		this.tutorService = tutorService;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Tutor tutor) {

		tutor.setId(getTutorId());
		System.out.println("tutorid=" + getTutorId());

		tutor.setBrowse(0);// 初始化浏览次数为0
		tutor.setWb_num(0);// 初始化被举报的此时为0
		tutor.setDate(DateTools.dateToString(new Date(), DateTools.Resolution.DAY));
		String e_date = tutor.getEnd().replace("-", "");
		tutor.setEnd(e_date);

		tutorService.add(tutor);

		return "success.jsp";
	}

	// 返回搜索历史
	public void getSearchWords(HttpServletResponse response) throws IOException {
		// 解决数据返回页面乱码问题
		response.setCharacterEncoding("UTF-8"); // 设置编码格式
		response.setContentType("text/html"); // 设置数据格式
		PrintWriter printWriter = response.getWriter();
		// List<String> rws_list = tutorService.relatewords(new HashSet<String>(), "*");
	}

	// 全部信息混合查找
	@RequestMapping(value = "/search", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public String search(String searchText, HttpServletRequest request,HttpServletResponse response,ModelMap map) throws ParseException {

		logger.info("用户搜索:" + searchText);
		long begin = System.currentTimeMillis();
		tutors = tutorService.search(searchText);
		
		long end = System.currentTimeMillis();

		for (Tutor tutor : tutors) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			tutor.setDate(sdf.format(DateTools.stringToDate(tutor.getDate())));
		}

		// 相关搜索-备注：由于这里是从新打开索引，所以会影响效率，可以改为在搜索里面直接传值调用-20131010-twj
		HashSet<String> words = new HashSet<String>();
		words.add(searchText);
		List<String> rws_list = tutorService.relatewords(words, searchText);
		map.put("rws_list", rws_list);

		int num = tutors.size();
		map.put("num", num);
		// System.out.println(num);
		String totalTime = String.valueOf(end - begin);
		if (tutors.size() == 0) {
			return "nodata.ftl";
		} else {
			map.put("tutors", tutors);
			map.put("totalTime", totalTime);
			return "tutorslist.ftl";
		}

	}

	// 高级搜索
	@RequestMapping(value = "/ad_search", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public void ad_search(String subject, String major, String grade, String date, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		// 解决数据返回页面乱码问题
		response.setCharacterEncoding("UTF-8"); // 设置编码格式
		response.setContentType("text/html"); // 设置数据格式


		
		System.out.println("高级搜索：" + subject.trim() + grade.trim() + major.trim() + date.trim());
		StringBuffer sb = new StringBuffer();
		String s_date = date.trim();
		String b_date = "20130101";
		String e_date = DateTools.dateToString(new Date(), DateTools.Resolution.DAY);

		if (subject.trim() == "全部") {
			sb.append("语文数学英语物理化学生物地理政治历史");
		} else {
			sb.append(subject.trim());
		}
		if (major.trim() == "不限专业") {
			sb.append("汉语专业数学专业英语专业物理专业化学专业");
		} else {
			sb.append(major.trim());
		}
		if (grade.trim() == "不限年级") {
			sb.append("大一大二大三大四研究生");
		} else {
			sb.append(grade.trim());
		}

		// 日期
		if (s_date == "最近三天") {
			b_date = GetDate.getdate(-3);
		} else if (s_date == "最近一周") {
			b_date = GetDate.getdate(-7);
		} else if (s_date == "最近一个月") {
			b_date = GetDate.getdate(-30);
		} else {
			b_date = GetDate.getdate(-90);
		}

		tutors = tutorService.searchByDateRange(Long.valueOf(b_date.trim()), Long.valueOf(e_date.trim()));

		if (sb.length() > 0) {
			tutors = tutorService.search(sb.toString());
		}

		PrintWriter printWriter = response.getWriter();
		JSONHelper<Tutor> jsonHelper = new JSONHelper<Tutor>();
		List<JsonObject> j_list = new ArrayList<JsonObject>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (tutors.size() == 0) {
			printWriter.print("nodata");
		} else {
			for (Tutor tutor : tutors) {
				tutor.setDate(sdf.format(DateTools.stringToDate(tutor.getDate())));
				j_list.add(jsonHelper.createJSON(tutor));
			}
			// 返回json字符串给页面
			printWriter.println(j_list);
			printWriter.flush();
		}
	}

	// 自定义混合查找
	@RequestMapping(value = "/s_multi", method = RequestMethod.POST)
	public String searchByMulti(TutorSearchInfo tutorSearchInfo, ModelMap map) {
		StringBuffer sb = new StringBuffer();
		String b_date = DateTools.dateToString(new Date(), DateTools.Resolution.DAY);
		String e_date = DateTools.dateToString(new Date(), DateTools.Resolution.DAY);
		if (tutorSearchInfo.getCity() != null && !tutorSearchInfo.getCity().equals("请选择")) {
			// tutorService.

			sb.append(tutorSearchInfo.getCity());
		} else if (tutorSearchInfo.getProvince() != null && !tutorSearchInfo.getProvince().equals("请选择")) {
			sb.append(tutorSearchInfo.getProvince());
		} else if (tutorSearchInfo.getDate() != null) {
			b_date = tutorSearchInfo.getDate().replace("-", "");
			// sb.append(b_date);
		} else if (tutorSearchInfo.getEnd() != null) {
			e_date = tutorSearchInfo.getEnd().replace("-", "");
			// sb.append(e_date);
		}

		System.out.println(sb.toString());
		// tutors = tutorService.searchByDateRange(Long.valueOf(b_date), Long.valueOf(e_date));

		System.out.println(b_date + e_date);

		long begin = System.currentTimeMillis();
		tutors = tutorService.searchByDateRange(Long.valueOf(b_date.trim()), Long.valueOf(e_date.trim()));
		if (sb.length() > 0) {
			tutors = tutorService.search(sb.toString());
		}
		long end = System.currentTimeMillis();

		String totalTime = String.valueOf(end - begin);

		HashSet<String> words = new HashSet<String>();
		words.add(sb.toString());
		List<String> rws_list = tutorService.relatewords(words, sb.toString());
		map.put("rws_list", rws_list);

		int num = tutors.size();
		map.put("num", num);

		if (tutors.size() == 0) {
			return "nodata.ftl";
		} else {
			map.put("tutors", tutors);
			map.put("totalTime", totalTime);
			return "tutorslist.ftl";
		}

		// return null;
	}

	// 按城市查找
	@RequestMapping(value = "/s_city", method = RequestMethod.GET)
	public String searchByCity(String city, ModelMap map) {
		long begin = System.currentTimeMillis();
		tutors = tutorService.searchByCity(1000, city);
		long end = System.currentTimeMillis();
		String totalTime = String.valueOf(end - begin);

		// 相关搜索-备注：由于这里是从新打开索引，所以会影响效率，可以改为在搜索里面直接传值调用-20131010-twj
		HashSet<String> words = new HashSet<String>();
		words.add(city);
		List<String> rws_list = tutorService.relatewords(words, city);
		map.put("rws_list", rws_list);
		int num = rws_list.size();
		map.put("num", num);
		if (tutors.size() == 0) {
			return "nodata.ftl";
		} else {
			map.put("tutors", tutors);
			map.put("totalTime", totalTime);
			return "tutorslist.ftl";
		}
	}

	// 按城市查找-首页数据
	@RequestMapping(value = "/s_city2", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public void searchByCity2(String city,HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {

		request.setCharacterEncoding("utf-8");
		// 解决数据返回页面乱码问题
		response.setCharacterEncoding("UTF-8"); // 设置编码格式
		response.setContentType("text/html"); // 设置数据格式
		PrintWriter printWriter = response.getWriter();
		// 首页展示-最多只返回20条数据
		tutors = tutorService.searchByCity(20, city);

		JSONHelper<Tutor> jsonHelper = new JSONHelper<Tutor>();
		List<JsonObject> j_list = new ArrayList<JsonObject>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (tutors.size() == 0) {
			printWriter.print("nodata");
		} else {
			String t_title;
			for (Tutor tutor : tutors) {
				// System.out.println("length:"+tutor.getTitle().length());
				t_title = tutor.getTitle();
				// 截取字符串
				if (t_title.length() > 10) {
					// System.out.println("截取");
					tutor.setTitle(t_title.substring(0, 10) + "...");
				}
				tutor.setDate(sdf.format(DateTools.stringToDate(tutor.getDate())));
				j_list.add(jsonHelper.createJSON(tutor));
			}
			// 返回json字符串给页面
			printWriter.println(j_list);
			printWriter.flush();
		}
	}

	// 按发布日期范围查找
	@RequestMapping(value = "/s_date", method = RequestMethod.GET)
	public String searchByDateRange(String begin, String end, ModelMap map) {
		String b_date = begin.replace("-", "");
		String e_date = end.replace("-", "");
		tutors = tutorService.searchByDateRange(Long.valueOf(b_date), Long.valueOf(e_date));
		List<String> rws_list = new ArrayList<String>();
		rws_list.add("无相关");
		map.put("rws_list", rws_list);

		int num = tutors.size();
		map.put("num", num);
		if (tutors.size() == 0) {
			return "nodata.ftl";
		} else {
			map.put("tutors", tutors);
			map.put("totalTime", "1");
			return "tutorslist.ftl";
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getTutor(@PathVariable("id") String id, ModelMap map) throws ParseException {

		try {
			
		
		Tutor tutor = tutorService.getTutorByDocmentId(Integer.parseInt(id));
		// 浏览次数加1
		int browse = tutor.getBrowse();
		System.out.println("浏览次数：" + browse);
		// tutorService.updateBrowse(String.valueOf(tutor.getId()), ++browse);
		// System.out.println("更新后的："+browse);
		// tutor.setBrowse(++browse);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		tutor.setDate(sdf.format(DateTools.stringToDate(tutor.getDate())));
		System.out.println(id);
		System.out.println(tutor.getTitle());
		System.out.println(tutor.getContent());
		map.put("tutor", tutor);

		return "tutor_data.ftl";
		} catch (Exception e) {
			// TODO: handle exception
			return "/error.jsp";
		}
	}

}
