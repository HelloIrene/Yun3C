/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月18日
* Time: 上午11:19:23
*/

package org.yun.app.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.News;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/newsList.html")
public class NewsListServlet extends CommonServlet{

	/**
	 * 新闻列表数据读取
	 */
	private static final long serialVersionUID = -3264457242397281940L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		List<Object> news = new CommonDAOImpl().findByCondition(News.class, "SELECT * FROM tb_news ORDER BY addTime", null);
		if(news.size()>0){
			req.setAttribute("news", news);
			req.getRequestDispatcher("/WEB-INF/webPage/newsList.jsp").forward(req, resp);
			
		}else{
			resp.sendRedirect("404.html");
		}
		
	}
}
