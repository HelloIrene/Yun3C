package org.yun.app.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.entity.CartPage;
import org.yun.app.entity.Order;
import org.yun.app.entity.OrderItem;
import org.yun.app.entity.OrderPage;
import org.yun.app.entity.Product;
import org.yun.app.service.OrderDetailsService;

/**
 * Servlet implementation class OrderDetailsServlet
 */
@WebServlet("/dashboard/orderDetails.html")
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> orders = (List<Order>) request.getSession().getAttribute("orders");
		String orderId = request.getParameter("orderId");
		Order order = new Order();
		for(int index=0;index<orders.size();index++){
			if(orderId.equals(orders.get(index).getOrderId())){
				order = orders.get(index);
			}
		}
		OrderPage orderDetails = new OrderDetailsService().getOrderPage(orderId);
		orderDetails.setOrder(order);
		List<CartPage> orderProducts = new ArrayList<>();
		List<OrderItem> orderItems = orderDetails.getOrderItems();
		List<Product> products = orderDetails.getProducts();
		for(int index=0;index<orderItems.size();index++){
			int productId = orderItems.get(index).getProductId();
			for(int i=0;i<products.size();i++){
				if(productId==products.get(i).getProductID()){
					CartPage tempCart = new CartPage();
					tempCart.setImagePath(products.get(i).getImgPath());
					tempCart.setPrice(products.get(i).getPrice());
					tempCart.setProductName(products.get(i).getProductName());
					tempCart.setProductNum(orderItems.get(index).getProductNum());
					tempCart.setSpecificationsModel(products.get(i).getProductType());
					orderProducts.add(tempCart);
				}
			}
		}
		request.getSession().setAttribute("orderProducts", orderProducts);
		request.getSession().setAttribute("orderDetails", orderDetails);
		request.getRequestDispatcher("/WEB-INF/webPage/orderDetails.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
