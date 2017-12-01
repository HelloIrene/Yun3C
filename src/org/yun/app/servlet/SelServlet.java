package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.User;

@WebServlet("/SelServlet")
public class SelServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public SelServlet(){
		super();
        // TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("GBK");
		resp.setHeader("pragma", "no-cache");
		resp.setHeader("cache-control", "no-cache"); // 禁用缓存
		resp.setContentType("application/json;charset=utf-8"); // 设置输出响应的类型为json
		List<Object> peoples= new ArrayList<Object>();
		String name = req.getParameter("name");
		CommonDAOImpl dao = new CommonDAOImpl();
		peoples= dao.findByCondition(User.class, "SELECT * FROM tb_user WHERE loginname=?",name);
		PrintWriter pw = resp.getWriter();
		pw.print(new Gson().toJson(peoples));
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
