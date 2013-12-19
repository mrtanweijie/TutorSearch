package tan.code.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import tan.code.utils.SendEmail;

import org.apache.log4j.Logger;

@Controller
@RequestMapping("/User")
public class UserController {
	private static Logger logger = Logger.getLogger(UserController.class);
	private UserService userService;
	private List<User> users;

	// @RequestMapping(value = "/checkname", method = RequestMethod.POST)
	// public void checkname(String name, HttpServletResponse response) throws Exception {
	// PrintWriter printWriter = response.getWriter();
	// if (userService.checkName(name)) {
	// printWriter.print("success");
	// }
	// else {
	// printWriter.print("error");
	// }
	// }
	//
	// @RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	// public void checkemail(String email, HttpServletResponse response) throws Exception {
	// PrintWriter printWriter = response.getWriter();
	// if (userService.checkEmail(email)) {
	// printWriter.print("success");
	// }
	// else {
	// printWriter.print("error");
	// }
	// }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, HttpServletResponse response) throws Exception {

		if (userService.checkName(user.getName()) && userService.checkEmail(user.getEmail())) {
			user.setIdentity(2);
			userService.add(user);
			System.out.println("注册成功。。。");
			// 发送邮件
			SendEmail.sendHtmlEmail(user.getName(), user.getEmail());
			return "/user/login-1.jsp";
		} else {
			System.out.println("注册失败。。。");
			return "/user/register.jsp";
		}
	}

	// 完善个人信息-成为教员
	@RequestMapping(value = "/addmyinfo", method = RequestMethod.POST)
	public String addmyinfo(UserInfo userinfo, int u_id) {

		if (String.valueOf(u_id) != null) {
			// 写入数据库
			userService.add_userinfo(userinfo, u_id);
			// 写入index
			userService.add_myinfo(userinfo);
			System.out.println("success...");
			return "/success.jsp";
		} else {
			return "/login-1.jsp";
		}

	}

	@RequestMapping(value = "showmyinfo/{id}", method = RequestMethod.GET)
	public String showmyinfo(@PathVariable("id") String id, ModelMap map) {
		User user = new User();
		user = userService.getuser(Integer.valueOf(id));

		UserInfo userInfo = new UserInfo();
		userInfo = userService.getuserinfo(user.getId());
		map.put("user", user);
		map.put("userinfo", userInfo);

		//System.out.println(user.getName());
		return "myinfo.ftl";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(LoginInfo loginInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("login");
		
		System.out.println(new String(loginInfo.getName().getBytes("iso8859-1"),"UTF-8") + loginInfo.getPassword() + loginInfo.getCheck());
		List<User> users = userService.checkUser(new String(loginInfo.getName().getBytes("iso8859-1"),"UTF-8"), loginInfo.getPassword());
		PrintWriter printWriter = response.getWriter();
		if (users.size() == 1 && users.get(0).getIdentity() == 2) {
			// 将用户名写入session
			WebUtils.setSessionAttribute(request, "id", users.get(0).getId());
			WebUtils.setSessionAttribute(request, "name", new String(loginInfo.getName().getBytes("iso8859-1"),"UTF-8"));
			// 记录登录日志
			logger.info("用户登录:" + loginInfo.getName());
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
