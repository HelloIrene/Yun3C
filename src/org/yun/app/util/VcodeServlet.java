package org.yun.app.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * xda
 * @author amos
 *
 */
@WebServlet("/checkcode")
public class VcodeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/page/cap.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		String vcode = req.getParameter("vcode");
		String vcodeSession = (String) req.getSession().getAttribute("checkcode_session");
		PrintWriter pw = resp.getWriter();
		if(vcode.equals(vcodeSession)){
			pw.print("yes");
		}
		else{
			pw.print("no");
		}
		pw.flush();
		pw.close();
	}
}
