package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import org.yun.app.dao.CommonDAOImpl;

@WebServlet("/RegServlet")
public class RegServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public RegServlet(){
		super();
        // TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("GBK");
		resp.setHeader("pragma", "no-cache");
		resp.setHeader("cache-control", "no-cache"); // 禁用缓存
		resp.setContentType("application/json;charset=utf-8"); // 设置输出响应的类型为json
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		CommonDAOImpl dao = new CommonDAOImpl();
		int row= dao.updateDataBase("INSERT INTO tb_user (loginname,loginpwd,email) VALUES (?,?,?)",name,pwd,email);
		PrintWriter pw = resp.getWriter();
		pw.print(new Gson().toJson(row));
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}