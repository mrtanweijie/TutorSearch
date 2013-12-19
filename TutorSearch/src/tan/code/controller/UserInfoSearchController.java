package tan.code.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;

import tan.code.model.UserInfo;
import tan.code.service.UserService;
import tan.code.utils.JSONHelper;

@Controller
@RequestMapping("/instructor")
public class UserInfoSearchController {
	private UserService userService;
	private List<UserInfo> userInfos;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String searchText, ModelMap map) throws ParseException {

		userInfos = userService.search(searchText);
		for (UserInfo userInfo : userInfos) {
			System.out.println(userInfo.getRealname());
		}
		return "/index.jsp";

	}

	@RequestMapping(value = "/multi_search", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public void selectByMulti(String university, String major, String academic, String grade,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 解决数据返回页面乱码问题
		response.setCharacterEncoding("UTF-8"); // 设置编码格式
		response.setContentType("text/html"); // 设置数据格式
		System.out.println("搜索条件："+university.trim()+major.trim()+academic.trim()+grade.trim());
		userInfos = userService.selectByMulti(university.trim(), major.trim(), academic.trim(), grade.trim());
		
		PrintWriter printWriter = response.getWriter();
		JSONHelper<UserInfo> jsonHelper = new JSONHelper<UserInfo>();
		List<JsonObject> j_list = new ArrayList<JsonObject>();
		
		if (userInfos.size() == 0) {
			printWriter.print("nodata");
		} else {
			//去掉为填写资料的用户
			for (int i = 0; i < userInfos.size(); i++) {
				if (userInfos.get(i).getAge()==0) {
					userInfos.remove(i);
					//System.out.println("remove"+i);
					i=i-1;
				}			
			}
			for (UserInfo userInfo : userInfos) {
				
				j_list.add(jsonHelper.createJSON(userInfo));
			}
			// 返回json字符串给页面
			printWriter.println(j_list);
			printWriter.flush();
		}
		// return null;
	}

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<UserInfo> getUserInfos() {
		return userInfos;
	}

	public void setUserInfos(List<UserInfo> userInfos) {
		this.userInfos = userInfos;
	}

}
