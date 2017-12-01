package org.yun.app.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.entity.CartPage;
import org.yun.app.entity.Order;
import org.yun.app.entity.OrderPage;
import org.yun.app.entity.User;
import org.yun.app.util.CreateOrderNo;



/**
 * Servlet implementation class SubmitOrderServlet
 */
@WebServlet("/pay.html")
public class SubmitOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String receiver = request.getParameter("receiver");
		String user_address = request.getParameter("user_address");
		String user_phone = request.getParameter("user_phone");
		String paymethod = request.getParameter("paymethod");
		String freight = request.getParameter("freight");
		String orderId = CreateOrderNo.getInstance().createOrderNo();
		System.out.println("=========自动创建订单号:" + orderId);
		int userId = user.getUserID();
		BigDecimal paymentAmount = (BigDecimal) request.getSession().getAttribute("tempSum");
		Timestamp orderTime = new Timestamp(System.currentTimeMillis());
		OrderPage orderPage = new OrderPage();
		orderPage.setReceiver(receiver);
		orderPage.setUser_address(user_address);
		orderPage.setUser_phone(user_phone);
		orderPage.setOrder(new Order());
		orderPage.getOrder().setPaymentMethod("货到付款");
		orderPage.getOrder().setFreight(freight);
		orderPage.getOrder().setOrderId(orderId);
		orderPage.setUserId(userId);
		orderPage.getOrder().setOrderTime(orderTime);
		orderPage.getOrder().setPaymentAmount(paymentAmount);
		System.out.println(orderPage.toString());
		request.getSession().setAttribute("orderPage", orderPage);
		request.getRequestDispatcher("/WEB-INF/webPage/pay.jsp").forward(request, response);
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
