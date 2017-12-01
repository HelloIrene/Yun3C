/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月19日
* Time: 下午4:22:04
*/


package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.News;

@WebServlet("/news-content.html")
public class NewsContentServlet extends CommonServlet{

	/**
	 * 新闻详情数据的读取
	 */
	private static final long serialVersionUID = -1536223761662279419L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		List<Object> newsContent = new CommonDAOImpl().findByCondition(News.class, "SELECT * FROM tb_news where newID = ?", new Object[]{id});
		if(newsContent.size()>0){
			News temp  = (News) newsContent.get(0);
			req.setAttribute("newsContent", temp);
			req.getRequestDispatcher("WEB-INF/webPage/news-content.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("/404.html");
		}
	}
}
