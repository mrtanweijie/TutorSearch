package tan.code.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import tan.code.model.LoginInfo;
import tan.code.model.User;
import tan.code.model.UserInfo;
import tan.code.service.UserService;
import tan.code.utils.JSONHelper;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	private static Logger logger = Logger.getLogger(UserController.class);
	private UserService userService;
	private List<User> users;

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(User user, HttpServletResponse response) throws Exception {

		if (userService.checkName(user.getName()) && userService.checkEmail(user.getEmail())) {
			userService.add(user);
			return "/success.jsp";
		} else {
			return "/admin/adduser.jsp";
		}
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String id) {
		userService.delete(Integer.valueOf(id));
		return "/success.jsp";
	}

	// 完善个人信息-管理员
	@RequestMapping(value = "/com_info", method = RequestMethod.POST)
	public String com_info(UserInfo userinfo, int u_id) {
		userService.add_userinfo(userinfo, u_id);
		return "/success.jsp";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") String id, ModelMap map) {
		User user = new User();
		user = userService.getuser(Integer.valueOf(id));

		UserInfo userInfo = new UserInfo();
		userInfo = userService.getuserinfo(user.getId());
		map.put("user", user);
		map.put("userinfo", userInfo);

		System.out.println(user.getName());
		return "myinfo.ftl";
	}

	@RequestMapping(value = "/show/{from}/{total}", method = RequestMethod.GET)
	public void getuserlist(@PathVariable("from") String from, @PathVariable("total") String total, ModelMap map,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageSize = Integer.valueOf(total);
		users = userService.getuserlist(Integer.valueOf(from), pageSize);

		// 用户总数
		int userNum = userService.getUserNum();
		// 总页数
		long pageNum = userService.getTotalPage(userNum, pageSize);

		System.out.println("用户总数：" + userNum + ";总页数：" + pageNum);

		WebUtils.setSessionAttribute(request, "userNum", userNum);
		WebUtils.setSessionAttribute(request, "pageNum", pageNum);

		map.put("pageNum", pageNum);
		map.put("users", users);

		// 解决数据返回页面乱码问题
		response.setCharacterEncoding("UTF-8"); // 设置编码格式
		response.setContentType("text/html"); // 设置数据格式
		PrintWriter printWriter = response.getWriter();
		JSONHelper<User> jsonHelper = new JSONHelper<User>();
		List<JsonObject> u_list = new ArrayList<JsonObject>();
		if (users.size() == 0) {
			printWriter.print("nodata");
		} else {

			for (User user : users) {
				u_list.add(jsonHelper.createJSON(user));
			}
			// 返回json字符串给页面
			printWriter.println(u_list);
			printWriter.flush();
		}
	}

	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public void adminlogin(LoginInfo loginInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("admin login");
		System.out.println(loginInfo.getName() + loginInfo.getPassword() + loginInfo.getCheck());

		List<User> users = userService.checkUser(loginInfo.getName(), loginInfo.getPassword());

		PrintWriter printWriter = response.getWriter();
		System.out.println(users.get(0).getId());
		System.out.println(users.get(0).getIdentity());

		if (users.size() == 1 && users.get(0).getIdentity() == 1) {
			// 将用戶id與用户名写入session
			WebUtils.setSessionAttribute(request, "id", users.get(0).getId());
			WebUtils.setSessionAttribute(request, "name", loginInfo.getName());
			// 记录登录日志
			logger.info("管理员登录:" + loginInfo.getName());
			printWriter.print("success");
		} else {
			printWriter.print("false");
		}
		printWriter.close();
	}

	// 退出登录
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) {

		// 清除session
		Enumeration<String> em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		request.getSession().invalidate();
		// 获取项目真实路径
		String path = request.getContextPath() + "/index.jsp";
		// 拼接跳转页面路径
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
		// 刷新页面
		String str = "<script>top.location='" + basePath + "'</script>";
		System.out.println(str);
		responseTxt(response, str);
	}

	// 返回前台页面
	protected void responseTxt(HttpServletResponse response, String str) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(str);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
