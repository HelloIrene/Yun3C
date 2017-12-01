package org.yun.app.admin;

import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Order;
import org.yun.app.service.OrderService;
import org.apache.catalina.Context;
import org.apache.catalina.Manager;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.RequestFacade;

/**
 * Servlet implementation class AdmainPageServlet
 */
@WebServlet("/dashboard/dashindex.html")
public class AdmainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> orders = new OrderService().findOrderByTime(new Date(System.currentTimeMillis()));
		CommonDAOImpl dao = new CommonDAOImpl();
		int orderNum = orders.size();
		request.setAttribute("orderNum", orderNum);
		//SELECT COUNT(productID) FROM tb_Product
		int activeSessions = 1;
	    if (request instanceof RequestFacade) {
	      Field requestField = null;
		try {
			requestField = request.getClass().getDeclaredField("request");
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      requestField.setAccessible(true);
	      Request req = null;
		try {
			req = (Request) requestField.get(request);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      Context context = req.getContext();
	      Manager manager = context.getManager();
	      activeSessions = manager.getActiveSessions();
	    }
		int userNum = dao.findTotal("SELECT COUNT(userID) FROM tb_user", null);
		int QNo =dao.findTotal("SELECT COUNT(questionID) FROM tb_qna", null);
		request.setAttribute("userNum", userNum);
		request.setAttribute("Newquestions", QNo-13);
		request.setAttribute("activePoeple", activeSessions);
		request.getRequestDispatcher("/WEB-INF/webPage/dashboard/dashboardindex.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
