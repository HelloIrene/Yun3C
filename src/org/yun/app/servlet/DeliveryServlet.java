/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月16日
* Time: 下午8:01:47
*/
package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Qna;
@WebServlet("/delivery.html")
public class DeliveryServlet extends CommonServlet{

	/**
	 * 顾客问答
	 */
	private static final long serialVersionUID = -8082592379676845965L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		CommonDAOImpl dao = new CommonDAOImpl();
		int total = dao.findTotal("SELECT COUNT(questionID) FROM tb_qna ", null);
		int numPerPage = 5;
		
		int totalPage = total % numPerPage == 0 ? total / numPerPage : total /numPerPage + 1;
		String pageStr = req.getParameter("page");
		int page = 1;
		if(pageStr != null && pageStr.matches("^[0-9]*[1-9][0-9]*$")){
			page = Integer.parseInt(pageStr);
		}
		if(page > 0 && page <= totalPage){
			int start = (page - 1)*numPerPage;
			List<Object> qnas = new CommonDAOImpl().findByCondition(Qna.class, "SELECT * FROM tb_qna order by questionID desc limit ?,? ", new Object[]{start,numPerPage});
			req.setAttribute("qnas", qnas); 
			req.setAttribute("page", page);
			req.setAttribute("totalPage", totalPage);
			req.getRequestDispatcher("/WEB-INF/webPage/delivery.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("/404.html");
		}
		
		
		
		
		
		/*
		List<Object> qnas = new CommonDAOImpl().findByCondition(Qna.class, "SELECT * FROM tb_qna ORDER BY questionID desc", null);
		if(qnas.size()>0){
			
			req.setAttribute("qnas", qnas);
			req.getRequestDispatcher("WEB-INF/webPage/delivery.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("/404.html");
		}
		*/
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
