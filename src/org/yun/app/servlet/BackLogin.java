package org.yun.app.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yun.app.entity.Admin;
import org.yun.app.dao.CommonDAOImpl;

@WebServlet("/backlogin.html")
public class BackLogin extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Object> peoples= new ArrayList<Object>();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("GBK");
		resp.setContentType("text/html;charset=utf-8");
		String name = req.getParameter("loginname");
		String pwd = req.getParameter("loginpwd");
		CommonDAOImpl dao = new CommonDAOImpl();
		peoples= dao.findByCondition(Admin.class, "SELECT * FROM tb_admin WHERE loginname=? AND loginpwd=?" ,name,pwd);
		if (peoples.size()>0)
		{
			Admin user=(Admin)peoples.get(0);
			HttpSession session = req.getSession();
			session.setAttribute("admin", user);
			resp.sendRedirect(resp.encodeURL("/shopping/backproduct-hot.html"));
		}else{
			resp.sendRedirect(resp.encodeURL("backlogin.html"));
		}
	}
	
}
