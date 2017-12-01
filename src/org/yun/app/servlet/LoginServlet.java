package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yun.app.entity.Cart;
import org.yun.app.entity.CartItem;
import org.yun.app.entity.CartPage;
import org.yun.app.entity.Product;
import org.yun.app.entity.User;

import org.yun.app.dao.CommonDAOImpl;

@WebServlet("/userlogin.html")
public class LoginServlet extends CommonServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		List<Object> peoples = new ArrayList<Object>();
		String name = req.getParameter("loginname");
		String pwd = req.getParameter("loginpwd");
		CommonDAOImpl dao = new CommonDAOImpl();
		peoples = dao.findByCondition(User.class, "SELECT * FROM tb_user WHERE (loginname=? OR email=?) AND loginpwd=?", name,name,pwd);
		int num =0;
		if (peoples.size() > 0) {
			User user = (User) peoples.get(0);
			List<CartPage> cartPages = new ArrayList<>();
			CommonDAOImpl commDao = new CommonDAOImpl();
			String sql = "SELECT * FROM tb_cart WHERE userId=?";
			int userId = user.getUserID();
			List<Object> cartList = commDao.findByCondition(Cart.class, sql, new Object[] { userId });
			if (cartList.isEmpty()) {//濡傛灉璐墿杞︽暟鎹簱涓虹┖
				//涓虹敤鎴峰垱寤轰竴涓喘鐗╄溅
				commDao.updateDataBase("INSERT INTO tb_cart (cartId,userId) VALUES (null,?)", new Object[]{userId});
				
			} else {// 璐墿杞︿笉涓虹┖锛屽垯鏌ユ壘cartItem琛ㄤ腑瀵瑰簲cartID鐨勬暟鎹紝灏嗗叾瀛樻斁鍦╮equest.session涓�
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
						tempCartPage.setProductId(tempProduct.getProductID());
						tempCartPage.setImagePath(tempProduct.getImgPath());
						tempCartPage.setProductName(tempProduct.getProductName());//
						// tempCartPage.setSpecificationsModel(tem);//
						tempCartPage.setPrice(tempProduct.getPrice());
						tempCartPage.setProductNum(tempCartItem.getProductNum());
						tempCartPage.setAddTime(tempCartItem.getAddTime());
						cartPages.add(tempCartPage);
					}
					req.getSession().setAttribute("cartPages", cartPages);
				} 
			}
			HttpSession session = req.getSession();
			int cartnum = 0;
			cartnum = cartPages.size();
			session.setAttribute("user", user);
			session.setAttribute("num", cartnum);
			resp.sendRedirect(resp.encodeURL("/shopping/index.html"));
		} else {
			resp.sendRedirect(resp.encodeURL("userlogin.html"));
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}
}
