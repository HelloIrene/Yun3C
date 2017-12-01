package org.yun.app.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.CartPage;

/**
 * Servlet implementation class SettlementServlet
 */
@WebServlet("/order.html")
public class SettlementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tempStr = request.getParameter("params");
		System.out.println(tempStr);
		if ("".equals(tempStr) || null == tempStr) {
			request.getRequestDispatcher("/WEB-INF/webPage/cart.jsp").forward(request, response);
		} else {
			String[] strs = tempStr.split("abcde");// 拆分参数得到被选中的商品编号
			
			List<CartPage> cartPages = (List<CartPage>) request.getSession().getAttribute("cartPages");
			System.out.println(cartPages.toString());
			List<CartPage> orderCartItems = new ArrayList<>();
			BigDecimal tempSum = new BigDecimal(0);
			for (int index = 1; index < strs.length; index++) {
				System.out.println(strs[index]);
				for (int i = 0; i < cartPages.size(); i++) {
					int temp = Integer.parseInt(strs[index]);
					System.out.println("======商品号是否相同=======");
					System.out.println(temp==cartPages.get(i).getProductId());
					if (temp==cartPages.get(i).getProductId()) {
						BigDecimal tempPrice = cartPages.get(i).getPrice();
						int tempNum = cartPages.get(i).getProductNum();
						BigDecimal tempMu = tempPrice.multiply(new BigDecimal(tempNum));
						System.out.println(tempMu);
						tempSum = tempSum.add(tempMu);
						System.out.println(tempSum);
						orderCartItems.add(cartPages.get(i));
						String sql = "DELETE FROM tb_cartitem WHERE cartId=? AND productId=?";
						int row = new CommonDAOImpl().updateDataBase(sql,
								new Object[] { cartPages.get(i).getCartId(), temp});
						cartPages.remove(i);
						System.out.println("=============");
						System.out.println(row);
					}
				}
			}
			System.out.println("原来的购物车");
			System.out.println(cartPages.toString());
			System.out.println(orderCartItems.toString());
			request.getSession().setAttribute("tempSum", tempSum);
			request.getSession().setAttribute("cartPages", cartPages);
			request.getSession().setAttribute("orderCartItems", orderCartItems);
			request.getRequestDispatcher("/WEB-INF/webPage/order.jsp").forward(request, response);
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
