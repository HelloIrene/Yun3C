package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Cart;
import org.yun.app.entity.CartPage;
import org.yun.app.entity.User;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet.html")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int productId = Integer.parseInt(request.getParameter("productId"));
		int number = Integer.parseInt(request.getParameter("number"));
		List<CartPage> cartPages = (List<CartPage>) request.getSession().getAttribute("cartPages");

		// 遍历购物车，如果存在相同的商品就使其数量加一，并将isExist设置为true
		for (int index = 0; index < cartPages.size(); index++) {
			// 鍒ゆ柇鍟嗗搧缂栧彿鏄惁鐩稿悓
			if (cartPages.get(index).getProductId() == productId) {
				cartPages.get(index).setProductNum(number);
				String sql = "UPDATE tb_cartitem SET productNum=? WHERE cartId=? and productId=?";
				int row = new CommonDAOImpl().updateDataBase(sql,
						new Object[] { number, cartPages.get(index).getCartId(), productId });

			}
		}
	}
}
