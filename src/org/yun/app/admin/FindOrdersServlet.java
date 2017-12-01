package org.yun.app.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.entity.Order;
import org.yun.app.entity.User;
import org.yun.app.service.OrderService;

/**
 * Servlet implementation class FindOrdersServlet
 */
@WebServlet("/FindOrdersServlet")
public class FindOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderByUserId = request.getParameter("orderByUserId");
		if ("".equals(orderByUserId) || null == orderByUserId) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date startTime = new Date();
			Date endTime = new Date();
			try {
				startTime = df.parse((String) request.getParameter("startTime"));
				endTime = df.parse((String) request.getParameter("endTime"));
			} catch (Exception e) {
			}
			if (null != startTime && endTime == null) {
				List<Order> orders = new OrderService().findOrderByTime((java.sql.Date) startTime);
				request.getSession().setAttribute("orders", orders);
			}
			if (null != startTime && null != endTime) {
				List<Order> orders = new OrderService().findOrderBetweenTime((java.sql.Date) startTime,
						(java.sql.Date) endTime);
				request.getSession().setAttribute("orders", orders);
			}
		} else {
			int userId = Integer.parseInt(orderByUserId);
			List<Order> orders = new OrderService().findOrdersByUserId(userId);
			request.getSession().setAttribute("orders", orders);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
