package org.yun.app.servlet;

import java.io.IOException;
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
 * Servlet implementation class BuyProductServlet
 */
@WebServlet("/BuyProductServlet")
public class BuyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int productId = Integer.parseInt(request.getParameter("productId"));
		List<CartPage> cartPages = (List<CartPage>) request.getSession().getAttribute("cartPages");
		if (null!=cartPages) {// 鐢ㄦ埛涓嶆槸绗竴娆℃坊鍔犺喘鐗╄溅
			boolean isExist = false;// 榛樿璐墿杞︿腑涓嶅瓨鍦ㄧ浉鍚岀殑鍟嗗搧
			// 閬嶅巻璐墿杞︼紝濡傛灉瀛樺湪鐩稿悓鐨勫晢鍝佸氨浣垮叾鏁伴噺鍔犱竴锛屽苟灏唅sExist璁剧疆涓簍rue
			for (int index = 0; index < cartPages.size(); index++) {
				// 閸掋倖鏌囬崯鍡楁惂缂傛牕褰块弰顖氭儊閻╃鎮�
				if (cartPages.get(index).getProductId() == productId) {
					int tempNum = cartPages.get(index).getProductNum() + 1;
					cartPages.get(index).setProductNum(tempNum);
					String sql = "UPDATE tb_cartitem SET productNum=? WHERE cartId=? and productId=?";
					int row = new CommonDAOImpl().updateDataBase(sql,
							new Object[] { tempNum, cartPages.get(index).getCartId(), productId });
					isExist = true;
					System.out.println(row);
				}
			}
			if (!isExist) {// 娑撳秴鐡ㄩ崷銊ф祲閸氬苯鏅㈤崫锟�
				String sql = "INSERT INTO tb_cartitem (id,productId,productNum,addTime,cartId) VALUES (null,?,?,?,?);";
				int row = new CommonDAOImpl().updateDataBase(sql, new Object[] { productId, 1,
						new Timestamp(System.currentTimeMillis()), cartPages.get(0).getCartId() });
			}
		} else {// 閻€劍鍩涚粭顑跨濞嗏剝鍧婇崝鐘哄枠閻椻晞婧�
			List<Object> tempCarts = new CommonDAOImpl().findByCondition(Cart.class,
					"SELECT * FROM tb_cart WHERE userId=?", new Object[] { user.getUserID() });
			Cart tempCart = (Cart) tempCarts.get(0);
			String sql = "INSERT INTO tb_cartitem (id,productId,productNum,addTime,cartId) VALUES (null,?,?,?,?);";
			int row = new CommonDAOImpl().updateDataBase(sql,
					new Object[] { productId, 1, new Timestamp(System.currentTimeMillis()), tempCart.getCartId() });
			
		}
		
		request.getSession().setAttribute("cartPages", cartPages);
		int a = (int) request.getSession().getAttribute("num");
		request.getSession().setAttribute("num", a+1);
		response.sendRedirect("cart.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
