package org.yun.app.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.User;
@WebServlet("/Alterpwd")
@MultipartConfig
public class AlterpwdServlet extends CommonServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Object> peoples= new ArrayList<Object>();
		String name = req.getParameter("name");
		String oldpwd = req.getParameter("oldpwd");
		String newpwd = req.getParameter("newpwd");
		String newpwdp = req.getParameter("newpwdp");
		int row=0;
		CommonDAOImpl dao = new CommonDAOImpl();
		peoples= dao.findByCondition(User.class, "SELECT * FROM tb_user WHERE loginname=?" ,name);
		if (peoples.size()>0)
		{
			User user=(User)peoples.get(0);
			if(oldpwd.equals(user.getLoginpwd()) && newpwd.equals(newpwdp)){
				row=dao.updateDataBase("UPDATE tb_user SET loginpwd=? WHERE loginname=?",newpwd,name);
			}
		}
		resp.getWriter().print(row);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
}
