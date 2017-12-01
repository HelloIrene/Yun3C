package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Cart;
import org.yun.app.entity.CartItem;
import org.yun.app.entity.CartPage;
import org.yun.app.entity.Product;
import org.yun.app.entity.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart.html")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");   
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/;html");  
		// 检验用户是否登录，如果登录就可以查看购物车页面，否则跳转到登录页面
		User user = (User) request.getSession().getAttribute("user");
		if (null == user) {
			response.sendRedirect(response.encodeURL("userlogin.html"));
			return;
		}

		List<CartPage> cartPages = new ArrayList<>();
		CommonDAOImpl commDao = new CommonDAOImpl();
		String sql = "SELECT * FROM tb_cart WHERE userId=?";
		int userId = user.getUserID();
		List<Object> cartList = commDao.findByCondition(Cart.class, sql, new Object[] { userId });
		if (cartList.isEmpty()) {//如果购物车数据库为空
			//为用户创建一个购物车
			commDao.updateDataBase("INSERT INTO tb_cart (cartId,userId) VALUES (null,?)", new Object[]{userId});
			// 弹出对话框你的购物车为空，请进入首页购物，设置为3秒后自动跳转
			PrintWriter out = response.getWriter();
			out.print("<script>alert('购物车为空，自动跳转到首页');window.location.href='index.html'</script>");
			out.flush();
			out.close();
		} else {// 购物车不为空，则查找cartItem表中对应cartID的数据，将其存放在request.session中
			String sqlCart = "SELECT * FROM tb_cartitem WHERE cartId=?";
			Cart cart = (Cart) cartList.get(0);
			int cartId = cart.getCartId();
			List<Object> cartItems = commDao.findByCondition(CartItem.class, sqlCart, new Object[] { cartId });
			if (cartItems.size() > 0) {
				for (int index = 0; index < cartItems.size(); index++) {
					CartItem tempCartItem = (CartItem) cartItems.get(index);
					Product tempProduct = (Product) commDao.findOneByCondition(Product.class,
							"SELECT * FROM tb_product WHERE ProductId=?", new Object[] { tempCartItem.getProductId() });
					CartPage tempCartPage = new CartPage();
					tempCartPage.setCartId(cartId);
					tempCartPage.setProductId(tempProduct.getProductID());
					tempCartPage.setImagePath(tempProduct.getImgPath());
					tempCartPage.setProductName(tempProduct.getProductName());//
					// tempCartPage.setSpecificationsModel(tem);//
					tempCartPage.setPrice(tempProduct.getPrice());
					tempCartPage.setProductNum(tempCartItem.getProductNum());
					tempCartPage.setAddTime(tempCartItem.getAddTime());
					cartPages.add(tempCartPage);
				}
				request.getSession().setAttribute("cartPages", cartPages);
				request.getRequestDispatcher("/WEB-INF/webPage/cart.jsp").forward(request, response);
			} else {
				// 弹出对话框你的购物车项为空，请进入首页购物，设置为3秒后自动跳转
				PrintWriter out = response.getWriter();
				out.print("<script>alert('购物车为空，自动跳转到首页');window.location.href='index.html'</script>");
				out.flush();
				out.close();
			}
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
