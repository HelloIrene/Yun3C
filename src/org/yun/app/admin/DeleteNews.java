/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月18日
* Time: 下午4:30:34
*/


package org.yun.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/deleteNews.html")
public class DeleteNews extends CommonServlet{

	/**
	 * 后台删除新闻
	 */
	private static final long serialVersionUID = -50062658740143210L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider=req.getParameter("id");
		if(ider==null||ider==""){
			resp.sendRedirect("newsList.html");
		}else{
			int id = new Integer(ider);
			int row = new CommonDAOImpl().updateDataBase("DELETE FROM tb_news WHERE newID = ? ", new Object[]{id});
			if(row!=0){
				resp.sendRedirect("newsList.html");
			}
		}
	}
}
