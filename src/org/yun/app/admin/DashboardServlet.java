/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月19日
* Time: 上午9:48:19
*/

package org.yun.app.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Order;
import org.yun.app.service.OrderService;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/main.html")
public class DashboardServlet extends CommonServlet{

	/**
	 * 
	 */ 
	private static final long serialVersionUID = 4144891784330167458L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Order> orders = new OrderService().findOrderByTime(new Date(System.currentTimeMillis()));
		CommonDAOImpl dao = new CommonDAOImpl();
		int orderNum = orders.size();
		req.setAttribute("orderNum", orderNum);
		//SELECT COUNT(productID) FROM tb_Product
		int userNum = dao.findTotal("SELECT COUNT(userID) FROM tb_user", null);
		int QNo =dao.findTotal("SELECT COUNT(questionID) FROM tb_qna", null);
		req.setAttribute("userNum", userNum);
		req.setAttribute("Newquestions", QNo-13);
		req.getRequestDispatcher("/WEB-INF/webPage/dashboard/main.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
