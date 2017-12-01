package org.yun.app.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.CartPage;
import org.yun.app.entity.OrderPage;

/**
 * Servlet implementation class PaySuccessServlet
 */
@WebServlet("/paysuccess.html")
public class PaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderPage orderPage = (OrderPage) request.getSession().getAttribute("orderPage");
		List<CartPage> orderCartItems = (List<CartPage>) request.getSession().getAttribute("orderCartItems");
		CommonDAOImpl commDao = new CommonDAOImpl();
		String orderId = orderPage.getOrder().getOrderId();
		String paymentMethod = orderPage.getOrder().getPaymentMethod();
		Timestamp orderTime = orderPage.getOrder().getOrderTime();
		int userId = orderPage.getUserId();
		String orderStatus = "已支付";
		String freight = orderPage.getOrder().getFreight();
		BigDecimal tempPayAmount = orderPage.getOrder().getPaymentAmount();
		
		Timestamp paymentTime = new Timestamp(System.currentTimeMillis());
		String receiver = orderPage.getReceiver();
		String user_phone = orderPage.getUser_phone();
		String user_address = orderPage.getUser_address();
		String sql = "INSERT INTO tb_order (orderId,paymentMethod,orderTime,userId,orderStatus,freight,"
				+ "paymentAmount,paymentTime,receiver,user_phone,user_address) VALUES(?,?,?,?,?,?,?,?,?,?,?) ";
		Object[] params = { orderId, paymentMethod, orderTime, userId, orderStatus, freight, tempPayAmount,
				paymentTime, receiver,user_phone,user_address};
		int row = commDao.updateDataBase(sql, params);
		if(row>0){
			for(int index=0;index<orderCartItems.size();index++){
				int productId = orderCartItems.get(index).getProductId();
				int productNum = orderCartItems.get(index).getProductNum();
				BigDecimal tempTotalPrice = orderCartItems.get(index).getPrice();
				BigDecimal tempNum = new BigDecimal(productNum);
				BigDecimal totalPrice = tempTotalPrice.multiply(tempNum).setScale(2, BigDecimal.ROUND_HALF_UP);
				String tempSql = "INSERT INTO tb_orderitem (null,productId,productNum,totalPrice,orderId) VALUES(?,?,?,?) ";
				Object[] tempParams = {productId,productNum,totalPrice,orderId};
				int tempRow = commDao.updateDataBase(tempSql, tempParams);
				if(tempRow<0){
					continue;
				}
			}
		}
		request.getRequestDispatcher("/WEB-INF/webPage/paysuccess.jsp").forward(request, response);
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
