package org.yun.app.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yun.app.entity.Admin;
import org.yun.app.entity.User;


/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/dashboard/*")
public class LoginFilter implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest reqHttp = (HttpServletRequest) request;
		HttpServletResponse respHttp = (HttpServletResponse) response;
		String path = reqHttp.getRequestURI(); //查看请求路径，如果是登录界面应该直接放行访问
		if (path.equals("/shopping/dashboard/login.html")) {
			chain.doFilter(request, response);
		} else {
			HttpSession session = reqHttp.getSession();
			Admin admin = (Admin) session.getAttribute("admin");
			if (admin == null) {
				respHttp.sendRedirect("/shopping/404.html");
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
