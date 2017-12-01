/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月19日
* Time: 下午2:34:58
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
import org.yun.app.entity.Qna;

@WebServlet("/news.html")
public class NewsServlet extends CommonServlet{

	/**
	 * 从数据库读取数据到前台新闻展示页
	 */
	private static final long serialVersionUID = -9163060331052137628L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		int total = dao.findTotal("SELECT COUNT(addTime) FROM tb_news ", null);
		int numPerPage = 5;
		
		int totalPage = total % numPerPage == 0 ? total / numPerPage : total /numPerPage + 1;
		String pageStr = req.getParameter("page");
		int page = 1;
		if(pageStr != null && pageStr.matches("^[0-9]*[1-9][0-9]*$")){
			page = Integer.parseInt(pageStr);
		}
		if(page > 0 && page <= totalPage){
			int start = (page - 1)*numPerPage;
			List<Object> news = new CommonDAOImpl().findByCondition(News.class, "SELECT * FROM tb_news order by addTime desc limit ?,? ", new Object[]{start,numPerPage});
			req.setAttribute("news", news); 
			req.setAttribute("page", page);
			req.setAttribute("totalPage", totalPage);
			req.getRequestDispatcher("/WEB-INF/webPage/news.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("/404.html");
		}
		/*
		List<Object> news = new CommonDAOImpl().findByCondition(News.class, "SELECT * FROM tb_news ORDER BY addTime desc", null);
		if(news.size()>0){
			req.setAttribute("news", news);
			req.getRequestDispatcher("WEB-INF/webPage/news.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("/404.html");
		}
		*/
	}
}
