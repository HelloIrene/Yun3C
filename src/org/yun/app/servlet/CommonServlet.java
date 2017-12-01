/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月13日
* Time: 上午9:19:07
*/

package org.yun.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.html")
public class CommonServlet extends HttpServlet{

	private static final long serialVersionUID = 4389243452930437641L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		String ctxPath = this.getServletContext().getContextPath();
		int index = uri.lastIndexOf('.');
		String path = uri.substring(ctxPath.length(), index);
		String dispatcherPath = String.format("/WEB-INF/webPage%s.jsp", path);
		req.getRequestDispatcher(dispatcherPath).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
}
