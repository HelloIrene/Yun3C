/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月18日
* Time: 下午9:30:44
*/

package org.yun.app.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.News;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/updateNews.html")
public class UpdateNews extends CommonServlet{

	/**
	 * 修改新闻内容
	 */
	private static final long serialVersionUID = 3489569759018091203L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		String pic =req.getParameter("filename");
		String title = req.getParameter("pname");
		String content =req.getParameter("content");
		String editor = req.getParameter("adminname");
		String lead = req.getParameter("lead");
		Timestamp addTime = new Timestamp(System.currentTimeMillis());
		String newID = req.getParameter("newID");
		System.out.println(newID);
		Object[] params = new Object[]{pic,title,content,editor,lead,addTime,newID};
		int row = dao.updateDataBase("UPDATE tb_news SET pic=?,title=?,content=?,editor=?,lead=?,addTime=? WHERE newID=?", params);
		if(row!=0){
			resp.sendRedirect("newsList.html");
		}else{
			req.getRequestDispatcher("../404.html").forward(req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ID =req.getParameter("id");
		List<Object> news = new CommonDAOImpl().findByCondition(News.class, "SELECT * FROM tb_news WHERE newID = ?", new Object[]{ID});
		if(news.size()>0){
			News newDescription = (News) news.get(0);
			req.setAttribute("news", newDescription);
			req.setAttribute("changepage", "updateNews.html");
			req.getRequestDispatcher("/WEB-INF/webPage/newsEdit.jsp").forward(req, resp);
		}		
	}
}
