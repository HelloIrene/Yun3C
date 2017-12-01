/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月13日
* Time: 下午3:46:26
*/


package org.yun.app.admin;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.News;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/newsEdit.html")
public class NewsEditServlet extends CommonServlet{

	/**
	 * 后台新闻编辑页面
	 */
	private static final long serialVersionUID = -8722665614309661262L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		News newDescription = new News();
		newDescription.setContent("");
		newDescription.setEditor("");
		newDescription.setPic("");
		newDescription.setTitle("");
		newDescription.setLead("");
		req.setAttribute("news", newDescription);
		req.setAttribute("changepage", "newsEdit.html");
		req.getRequestDispatcher("/WEB-INF/webPage/newsEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		String pic =req.getParameter("filename");
		String title = req.getParameter("pname");
		String content =req.getParameter("content");
		String editor = req.getParameter("adminname");
		String lead = req.getParameter("lead");
		Timestamp addTime = new Timestamp(System.currentTimeMillis());
		Object[] params = new Object[]{pic,title,content,editor,lead,addTime};
		//INSERT INTO tb_news (pic,title,content,editor,addTime) VALUES (?,?,?,?,?) "
		int row = dao.updateDataBase("INSERT INTO tb_news (pic,title,content,editor,lead,addTime) VALUES (?,?,?,?,?,?) ", params);
		if(row!=0){
			resp.sendRedirect("newsList.html");
		}else{
			req.getRequestDispatcher("/WEB-INF/webPage/about.jsp").forward(req, resp);
		}
	}
}
