package tan.code.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		// TODO Auto-generated method stub
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();

		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();

		String name = (String) session.getAttribute("name");

		if (path.indexOf("/login-1.jsp") > -1 || path.indexOf("/register.jsp") > -1
				|| path.indexOf("/success.jsp") > -1||path.indexOf("/search.jsp") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}

		// 判断如果没有取到员工信息,就跳转到登陆页面
		if (name == null || "".equals(name)) {
			// 跳转到登陆页面
			servletResponse.sendRedirect("/user/login-1.jsp");
		} else {
			// 已经登陆,继续此次请求
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
